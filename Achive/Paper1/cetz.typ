#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"

#let 光电化学平台 = cetz.canvas({
  import cetz.draw: *
  scale(0.75) // 整体再缩小一点
  
  // 压缩垂直高度
  let h = 4.2
  // let h-top = 6.5 // (未使用，保持原样或忽略)
  let w = 11.2 // 总宽度显著减小 (原 14.0)

  // 重新计算紧凑的X坐标
  let x-wall-L = 0
  let x-elec-b-L = 0.8 // 左电极左移变窄
  let x-elec-b-R = 1.5 // 宽度从1.0变0.7
  let x-mem-L = 7.5 // 膜左移 (原 8.5)
  let x-mem-R = 7.8 // 膜厚度0.3
  let x-elec-a-L = 9.5 // 右电极大幅左移 (原 11.5)
  let x-elec-a-R = 10.2 // 宽度0.7
  let x-wall-R = 11.2 // 右墙收紧 (原 13.5)

  // Styles
  let line-style = (stroke: 1pt + black)
  let thick-style = (stroke: 1.5pt + black)
  let membrane-style = (fill: gradient.linear(gray.lighten(30%), gray, angle: 90deg), stroke: 1pt)
  rect((x-wall-L, 0), (x-wall-R, h), ..line-style)

  // Top Frame Section (压缩高度 h+1.5 -> h+0.8)
  rect((x-wall-L, h), (x-wall-R, h + 0.8), ..line-style)

  // Electrodes - 延伸高度同步压缩
  line((x-elec-b-L, 0), (x-elec-b-L, h + 0.8), ..line-style)
  line((x-elec-b-R, 0), (x-elec-b-R, h + 0.8), ..line-style)

  line((x-elec-a-L, 0), (x-elec-a-L, h + 0.8), ..line-style)
  line((x-elec-a-R, 0), (x-elec-a-R, h + 0.8), ..line-style)

  // Membrane
  rect((x-mem-L, 0), (x-mem-R, h), ..membrane-style)

  line((x-wall-L, h), (x-wall-R, h), ..line-style)

  let box-w = 2.5
  let box-h = 0.8
  // 电路高度下沉 (h+2.5 -> h+1.6)
  let circuit-y = h + 1.6

  // Load Box
  rect((w / 2 - box-w / 2, circuit-y), (w / 2 + box-w / 2, circuit-y + box-h), ..thick-style, name: "load")
  content("load", text(size: 11pt)[用电器])

  // Wires (连接点改为 h+0.8)
  line(
    ((x-elec-b-L + x-elec-b-R) / 2, h + 0.8),
    ((x-elec-b-L + x-elec-b-R) / 2, circuit-y + box-h / 2),
    "load.west",
    ..thick-style,
  )
  line(
    ((x-elec-a-L + x-elec-a-R) / 2, h + 0.8),
    ((x-elec-a-L + x-elec-a-R) / 2, circuit-y + box-h / 2),
    "load.east",
    ..thick-style,
  )

  let vertical-text(s) = {
    let chars = s.clusters()
    align(center, stack(dir: ttb, spacing: 3pt, ..chars))
  }

  content(((x-elec-b-L + x-elec-b-R) / 2, h / 2), vertical-text("光催化电极"))
  content(((x-elec-b-L + x-elec-b-R) / 2, 0.5), [b])

  content(((x-elec-a-L + x-elec-a-R) / 2, h / 2), vertical-text("光催化电极"))
  content(((x-elec-a-L + x-elec-a-R) / 2, 0.5), [a])

  // Membrane Label
  line((x-mem-R, h - 0.2), (x-mem-R + 0.5, h + 0.5), stroke: 0.5pt)
  content((x-mem-R + 0.5, h + 0.8), [阳离子交换膜], anchor: "south")

  // Solution Labels (坐标随布局调整)
  line((4.5, 0), (4.5, -0.3), stroke: 1pt) // 原 5
  content((4.5, -0.5), [KOH溶液], anchor: "north")

  line((8.6, 0), (8.6, -0.3), stroke: 1pt) // 原 10
  content((8.6, -0.5), [$"KHCO"_3$溶液], anchor: "north")

  // Polymer Position (坐标微调以适应紧凑空间)
  let poly-y = 3.0 // 原 3.5
  let poly-x = 4.6 // 原 5.2

  content((poly-x - 2.8, poly-y), [#text(8pt)[HO]])

  // Bracket Left
  content((poly-x - 2.4, poly-y), text(size: 14pt)[$\[$])

  // C=O Group
  content((poly-x - 2.0, poly-y), [#text(8pt)[C]])
  line((poly-x - 2.0, poly-y + 0.2), (poly-x - 2.0, poly-y + 0.6), stroke: 1pt)
  content((poly-x - 2.0, poly-y + 0.8), [#text(8pt)[O]])

  // Bond to Benzene
  line((poly-x - 1.8, poly-y), (poly-x - 1.2, poly-y), stroke: 1pt)

  // Benzene Ring
  let ring-x = poly-x - 0.8
  let r = 0.35
  let hex-pts = ()
  for i in range(6) {
    hex-pts.push((ring-x + r * calc.cos(i * 60deg), poly-y + r * calc.sin(i * 60deg)))
  }
  line(..hex-pts, close: true, stroke: 1pt)
  circle((ring-x, poly-y), radius: r * 0.7, stroke: 0.5pt)

  // Bond to Ester
  line((ring-x + r, poly-y), (ring-x + r + 0.6, poly-y), stroke: 1pt)

  // Rest of chain
  content((poly-x + 1.4, poly-y -0.05), [#text(8pt)[$"COOCH"_2"CH"_2$O]])

  // Bracket Right and n
  content((poly-x + 2.9, poly-y), text(size: 14pt)[$\]_n$])
  content((poly-x + 3.1, poly-y), [#text(8pt)[H]])

  // Connecting lines
  line((poly-x - 2.3, poly-y), (poly-x - 2.1, poly-y), stroke: 1pt)

  // Degradation Product
  let deg-x = 3.0 // 原 3.5
  let deg-y = 1.2 // 原 1.5
  content((deg-x - 1.0, deg-y), [$"HO"$])

  // Zigzag line
  let z1 = (deg-x - 0.6, deg-y)
  let z2 = (deg-x - 0.3, deg-y + 0.4)
  let z3 = (deg-x + 0.0, deg-y)
  line(z1, z2, z3, stroke: 1pt)

  content((deg-x + 0.7, deg-y), [$"COO"^-$])

  // Reaction Arrow
  bezier(
    (poly-x - 2.5, poly-y - 0.5),
    (deg-x - 1.2, deg-y + 0.5),
    (poly-x - 3.5, poly-y - 1.5),
    (deg-x - 2.0, deg-y + 1.0),
    mark: (end: ">"),
    stroke: 1pt,
  )

  // Reaction Right (坐标微调)
  let react-x = 8.5 // 原 10.2
  let react-y = 2.1 // 原 2.5

  content((react-x, react-y + 0.8), [#text(8pt)[$"CO"_2$]])
  content((react-x - 0.2, react-y - 0.8), [#text(8pt)[CO]])

  // Arrows
  bezier(
    (react-x, react-y + 0.6),
    (x-elec-a-L, react-y + 0.1),
    (react-x + 0.5, react-y + 0.5),
    (x-elec-a-L + 0.2, react-y + 0.3),
    mark: (end: ">"),
    stroke: 1pt,
  )

  bezier(
    (x-elec-a-L, react-y - 0.1),
    (react-x, react-y - 0.6),
    (x-elec-a-L + 0.2, react-y - 0.3),
    (react-x + 0.5, react-y - 0.5),
    mark: (end: ">"),
    stroke: 1pt,
  )
})
#let 含碲有机物结构简式 = cetz.canvas({
  import cetz.draw: *
  scale(0.5)
  let s = 1.5
  let dx = s * calc.cos(30deg)
  let dy = s * calc.sin(30deg)

  // 设置样式
  set-style(stroke: (thickness: 1.5pt, cap: "round"))
  let mid_right_top = (dx, dy) // 对应之前的 j2_top
  let mid_right_bot = (dx, -dy) // 对应之前的 j2_bot
  let bridge_w = 1.2 * s
  let rb_left_top = (dx + bridge_w, dy)
  let rb_left_bot = (dx + bridge_w, -dy)
  let rb_center_x = dx + bridge_w + dx
  let rb_top = (rb_center_x, s)
  let rb_bot = (rb_center_x, -s)
  let rb_far_top = (rb_center_x + dx, dy)
  let rb_far_bot = (rb_center_x + dx, -dy)
  let te_pos = (dx + bridge_w * 0.5, s * 0.8)
  let l_far_top = (-3 * dx, dy)
  let l_far_bot = (-3 * dx, -dy)
  let l_top = (-2 * dx, s)
  let l_bot = (-2 * dx, -s)
  let l_join_top = (-dx, dy)
  let l_join_bot = (-dx, -dy)

  line(l_far_top, l_top, l_join_top, l_join_bot, l_bot, l_far_bot, close: true)

  // 左侧双键
  let d_off = 0.2 * s
  line((rel: (d_off, 0), to: l_far_top), (rel: (d_off, 0), to: l_far_bot))
  line((rel: (-d_off * 0.866, -d_off * 0.5), to: l_join_top), (rel: (-d_off * 0.866, -d_off * 0.5), to: l_top))
  line((rel: (-d_off * 0.866, d_off * 0.5), to: l_join_bot), (rel: (-d_off * 0.866, d_off * 0.5), to: l_bot))

  // 取代基
  line(l_top, (rel: (0, 0.6 * s), to: l_top))
  content((rel: (0, 0.85 * s), to: l_top), [$H_3"CO"$])
  line(l_far_bot, (rel: (-0.5 * s, -0.3 * s), to: l_far_bot))
  content((rel: (-1.2 * s, -0.4 * s), to: l_far_bot), [$H_3"CO"$])

  // 中间环主体
  let m_top = (0, s)
  let m_bot = (0, -s)
  line(l_join_top, m_top, mid_right_top) // 上沿

  // 羰基
  let o_len = 0.6 * s
  let o_gap = 0.05 * s
  line((rel: (-o_gap, 0), to: m_top), (rel: (-o_gap, o_len), to: m_top))
  line((rel: (o_gap, 0), to: m_top), (rel: (o_gap, o_len), to: m_top))
  content((rel: (0, o_len + 0.2 * s), to: m_top), [O])

  // 底部醚键
  line(l_join_bot, m_bot)
  line(m_bot, mid_right_bot)
  content(m_bot, box(fill: white, inset: 3pt, [O]))
  content(te_pos, box(fill: white, inset: 2pt, [Te]), name: "Te-node")

  // (B) 连接五元环
  // 从中间环上点 -> Te
  line(mid_right_top, "Te-node.west")
  line(mid_right_top, (1.3, -0.7))
  // 从 Te -> 右苯环左上点
  line("Te-node.east", rb_left_top)
  // 底部连线
  line(mid_right_bot, rb_left_bot)

  // (C) 绘制右侧苯环轮廓
  line(rb_left_top, rb_top, rb_far_top, rb_far_bot, rb_bot, rb_left_bot)
  // 稠合边 (五元环和六元环的公共边)
  line(rb_left_top, rb_left_bot)

  // (D) 右侧苯环的双键 (根据图片复刻)
  // 1. 左侧竖线内侧 (稠合处)
  line((rel: (d_off, 0), to: rb_left_top), (rel: (d_off, 0), to: rb_left_bot))

  // 2. 右上斜线内侧
  line(
    (rel: (-d_off * 0.866, -d_off * 0.5), to: rb_far_top),
    (rel: (-d_off * 0.866, -d_off * 0.5), to: rb_top),
  )

  // 3. 右下斜线内侧
  line(
    (rel: (-d_off * 0.866, d_off * 0.5), to: rb_far_bot),
    (rel: (-d_off * 0.866, d_off * 0.5), to: rb_bot),
  )
})
#let 一种可用于头孢菌素改性剂的物质的结构 = cetz.canvas({
  import cetz.draw: *
  scale(0.6)

  content((0, 0), [Y], name: "Y-top")

  // 顶部的 Z (位于 Y 正上方)
  content((0, 1.5), [Z], name: "Z")

  // 左下方的 Y 分支
  let y-left-pos = (-1.5, -2)
  content(y-left-pos, [Y], name: "Y-left")
  // 左边 Y 上方的 X
  content((rel: (0, 1.2), to: y-left-pos), [X], name: "X-left-up")
  // 左边 Y 左下的 X
  content((rel: (-0.8, -1.2), to: y-left-pos), [X], name: "X-left-down-1")
  // 左边 Y 右下的 X
  content((rel: (0.8, -1.2), to: y-left-pos), [X], name: "X-left-down-2")

  // 右下方的 W 分支
  let w-pos = (1.5, -2)
  content(w-pos, [W], name: "W")
  // W 右上方的 X
  content((rel: (1.2, 1.2), to: w-pos), [X], name: "X-right")


  // 设置线条样式
  set-style(stroke: (thickness: 1.2pt, cap: "round"))

  // (A) 绘制顶部的双键 Z=Y
  // 通过计算锚点偏移量来画两条平行线
  let offset = 0.08
  line(
    (rel: (-offset, 0), to: "Z.south"),
    (rel: (-offset, 0), to: "Y-top.north"),
  )
  line(
    (rel: (offset, 0), to: "Z.south"),
    (rel: (offset, 0), to: "Y-top.north"),
  )
  line("Y-top", "Y-left")
  line("Y-top", "W")
  line("Y-left", "X-left-up")
  line("Y-left", "X-left-down-1")
  line("Y-left", "X-left-down-2")

  line("W", "X-right")
})
#let 晶体空间结构示例 = cetz.canvas({
  import cetz.draw: *
  let solid-style = (stroke: (thickness: 1pt))
  let dashed-style = (stroke: (thickness: 0.5pt, dash: "dashed", paint: black))
  for y in (0, 1, 2) {
    for z in (0, 1, 2) {
      // 只有位于前表面(y=0)或上表面(z=2)的线才是可见的实线
      let style = if y == 0 or z == 2 { solid-style } else { dashed-style }
      line((0, y, z), (2, y, z), ..style)
    }
  }

  for x in (0, 1, 2) {
    for z in (0, 1, 2) {
      // 只有位于右表面(x=2)或上表面(z=2)的线才是可见的实线
      let style = if x == 2 or z == 2 { solid-style } else { dashed-style }
      line((x, 0, z), (x, 2, z), ..style)
    }
  }
  for x in (0, 1, 2) {
    for y in (0, 1, 2) {
      // 只有位于右表面(x=2)或前表面(y=0)的线才是可见的实线
      let style = if x == 2 or y == 0 { solid-style } else { dashed-style }
      line((x, y, 0), (x, y, 2), ..style)
    }
  }
})
#let 滴定曲线 = cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *
  scale(0.5)
  // 定义模拟滴定曲线的函数
  let f(x) = 2 + 10 / (1 + calc.exp(-0.3 * (x - 30)))

  // 1. 绘制图表
  plot.plot(
    size: (8, 6),
    name: "chart", // 【关键】命名图表，以便后续引用坐标
    x-tick-step: none,
    y-tick-step: none,
    x-min: 0,
    x-max: 80,
    y-min: 0,
    y-max: 14,
    x-label: text("时间/s"),
    y-label: text("pH"),
    axis-style: "school-book",
    x-ticks: ((50, [50]),),
    y-ticks: ((5, [5]), (7, [7]), (10, [10])),
    {
      // 绘制虚线
      plot.add(
        ((0, 7), (30, 7)),
        style: (stroke: (dash: "dashed", thickness: 0.5pt)),
      )

      // 绘制曲线
      plot.add(
        domain: (0, 75),
        f,
        style: (stroke: (thickness: 1pt)),
      )

      // 绘制关键点 (M, N, P)
      let p_x = 45
      plot.add(((0, f(0)),), mark: "o", mark-style: (fill: black, stroke: none), mark-size: .15)
      plot.add(((30, 7),), mark: "o", mark-style: (fill: black, stroke: none), mark-size: .15)
      plot.add(((p_x, f(p_x)),), mark: "o", mark-style: (fill: black, stroke: none), mark-size: .15)

      // 【修复点】定义文字的锚点位置，而不是直接绘制 content
      plot.add-anchor("txt-M", (3, f(0) + 1))
      plot.add-anchor("txt-N", (33, 6.5))
      plot.add-anchor("txt-P", (p_x, f(p_x) - 1.5))
    },
  )
  content("chart.txt-M", text(size: 12pt, )[M])
  content("chart.txt-N", text(size: 12pt, )[N])
  content("chart.txt-P", text(size: 12pt, )[P])
})
#let 废SCR催化剂回收流程 = cetz.canvas({
  import cetz.draw: *
  let box-style = (
    stroke: 1pt,
    inset: 0.6em,
  )

  // 辅助函数：创建居中的步骤盒子
  let step(body) = box(..box-style, align(center + horizon, body))

  // 箭头样式
  let arrow-style = (
    mark: (end: ">", fill: black, scale: 0.8),
    stroke: 1pt,
  )

  // --- 1. 绘制节点 (Nodes) ---

  // [第一行] 主流程
  content((0, 0), [SCR\ 催化剂], name: "start")

  content((2.5, 0), step("球磨"), name: "ball-mill")
  content((5, 0), step("碱浸"), name: "alkali")
  content((7.5, 0), step("酸浸"), name: "acid")
  content((10, 0), step("热水解"), name: "hydrolysis")

  // 修复点 1: 化学式使用引号包裹，如 "TiO"
  content((12.5, 0), [$"TiO"_2 dot x "H"_2"O"$], name: "tio2", anchor: "west")

  // [第一行] 顶部输入原料
  // 修复点 2: 其他化学式也加上引号，保证正体显示
  content((rel: (0, 1.2), to: "alkali"), [$"NaOH"$], name: "in-naoh")
  content((rel: (0, 1.2), to: "acid"), [$"H"_2"SO"_4$], name: "in-h2so4")
  content((rel: (0, 1.2), to: "hydrolysis"), [$"H"_2"O"$], name: "in-h2o")

  // [第二行] 钒/钨流程
  content((5, -2.5), step("沉钒"), name: "vanadium")
  content((7.5, -2.5), step("沉钨"), name: "tungsten")
  content((10, -2.5), step("煅烧"), name: "calcine-w")

  content((12, -2.5), [$"WO"_3$], name: "wo3", anchor: "west")

  content((rel: (-0.5, -1.5), to: "vanadium"), [$"NH"_4"VO"_3$], name: "nh4vo3")
  content((rel: (0.5, -0.8), to: "vanadium.south"), [$"NH"_4"Cl"$], name: "in-nh4cl", anchor: "north")

  content((rel: (0, -1.5), to: "tungsten"), [$"HCl"+"CaCl"_2$], name: "in-hcl")

  // 左下角 V2O5
  content((rel: (-2.5, 0), to: "nh4vo3"), [$"V"_2"O"_5$], name: "v2o5")

  // --- 2. 绘制连线 (Edges) ---

  // 主线
  line("start", "ball-mill", ..arrow-style)
  line("ball-mill", "alkali", ..arrow-style)
  line("alkali", "acid", ..arrow-style)
  line("acid", "hydrolysis", ..arrow-style)
  line("hydrolysis", "tio2", ..arrow-style)

  // 顶部输入
  line("in-naoh.south", "alkali.north", ..arrow-style)
  line("in-h2so4.south", "acid.north", ..arrow-style)
  line("in-h2o.south", "hydrolysis.north", ..arrow-style)

  // 第一行到第二行
  line("alkali.south", "vanadium.north", ..arrow-style)

  // 第二行水平
  line("vanadium", "tungsten", ..arrow-style)
  line("tungsten", "calcine-w", ..arrow-style)
  line("calcine-w", "wo3", mark: (end: ">", fill: black), stroke: (dash: "dashed"))

  // 底部交互
  line((rel: (-0.5, 0), to: "vanadium.south"), "nh4vo3.north", ..arrow-style)
  line("in-nh4cl.north", (rel: (0.5, 0), to: "vanadium.south"), ..arrow-style)
  line("in-hcl.north", "tungsten.south", ..arrow-style)

  line("nh4vo3", "v2o5", ..arrow-style, name: "line-v-calcine")
  content("line-v-calcine", [煅烧], anchor: "south", padding: 3pt)
})
#let 反应历程图 = cetz.canvas({
  import cetz.draw: *
  scale(0.6)
  // --- Configuration ---
  // 这里修改了参数让图变窄
  let scale-x = 0.85 // 水平缩放比例 (原 1.3)
  let scale-y = 2.0 // 垂直缩放比例 (保持不变)
  let step-w = 0.7 // 每个能量台阶的宽度 (原 1.0)
  let slope-w = 0.2 // 连接斜线的水平宽度 (原 0.4)

  // --- Data Definition ---
  // (y-value, label)
  let steps = (
    (0.0, [$"CO"_2(g)+3"H"_2(g)$]),
    (-1.65, [$"CO"_2(g)+6"H"^*$]),
    (-1.75, [$"CO"^*+6"H"^*$]),
    (-1.15, [过渡态1]),
    (-1.90, [$"HCOO"^*+5"H"^*$]),
    (-0.60, [过渡态2]),
    (-1.25, [$"HCOOH"^*+4"H"^*$]),
    (-0.55, [过渡态3]),
    (-0.80, [$"H"_2"COOH"^*+3"H"^*$]),
    (-0.45, [过渡态4]),
    (-0.70, [$"CH"_2"O"^*+"OH"^*+3"H"^*$]),
    (-0.55, [过渡态5]),
    (-1.30, [$"CH"_2"O"^*+2"H"^*+"H"_2"O"(g)$]),
    (-0.95, [$"CH"_3"O"^*+"H"^*+"H"_2"O"(g)$]),
    (-0.20, [过渡态6]),
    (-1.60, [$"CH"_3"OH"^*+"H"_2"O"(g)$]),
    (-1.10, [$"CH"_3"OH"(g)+"H"_2"O"(g)$]),
  )

  // --- Axes Drawing ---
  // Y-axis
  line((0, -2.5 * scale-y), (0, 1.0 * scale-y), mark: (end: ">", size: 0.2), name: "y-axis")
  content((-1.5, 1.1 * scale-y - 3.5), [相对能量/eV], angle: 90deg, anchor: "west")

  // Y-axis Ticks
  for i in range(-5, 2) {
    let val = i * 0.5
    let y-pos = val * scale-y
    line((0, y-pos), (-0.15, y-pos))
    content((-0.2, y-pos), str(val), anchor: "east", size: 9pt)
  }

  // X-axis
  let total-width = steps.len() * (step-w + slope-w) * scale-x
  line((0, -2.5 * scale-y), (total-width + 0.5, -2.5 * scale-y), mark: (end: ">", size: 0.2))
  content((total-width / 2 + 6, -2.5 * scale-y + 0.4), [反应历程])

  // --- Plotting the Reaction Path ---
  let current-x = 0.3 // 起始位置也稍微靠左一点
  let prev-end = none

  for (i, pt) in steps.enumerate() {
    let (energy, label) = pt
    let y = energy * scale-y

    // Calculate start and end points for the horizontal step
    let start-pt = (current-x, y)
    let end-pt = (current-x + step-w * scale-x, y)

    // Draw diagonal connection from previous step
    if prev-end != none {
      line(prev-end, start-pt)
    }

    // Draw the horizontal step
    line(start-pt, end-pt)

    // Draw the label
    content(
      (current-x + (step-w * scale-x / 2), y + 0.15),
      text(size: 9pt, label),
      angle: 90deg,
      anchor: "west",
    )

    // Update coordinates for next iteration
    prev-end = end-pt
    current-x = end-pt.at(0) + slope-w * scale-x
  }
})
#let atom-radius-2d = 0.25
#let atom-radius-3d = 0.18
#let bond-width-2d = 1pt
#let bond-width-3d = 2.5pt
#let text-size = 10pt
#let 黑磷层状投影 = cetz.canvas({
  import cetz.draw: *
  group(name: "left-diagram", {
    let dx = 1.2
    let dy = 0.7
    scale(0.6)
    // Helper to draw "P" atom with background mask
    let draw-p(x, y) = {
      content((x, y), box(fill: white, inset: 2pt, [$upright(P)$]), anchor: "center")
    }

    let cols = 4
    let rows = 2

    // Draw Bonds
    for c in range(cols + 1) {
      for r in range(rows + 1) {
        // Calculate base position
        // Staggered columns: Odd columns are shifted down
        let x1 = float(c) * dx
        let shift = if calc.odd(c) { dy * 2.0 } else { 0.0 }
        let y-top = float(r) * dy * 4.0 + shift

        // Define the two atoms in the vertical pair
        let p-top = (x1, -y-top)
        let p-bot = (x1, -(y-top + dy))

        // 1. Vertical Bond
        line(p-top, p-bot, stroke: bond-width-2d)

        // 2. Diagonal Bonds to the Right (if not last column)
        if c < cols {
          // Logic:
          // If current col is EVEN:
          //   Bot atom connects to Right-col Top atom (Down-Right)
          //   Top atom connects to Right-col Bot atom of PREVIOUS row?
          //   Let's look at the hexagonal structure:
          //   Even Col Bot (y) connects to Odd Col Top (y+dy)

          let x-right = (c + 1) * dx
          // Odd column shift is dy*2
          // The "Top" atom of the odd column in the same row index `r` is at:
          let y-right-top = float(r) * dy * 4.0 + dy * 2.0

          // Top of current (Even) connects to Bottom of (Odd, r-1)? No.
          // Let's strictly follow standard honeycomb:
          // Bottom of Even(r) -> Top of Odd(r)
          // Top of Even(r) -> Bottom of Odd(r-1)

          if calc.even(c) {
            // Connection: Bot(Even) -> Top(Odd)
            let p-right-top = (x-right, -y-right-top)
            line(p-bot, p-right-top, stroke: bond-width-2d)

            // Connection: Top(Even) -> Bot(Odd, prev row)
            // Or visually: Top(Even) goes Up-Right
            let p-right-bot-prev = (x-right, -(y-right-top - dy * 4.0 + dy))
            // Only draw if valid or for stubs
            if r > 0 {
              line(p-top, (x-right, -(y-right-top - dy * 3.0)), stroke: bond-width-2d)
            } else {
              // Top row stubs (Up-Right)
              line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
            }
          } else {
            // If current col is ODD:
            // Bot(Odd) -> Top(Even, next r)
            // Top(Odd) -> Bot(Even, same r)

            // We only need to draw forward (to right) to avoid double drawing
            // Odd Col (c) to Even Col (c+1)
            let y-next-even-top = float(r) * dy * 4.0
            let y-next-even-bot = y-next-even-top + dy

            // Connection: Bot(Odd) -> Top(Even, next Row)
            // p-bot is (x1, -(y-top + dy))
            // Target is (x-right, -(y-next-even-top + dy*4)) -> (x-right, -y-next-even-top_next)
            // Let's simplify: Just mirror the Even->Odd logic.

            // Connection: Top(Odd) -> Bot(Even, same r)
            // p-top is (x1, -y-top). y-top = base + 2dy
            // Target Bot(Even) is at base + dy
            // The line goes Up-Right
            line(p-top, (x-right, -y-next-even-bot), stroke: bond-width-2d)

            // Connection: Bot(Odd) -> Top(Even, next r)
            // The line goes Down-Right
            // If r is last, draw stub
            if r < rows {
              line(p-bot, (x-right, -(y-next-even-top + dy * 4.0)), stroke: bond-width-2d)
            } else {
              line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
            }
          }
        }

        // 3. Stubs on Left Edge (c == 0)
        if c == 0 {
          // Even col (0).
          // Top atom needs Up-Left stub
          line(p-top, (x1 - dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
          // Bot atom needs Down-Left stub
          line(p-bot, (x1 - dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
        }

        // 4. Stubs on Right Edge (c == cols)
        if c == cols {
          // Check parity to decide direction
          if calc.even(c) {
            // Same as Left Edge mirrored?
            // Top atom needs Up-Right
            line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
            // Bot atom needs Down-Right
            line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
          } else {
            // Odd col at end
            // Top atom (low) needs Down-Right stub? No, it connected to Bot-Even-Left.
            // It needs Up-Right stub.
            line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
            line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
          }
        }
      }
    }

    // Draw Atoms (P Labels) on top of lines
    for c in range(cols + 1) {
      for r in range(rows + 1) {
        let x1 = float(c) * dx
        let shift = if calc.odd(c) { dy * 2.0 } else { 0.0 }
        let y-top = float(r) * dy * 4.0 + shift

        draw-p(x1, -y-top)
        draw-p(x1, -(y-top + dy))
      }
    }
  })
})
#let 黑磷的微观结构 = cetz.canvas({
  import cetz.draw: *
  scale(0.7)
  group(name: "right-diagram", anchor: "center", {
    // Helper to draw shaded atom
    let draw-atom(x, y) = {
      circle(
        (x, y),
        radius: atom-radius-3d,
        fill: gradient.radial(white, black, center: (30%, 30%), radius: 80%),
        stroke: none,
      )
    }

    // Function to draw one puckered layer
    let draw-layer(x-origin, y-origin) = {
      let w = 1.0 // zig-zag width
      let h = 0.6 // zig-zag height
      let d-x = 0.4 // perspective depth x
      let d-y = 0.3 // perspective depth y

      let reps = 4

      let front-top = ()
      let front-bot = ()
      let back-top = ()
      let back-bot = ()

      // Generate coordinates
      for i in range(reps) {
        let x0 = x-origin + float(i) * w * 2.0
        let y0 = y-origin

        // Front Zig-Zag
        front-top.push((x0, y0))
        front-bot.push((x0 + w / 2.0, y0 - h))
        front-top.push((x0 + w, y0))
        front-bot.push((x0 + w * 1.5, y0 - h))

        // Back Zig-Zag (shifted)
        back-top.push((x0 + d-x, y0 + d-y))
        back-bot.push((x0 + w / 2.0 + d-x, y0 - h + d-y))
        back-top.push((x0 + w + d-x, y0 + d-y))
        back-bot.push((x0 + w * 1.5 + d-x, y0 - h + d-y))
      }
      // Closing points
      let x-last = x-origin + float(reps) * w * 2.0
      front-top.push((x-last, y-origin))
      back-top.push((x-last + d-x, y-origin + d-y))

      // --- Draw Back Structure ---
      // Back Chain Line
      let back-chain = ()
      for i in range(back-bot.len()) {
        back-chain.push(back-top.at(i))
        back-chain.push(back-bot.at(i))
      }
      back-chain.push(back-top.last())
      line(..back-chain, stroke: (thickness: bond-width-3d, cap: "round"))

      // Cross Bonds (Back to Front)
      // In Black P, the "high" atoms connect to "low" atoms of the other chain?
      // Actually, looking at the structure:
      // High-Back connects to High-Front. Low-Back connects to Low-Front. (Rungs)
      for i in range(back-top.len()) {
        line(back-top.at(i), front-top.at(i), stroke: (thickness: bond-width-3d, cap: "round"))
      }
      for i in range(back-bot.len()) {
        line(back-bot.at(i), front-bot.at(i), stroke: (thickness: bond-width-3d, cap: "round"))
      }

      // Back Atoms
      for pt in back-top { draw-atom(pt.at(0), pt.at(1)) }
      for pt in back-bot { draw-atom(pt.at(0), pt.at(1)) }

      // --- Draw Front Structure ---
      let front-chain = ()
      for i in range(front-bot.len()) {
        front-chain.push(front-top.at(i))
        front-chain.push(front-bot.at(i))
      }
      front-chain.push(front-top.last())
      line(..front-chain, stroke: (thickness: bond-width-3d, cap: "round"))

      // Front Atoms
      for pt in front-top { draw-atom(pt.at(0), pt.at(1)) }
      for pt in front-bot { draw-atom(pt.at(0), pt.at(1)) }
    }

    // Draw 3 stacked layers
    draw-layer(0, 0)
    draw-layer(0, -2.5)
    draw-layer(0, -5.0)

    // Scale Bar
    let scale-x = 9.5
    line((scale-x, 0.2), (scale-x, -2.2), mark: (start: ">", end: ">", size: 0.2), stroke: 1pt)
    content((scale-x + 0.2, -1.0), text(size: text-size)[0.5 mm], anchor: "west")
  })
})
#let 晶胞结构示意图 = cetz.canvas(length: 1.5cm, {
  import cetz.draw: *
  scale(0.5)
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