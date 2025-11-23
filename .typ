#import "@preview/cetz:0.4.2"

#set page(width: auto, height: auto, margin: 1cm)



#cetz.canvas(length: 1.5cm, {
  // 定义颜色和样式
let color-ga = black
let color-n = white
let stroke-bond = 2.5pt + black
let stroke-frame = 1.5pt + black
let atom-radius = 0.25
let to-screen(x, y, z) = {
  let angle = 30deg
  let depth-scale = 0.4
  let sx = x + z * depth-scale * calc.cos(angle)
  let sy = y + z * depth-scale * calc.sin(angle)
  // 返回字典格式，避免解析歧义
  (x: sx, y: sy) 
}


  let ga_locs = (
    (0,0,0), (4,0,0), (0,4,0), (4,4,0), // 前面
    (0,0,4), (4,0,4), (0,4,4), (4,4,4), // 后面
    (2,2,0), (2,2,4), // 前后面心
    (2,0,2), (2,4,2), // 上下面心
    (0,2,2), (4,2,2)  // 左右面心
  )

  // N 原子 (白色): 四面体间隙位置
  let n_locs = (
    (1,1,1), (3,3,1), 
    (1,3,3), (3,1,3)
  )

  // --- 2. 生成绘制对象列表 ---
  let objects = ()

  // A. 添加外框 (Cube Frame)
  let corners = ((0,0,0), (4,0,0), (4,4,0), (0,4,0), (0,0,4), (4,0,4), (4,4,4), (0,4,4))
  for i in range(corners.len()) {
    for j in range(i + 1, corners.len()) {
      let p1 = corners.at(i)
      let p2 = corners.at(j)
      let dist_sq = calc.pow(p1.at(0)-p2.at(0), 2) + calc.pow(p1.at(1)-p2.at(1), 2) + calc.pow(p1.at(2)-p2.at(2), 2)
      // 边长为4，平方为16 (使用近似比较防止浮点误差，虽然整数计算通常没事)
      if dist_sq >= 15.9 and dist_sq <= 16.1 {
        let center_z = (p1.at(2) + p2.at(2)) / 2.0
        objects.push((
          type: "line", 
          z: center_z - 0.1, 
          p1: p1, p2: p2, 
          style: stroke-frame
        ))
      }
    }
  }

  // B. 添加 N 原子 和 键
  for n_pos in n_locs {
    objects.push((type: "atom", sub: "N", pos: n_pos, z: n_pos.at(2)))
    
    for ga_pos in ga_locs {
      let dist_sq = calc.pow(n_pos.at(0) - ga_pos.at(0), 2) + calc.pow(n_pos.at(1) - ga_pos.at(1), 2) + calc.pow(n_pos.at(2) - ga_pos.at(2), 2)
      // 键长平方 = 3
      if dist_sq >= 2.9 and dist_sq <= 3.1 {
        let center_z = (n_pos.at(2) + ga_pos.at(2)) / 2.0
        objects.push((
          type: "bond",
          z: center_z,
          p1: n_pos,
          p2: ga_pos
        ))
      }
    }
  }

  // C. 添加 Ga 原子
  for ga_pos in ga_locs {
    objects.push((type: "atom", sub: "Ga", pos: ga_pos, z: ga_pos.at(2)))
  }

  // --- 3. 排序与绘制 (画家算法) ---
  let sorted_objects = objects.sorted(key: obj => -obj.z)

  for obj in sorted_objects {
    if obj.type == "line" {
      let start = to-screen(..obj.p1)
      let end = to-screen(..obj.p2)
      cetz.draw.line(start, end, stroke: obj.style)
    } else if obj.type == "bond" {
      let start = to-screen(..obj.p1)
      let end = to-screen(..obj.p2)
      cetz.draw.line(start, end, stroke: stroke-bond)
    } else if obj.type == "atom" {
      let xy = to-screen(..obj.pos)
      if obj.sub == "Ga" {
        cetz.draw.circle(xy, radius: atom-radius, fill: color-ga, stroke: none)
      } else {
        cetz.draw.circle(xy, radius: atom-radius, fill: color-n, stroke: 1.5pt + black)
      }
    }
  }

  // --- 4. 绘制图例 ---
  // 图例坐标也强制使用字典格式
  let legend-x = 6.5
  let legend-y = 2.5
  
  // Ga Legend
  cetz.draw.circle((x: legend-x, y: legend-y), radius: atom-radius, fill: color-ga, stroke: none)
  cetz.draw.line((x: legend-x + 0.5, y: legend-y), (x: legend-x + 1.2, y: legend-y), stroke: 2pt)
  cetz.draw.content((x: legend-x + 1.4, y: legend-y), text(size: 14pt, font: "Times New Roman")[Ga], anchor: "west")

  // N Legend
  cetz.draw.circle((x: legend-x, y: legend-y - 1.5), radius: atom-radius, fill: color-n, stroke: 1.5pt + black)
  cetz.draw.line((x: legend-x + 0.5, y: legend-y - 1.5), (x: legend-x + 1.2, y: legend-y - 1.5), stroke: 2pt)
  cetz.draw.content((x: legend-x + 1.4, y: legend-y - 1.5), text(size: 14pt, font: "Times New Roman")[N], anchor: "west")
})