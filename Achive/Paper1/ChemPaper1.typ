#import "@preview/typsium:0.2.0": ce
#import "@preview/cetz:0.4.2"
#import "@preview/lilaq:0.5.0" as lq
#set document(title: "2023-2024学年度武汉市部分学校高三年级调研考试 化学")
#set page(numbering: "1/1")
#set heading(level: 1, numbering: "一、")
#set text(font: "PingFang SC")
#let uline(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}

#align(left)[#text(font: "Heiti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[$2023-2024$学年度武汉市部分学校高三年级调研考试]])
#align(center)[#text(size: 1.8em, font: "Heiti SC")[化学]]

可能用到的相对原子质量: H—1 C—12 N—14 O—16 K—39 Fe—56 Cu—64 Ga—70

== 选择题: 本题共15小题,每小题3分,共45分。
1. 下列化工生产过程中,未涉及氧化还原反应的是
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 硫酸工业], [B. 氯碱工业], [C. 侯氏制碱], [D. 海水提溴],
  )

2. 灵秀湖北,千湖之省,水资源丰富。下列说法正确的是
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. #ce("H2O") 是弱电解质], [B. #ce("H2O") 结冰过程属于化学变化],
    [C. #ce("H2O") 和 #ce("D2O") 互为同位素], [D. #ce("H2O") 的 VSEPR 模型为 V 形],
  )

3. 劳动创造美好生活。下列与劳动项目相关的解释错误的是
  #figure(
    table(
      columns: (auto, auto, auto),
      inset: 6pt,
      align: center,
      [选项], [劳动项目], [解释],
      [A], [厨师炒菜添加少许味精], [谷氨酸钠是增味剂],
      [B], [医护人员利用酒精消毒], [乙醇具有强氧化性],
      [C], [农民为水稻施用硝酸钾], [硝酸钾可作复合肥],
      [D], [工人制作食品加少许维生素 C], [抗坏血酸具有抗氧化性],
    ),
    caption: none,
    supplement: none,
  )

4. 18 世纪 70 年代,瑞典化学家舍勒利用软锰矿与浓盐酸制得了氯气。某化学兴趣小组模拟舍勒利用以下装置制备氯气,能达到预期目的的是
  #figure(image("images/image.png"))
5. 如图是元素周期表的一部分。下列关于硼及其化合物的叙述错误的是
  #figure(
    table(
      columns: 2,
      align: center,
      [B], [],
      [Al], [Si],
    ),
  )
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 硼酸是一元弱酸], [B. 晶体硼为共价晶体],
    [C. 三氯化硼为离子化合物], [D. 硼单质能与强碱溶液反应产生氢气],
  )

5. 设 $N_A$ 为阿伏加德罗常数的值。下列说法正确的是 // Note: Question number repeated from page 1
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. $0.1$ mol #ce("NH4^+") 中氮的价层电子对数为 $0.4 N_A$],
    [B. $0.1$ $"mol" dot L^(-1)$ #ce("HCLO4") 溶液中 #ce("H^+") 的数目为 $0.1 N_A$],
    [C. 标准状况下, $2.24$ L 氯仿中分子数为 $0.1 N_A$],
    [D. 常温下, $5.6$ g Fe 与足量浓硝酸反应转移的电子数为 $0.3 N_A$],
  )

7. 我国科学家利用黑磷实现了高速场效应晶体管的应用尝试,黑磷的结构如图所示。下列说法错误的是

  #figure()[
    // Visual settings
    #let atom-radius-2d = 0.25
    #let atom-radius-3d = 0.18
    #let bond-width-2d = 1pt
    #let bond-width-3d = 2.5pt
    #let text-size = 10pt

    #grid(
      columns: 2,
      column-gutter: 80pt,
      align: center + horizon,
      [#figure(caption: [黑磷（层状投影）])[#cetz.canvas({
          import cetz.draw: *

          // ==========================================
          // LEFT DIAGRAM: 2D Projection (Hexagonal Network)
          // ==========================================
          group(name: "left-diagram", {
            let dx = 1.2
            let dy = 0.7

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

          // ==========================================
          // RIGHT DIAGRAM: 3D Microscopic Structure
          // ==========================================

          // ==========================================
          // PLACEMENT
          // ==========================================
        })]

      ],
      [#figure(caption: [黑磷的微观结构])[
        #cetz.canvas({
          import cetz.draw: *
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
        })]],
    )
  ]
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 黑磷与白磷互为同素异形体], [B. 1 mol 黑磷含有 3 mol $P-P$ 键],
    [C. 黑磷中 P 的杂化方式为 $s p^3$], [D. 黑磷层间作用为范德华力],
  )

8. 下列化学方程式中,不能正确表达反应变化的是
  #grid(
    columns: 1,
    gutter: 10pt,
    // [A. 铝粉和氧化铁组成的铝热剂用于焊接钢轨: $2 A l + F e_2 O_3 arrow("高温") A l_2 O_3 + 2 F e$],
    // [B. 向煤中加入石灰石实现燃煤脱硫: $2 Ca C O_3 + 2 S O_2 + O_2 arrow.t(Delta) 2 Ca S O_4 + 2 #ce("CO2")$],
    // [C. 向 $Mg(O H)_2$ 悬浊液中滴加 $Fe Cl_3$ 溶液: $3 Mg(O H)_2 (s) + 2 Fe Cl_3 (aq) === 2 Fe(O H)_3 (s) + 3 Mg Cl_2 (aq)$],
    // [D. 向甲醛中加入足量的银氨溶液并加热: $H C H O + 2 [ Ag(N H_3)_2 ] O H arrow.t(Delta) H C O O N H_4 + 2 Ag arrow.b + 3 N H_3 + #ce("H2") O$],
    image("images/image-12.png"),
  )

9. 碲元素(Te)位于周期表中第五周期 VIA 族,含碲有机物在医学、材料科学等领域发挥着独特的作用。某含碲有机物结构简式如图所示,下列说法错误的是
  #figure(
    caption: none,
  )[#cetz.canvas({
    import cetz.draw: *
    scale(0.5)

    // --- 基础参数 ---
    let s = 1.5
    let dx = s * calc.cos(30deg)
    let dy = s * calc.sin(30deg)

    // 设置样式
    set-style(stroke: (thickness: 1.5pt, cap: "round"))

    // ==========================
    // 1. 关键节点坐标定义
    // ==========================

    // --- A. 中间环的右侧边界 (连接点) ---
    let mid_right_top = (dx, dy) // 对应之前的 j2_top
    let mid_right_bot = (dx, -dy) // 对应之前的 j2_bot

    // --- B. 右侧苯环 (向右平移) ---
    // 我们假设五元环的底部宽度约为 1.2 倍边长，保持视觉平衡
    let bridge_w = 1.2 * s
    // 右苯环的左侧顶点 (稠合处)
    let rb_left_top = (dx + bridge_w, dy)
    let rb_left_bot = (dx + bridge_w, -dy)

    // 右苯环的其他顶点 (基于标准六边形计算)
    // 苯环水平宽度为 2*dx，中心在 left_x + dx
    let rb_center_x = dx + bridge_w + dx
    let rb_top = (rb_center_x, s)
    let rb_bot = (rb_center_x, -s)
    let rb_far_top = (rb_center_x + dx, dy)
    let rb_far_bot = (rb_center_x + dx, -dy)

    // --- C. Te 原子位置 ---
    // Te 位于五元环顶部，x 在连接点中间，y 向上突起
    let te_pos = (dx + bridge_w * 0.5, s * 0.8)


    // ==========================
    // 2. 绘制左侧和中间部分 (保持不变)
    // ==========================

    // 左侧苯环
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
    content((rel: (-0.8 * s, -0.3 * s), to: l_far_bot), [$H_3"CO"$])

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


    // ==========================
    // 3. 绘制右侧结构 (重写部分)
    // ==========================

    // (A) 放置 Te 节点
    // 使用白色背景遮挡连线
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
  })]
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 基态碲原子未成对电子数为 2],
    [B. 其中含氧官能团有 2 种],
    [C. 苯环上的一氯代物有 5 种],
    [D. 其中手性碳原子个数为 2],
  )

10. 一种可用于头孢菌素改性剂的物质的结构如图所示,其中 X、Y、Z、W 是原子序数递增的短周期主族元素。下列说法正确的是
  #figure(
    caption: none,
  )[

    #cetz.canvas({
      import cetz.draw: *
      scale(0.6)

      // -----------------------------
      // 1. 定义节点 (Nodes)
      // -----------------------------

      // 中心顶部的 Y
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

      // -----------------------------
      // 2. 绘制连线 (Edges)
      // -----------------------------

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

      // (B) 连接中心 Y 到下层结构
      line("Y-top", "Y-left")
      line("Y-top", "W")

      // (C) 连接左边 Y 的三个 X
      line("Y-left", "X-left-up")
      line("Y-left", "X-left-down-1")
      line("Y-left", "X-left-down-2")

      // (D) 连接 W 的 X
      line("W", "X-right")
    })
  ]
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 原子半径: $Z > W$], [B. 第一电离能: $Z < Y$],
    [C. 沸点: $X_2 Z < X_2 W$], [D. 键角: $Y Z_2 > W Z_2$],
  )

11. 根据实验操作及现象,下列结论正确的是
  #figure(
    table(
      columns: (auto, auto, auto),
      inset: 6pt,
      align: left,
      [选项], [实验操作及现象], [结论],
      [A], [向蔗糖溶液中滴加稀硫酸,水浴加热,再加入新制 #ce("Cu(OH)2") 悬浊液,无砖红色沉淀], [蔗糖未发生水解],
      [B], [将补铁剂溶于盐酸,过滤,将滤液加入 #ce("KMnO4") 溶液中,溶液紫色褪去], [补铁剂中含有二价铁离子],
      [C],
      [向盛有 2 mL 鸡蛋清溶液的试管中加入 5 滴浓硝酸,加热,先有白色沉淀产生,加热后沉淀变黄],
      [蛋白质能发生变性和显色反应],

      [D], [石蜡油加强热,将生成的气体通入溴水,溴水褪色], [气体中含有乙烯],
    ),
    caption: none,
    supplement: none,
  )

12. 我国科技工作者设计了一种 $#ce("CO2")$ 转化的多功能光电化学平台,实现了 CO 生产与塑料到化学品的协同化,其原理如图所示。下列说法错误的是
  #figure(image("images/image-6.png", width: 50%))
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 光催化电极的电势: $a > b$],
    [B. 电池工作时,负极区溶液的 pH 减小],
    [C. 正极区的电极反应为 #ce("CO2 + 2e^- + 2HCO3^- === CO + 2CO3^2- + H2O")],
    [D. 当电路中通过 1 mol 电子时,正极区溶液质量增大 39 g],
  )

13. 镓的某种化合物的晶胞结构如图所示(晶胞参数为 a pm)。下列说法正确的是
  #grid(
    columns: 2,
    gutter: 1fr,
    grid(
      columns: 1,
      gutter: 10pt,
      [A. Ga 元素位于周期表的 ds 区],
      [B. 晶体结构中 N 的配位数为 4],
      [C. 该物质的化学式为 $"GaN"_2$],
      [D. 该晶体的密度为 $display((4 times 84) / (a^3 N_A) times 10^(-27) g dot c m^(-3))$],
    ),
    image("images/image-7.png", width: 50%),
  )



14. 由乙烷、乙烯、乙炔和二氧化碳组成的“四组分混合气体”在工业上较为常见,可利用传统方法或 MOFs 吸附法提纯得到高纯度乙烯,工艺流程如图所示。
  #figure(
    image("images/image-13.png", width: 60%), // Flowchart for ethylene purification
    // caption: [工艺流程图：传统方法(洗气池->反应器->分离塔->较高纯度乙烯) vs MOFs吸附法(金属有机框架多孔选择性吸附柱)->超高纯度乙烯 (>99.9%)]
  )
  下列说法错误的是
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 传统方法存在步骤繁琐等问题], [B. 洗气池中可盛放碱性溶液],
    [C. 反应器中仅发生了 $sigma$ 键的断裂和生成], [D. 吸附法利用了各分子尺寸大小的差异],
  )

15. 常温下,向饱和氯水中以恒定速率滴加 NaOH 溶液,测得溶液的 pH 随时间的变化如图所示。溶液中氯元素的存在形式仅考虑 #ce("Cl2")、#ce("Cl ^-")、#ce("ClO^-")、#ce("HClO"),该过程不考虑 #ce("HClO") 的分解。下列说法错误的是

  #grid(
    columns: 2,
    gutter: 1fr,
    grid(
      columns: 1,
      gutter: 10pt,
      [A. M 点: $c(H^+) > c(C l^-) > c(H C l O)$],
      [B. N 点: $c(N a^+) = c(C l^-) + c(C l O^-)$],
      [C. 从 M 点到 P 点, $c(H C l O) / c(C l O^-)$ 逐渐减小],
      [D. 从 M 点到 P 点,水的电离程度逐渐增大],
    ),
    image("images/image-1.png", width: 50%),
  )

  // #ce("Cl2 + H2O <->HClO +HCl ");\
  // #ce("HClO <-> H^+ + ClO^-")

  // $
  //   (#ce("HClO") times #ce("H^-")) / (#ce("ClO^-")times #ce("H^-")) = (#ce("HClO") times #ce("H^-")) / (K_a("HClO")times #ce("HClO"))
  // $


  电荷守恒#ce("Na^+ + H^+ = Cl^- + ClO^- + OH^-")
== 非选择题: 本题共4 小题,共55分。
// #set enum(numbering:  numbly(
//   "{1}.",
//   "({1})",
// ))
#set enum(numbering: "1.(1)")

16. (14分) 废 SCR 催化剂(含 $"TiO"_2$、#ce("V2O5")、#ce("WO3") 等)的回收对环境保护和资源循环利用意义重大。通过如下工艺流程可以回收其中的钛、钒、钨等。

  #figure[
    #cetz.canvas({
      import cetz.draw: *

      // --- 样式定义 ---
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

      // [第二行] 底部输入/输出
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
    })]
  已知: ① #ce("TiO2")、#ce("V2O5") 和 #ce("WO3") 都能与 NaOH 溶液反应,分别生成不溶性的 #ce("Na2TiO3") 和可溶性的 $"NaVO"_3$、#ce("Na2WO4"); ② $K_(s p) ("CaWO"_4) = 9 times 10^(-9)$。
  回答下列问题:\
  (1) $基 态_23 V$ 原子的价层电子轨道表示式为 #uline(width: 5em)。\
  (2) “球磨”的目的是 #uline(width: 20em)。\
  (3) “碱浸”后通过 #uline(width: 8em) (填操作名称)可以实现钛与钒、钨分离。\
  (4) “酸浸”后钛主要以 $"TiO"^(2+)$ 形式存在,“热水解”反应的离子方程式为 #uline(width: 5em)。\
  (5) “煅烧” #ce("NH4VO3") 的化学方程式为 #uline(width: 10em)。\
  (6) “沉钨”中析出 $"CaWO"_4$ 时,需要加入过量 #ce("CaCl2"),其目的是 #uline(width: 10em)。\
  (7) 向 20 mL $0.3$ $"mol"dot L^(-1)$ #ce("Na2WO4") 的滤液中加入等体积的 #ce("CaCl2") 溶液(忽略混合过程中的体积变化),欲使 $"WO"_4^(2-)$ 浓度小于 $1 times 10^(-6)$ $"mol"dot L^(-1)$,则 #ce("CaCl2") 溶液的最小浓度为 #uline(width: 10em) $"mol"dot L^(-1)$。

17. (13分) 过氧化铜($C u O_2$)是黄褐色固体,可用作有机合成的氧化剂和催化剂。某校实验兴趣小组制备过氧化铜的步骤如下:

  I. 称取 $2.0$ g $"NH"_4 "Cl"$ 和 $2.0$ g $"CuSO"_4 dot 5 #ce("H2") O$ 于烧杯中,加入 40 mL 水溶解。\
  II. 缓慢加入 NaOH 固体并搅拌,溶液中先出现绿色沉淀 $[C u_2 (O H)_3 C l]$,然后沉淀慢慢变为蓝色,最后溶解形成溶液 A。\
  III. 在冰水浴下,将 40 mL 3% $#ce("H2") "O"_2$ 溶液加入溶液 A 中,搅拌均匀,产生黄褐色沉淀,离心分离。\
  IV. 沉淀洗涤、晾干、称重,得 $0.6$ g 粗品。

  回答下列问题:
  (1) 步骤 I 配制溶液时,下列仪器中不需要的是 #uline(width: 10em) (填仪器名称)。\

  #figure(
    grid(
      columns: 4,
      gutter: 1fr,
      image("images/image-11.png", width: 70%),
    ),
  )
  (2) 步骤 II 中生成绿色沉淀的离子方程式为 #uline(width: 10em)。
  溶液 A 的颜色为 #uline(width: 8em)。\
  (3) 步骤 III 在冰水浴中进行反应的原因是 #uline(width: 15em)。\
  (4) 步骤 III 中为避免反应过于剧烈,加入 $#ce("H2") O_2$ 溶液应采用 #uline(width: 10em) 的方法。\
  (5) 步骤 IV 中用到了乙醇洗涤,其目的是 #uline(width: 15em)。\
  (6) 取粗品 $0.1000$ g (杂质不参加反应)与过量酸性 KI 完全反应后,调节溶液至弱酸性。以淀粉为指示剂,用 $0.1000$ $"mol"dot L^(-1)$ $N a_2 S_2 O_3$ 标准溶液滴定,滴定终点时消耗 $N a_2 S_2 O_3$ 标准溶液分别为 $27.02$ mL、$26.98$ mL、$28.00$ mL (已知: $2 "Cu"^{2+} + 4 I^- === 2 "CuI" arrow.b + "I"_2$, $I_2 + 2 S_2 O_3^(2-) === 2 "I"^- + "S"_4"O"_6^(2-)$)。粗品中 $C u O_2$ 的纯度为 #uline(width: 10em)。

18. (14分) 甲醇既是重要的化工原料,又是一种清洁燃料。利用 $#ce("CO2")$ 加氢合成甲醇的主要反应如下:\
  $ I. #ce("CO2") (g) + 3 #ce("H2") (g) <=> #ce("CH3OH") (g) + #ce("H2") O (g) quad Delta H_1 $

  $ II. #ce("CO2") (g) + #ce("H2") (g) <=> #ce("CO") (g) + #ce("H2") O (g) quad Delta #ce("H2") > 0 $

  回答下列问题:\
  (1) 我国学者结合实验与计算机模拟结果,研究了光催化 $#ce("CO2")$ 加氢合成甲醇的反应历程,如图所示,其中吸附在催化剂表面的物种用 \* 表示。

  ① $Delta H_1$ #uline(width: 3em) 0 (填 “>” 或 “<”)。
  ② 图示历程包含 #uline(width: 3em) 个基元反应,其中最大能垒(活化能)步骤的化学方程式为 #uline(width: 30em)。

  (2) 向刚性容器中充入一定量 $#ce("CO2")$ 和 $#ce("H2")$,在相同压强和不同温度下,反应相同时间,$#ce("CO2")$ 的转化率和甲醇选择性[已知甲醇的选择性 $= (n#ce("CH3OH")) / (n_("反应")(#ce("CO2"))) times 100 %$]随温度的变化如图所示:
  #figure(
    // Graph of CO2 conversion rate and methanol selectivity vs temperature
    caption: [$"CO"_2$转化率和甲醇选择性随温度的变化曲线],
  )[
    // 实线：CO2 转化率
    #let co2-x = (200, 220, 240, 260, 280, 300, 310)
    #let co2-y = (5, 10, 15, 18, 20, 21.5, 23.5)

    // 虚线：甲醇选择性
    #let meoh-x = (200, 210, 220, 230, 240, 260, 280, 290, 300, 310)
    #let meoh-y = (61, 53, 46, 40, 35, 30, 23, 18, 13, 11)

    // --- 2. 绘图 ---
    #lq.diagram(
      width: 70%,
      height: 5cm,

      // 坐标轴标签
      xlabel: [温度/$degree$C],
      ylabel: [$"CO"_2$转化率或甲醇选择性/%],

      // 坐标轴范围
      xlim: (190, 320),
      ylim: (0, 75),

      // 图例设置
      legend: (
        // 关键修正：必须使用 Typst 的对齐对象 (top + right)，不能用字符串
        position: top + right,
        stroke: none, // 去除图例边框
      ),

      // --- 绘制曲线 ---

      // 1. CO2 转化率 (实线)
      lq.plot(
        co2-x,
        co2-y,
        label: [$"CO"_2$转化率],
        stroke: (paint: black, thickness: 1.5pt),
      ),

      // 2. 甲醇选择性 (虚线)
      lq.plot(
        meoh-x,
        meoh-y,
        label: [甲醇选择性],
        stroke: (paint: black, thickness: 1.5pt, dash: "dashed"),
      ),
    )]
  在 $200 ~ 300 degree C$ 间,#ce("CH3OH") 的选择性随温度的升高而下降,写出一条可能原因 #uline(width: 30em)。

  (3) 一定条件下,向刚性容器中充入物质的量之比为 $1:3$ 的 $#ce("CO2")$ 和 $#ce("H2")$,发生上述反应 I 和 II。\
  ① 有利于提高甲醇平衡产率的条件是 #uline(width: 5em) (填标号)。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 高温高压], [B. 低温高压], [C. 高温低压], [D. 低温低压],
  )
  ② 达到平衡时 $#ce("CO2")$ 的转化率为 20%,#ce("CH3OH") 的选择性为 75%,则 $alpha (#ce("H2"))$ = #uline(width: 4em) (计算结果保留 3 位有效数字); 反应 II 的 $K_p$ = #uline(width: 8em)。

19. (14分) 文拉法辛(化合物 H)是一种用于治疗各类抑郁症的药物,其合成路线如图所示。
  #figure(
    image("images/image-8.png"), // Synthesis route of Venlafaxine (Compound H)
    caption: [文拉法辛合成路线图],
  )
  回答下列问题:\
  (1) A 的化学名称是 #uline(width: 15em)。\
  (2) D $->$ E 的反应类型是 #uline(width: 15em)。\
  (3) F 的结构简式为 #uline(width: 15em)。\
  (4) G 的官能团名称为醚键、 #uline(width: 8em)、 #uline(width: 8em)。\
  (5) A 与 HCHO 反应形成线型结构高分子的反应方程式为 #uline(width: 30em)。\
  (6) 在 D 的同分异构体中,同时满足下列条件的共有 #uline(width: 5em) 种(不考虑立体异构)。

  #grid(
    columns: 4,
    gutter: 1fr,
    [a. 能使溴水褪色], [b. 含有酰胺基], [c. 含有苯环,不含其他环],
  )
  其中核磁共振氢谱有 5 组峰,且峰面积之比为 $2:2:2:2:1$ 的同分异构体的结构简式为 #uline(width: 10em) (只写一种)。
