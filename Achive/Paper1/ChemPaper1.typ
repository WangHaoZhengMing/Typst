#import "@preview/typsium:0.2.0": ce
#import "@preview/cetz:0.4.2"
#import "@preview/lilaq:0.5.0" as lq
#import "cetz.typ": *
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
  #figure(image("images/image.svg"))
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
    #grid(
      columns: 2,
      column-gutter: 20pt,
      align: center + horizon,
      [#figure(caption: [黑磷（层状投影）])[#黑磷层状投影]], [#figure(caption: [黑磷的微观结构])[#黑磷的微观结构]],
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
  // 设置列表样式
  #[
    #set enum(numbering: "A.", spacing: 1.5em)

    + 铝粉和氧化铁组成的铝热剂用于焊接钢轨：$2"Al" + "Fe"_2"O"_3 limits(=)^"高温" "Al"_2"O"_3 + 2"Fe"$

    + 向煤中加入石灰石实现燃煤脱硫：$2"CaCO"_3 + 2"SO"_2 + "O"_2 limits(=)^Delta 2"CaSO"_4 + 2"CO"_2$

    + 向 $"Mg"("OH")_2$ 悬浊液中滴加 $"FeCl"_3$ 溶液：$3"Mg"("OH")_2("s") + 2"FeCl"_3("aq") = 2"Fe"("OH")_3("s") + 3"MgCl"_2("aq")$

    + 向甲醛中加入足量的银氨溶液并加热：$"HCHO" + 2["Ag"("NH"_3)_2]"OH" limits(arrow.long)^Delta "HCOONH"_4 + 2"Ag" arrow.b + 3"NH"_3 + "H"_2"O"$
  ]

9. 碲元素(Te)位于周期表中第五周期 VIA 族,含碲有机物在医学、材料科学等领域发挥着独特的作用。某含碲有机物结构简式如图所示,下列说法错误的是
  #figure(
    caption: none,
  )[#含碲有机物结构简式]
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

    #一种可用于头孢菌素改性剂的物质的结构
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
  #figure()[#光电化学平台]
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
    figure[#晶胞结构示意图],
  )



14. 由乙烷、乙烯、乙炔和二氧化碳组成的“四组分混合气体”在工业上较为常见,可利用传统方法或 MOFs 吸附法提纯得到高纯度乙烯,工艺流程如图所示。
  #figure()[

    #cetz.canvas({
      import cetz.draw: *

      // Styles
      let box-style = (stroke: 1pt, fill: white)
      let arrow-style = (mark: (end: ">", size: 0.12), stroke: 1pt) // 稍微缩小箭头

      // 坐标变量 (方便整体调整)
      let branch-x = 1.0 // 分叉线 X坐标 (原 1.5)
      let top-y = 1.6 // 上分支 Y坐标 (原 2.5)
      let bot-y = -1.8 // 下分支 Y坐标 (原 -2.5)
      let box-h = 0.4 // 方框半高 (原 0.5)

      content((0, 0), align(center)[四组分\ 混合气体], name: "start")
      rect((2.2, top-y - box-h), (3.8, top-y + box-h), name: "wash", ..box-style)
      content("wash", "洗气池")

      // 反应器: 4.6 ~ 6.2 (原 6~8)
      rect((4.6, top-y - box-h), (6.2, top-y + box-h), name: "react", ..box-style)
      content("react", "反应器")

      // 分离塔: 7.0 ~ 8.6 (原 9~11)
      rect((7.0, top-y - box-h), (8.6, top-y + box-h), name: "sep", ..box-style)
      content("sep", "分离塔")

      // H2 Input
      line((5.4, top-y + 1.2), "react.north", ..arrow-style)
      content((5.4, top-y + 1.4), $"H"_2$, anchor: "south")

      // Connections (Top)
      // 连线：起点 -> 洗气池
      line("start.east", (branch-x, 0), (branch-x, top-y), "wash.west", ..arrow-style)
      content((branch-x - 0.3, top-y + 0.2), [传统方法], anchor: "south-west")

      // 连线：方框之间
      line("wash.east", "react.west", ..arrow-style)
      line("react.east", "sep.west", ..arrow-style)

      // Output
      line("sep.east", (10.0, top-y), ..arrow-style)
      content((10.2, top-y), "较高纯度乙烯", anchor: "west")

      let mof-start-x = 2.2
      let mof-split-x = 6.5
      let mof-end-x = 8.2
      let mof-h = 0.5

      rect(
        (mof-start-x + 1, bot-y - mof-h),
        (mof-split-x, bot-y + mof-h),
        fill: rgb("222222"),
        stroke: 1pt,
        name: "mof-dark",
      )
      rect(
        (mof-split-x, bot-y - mof-h),
        (mof-end-x, bot-y + mof-h),
        fill: rgb("bbbbbb"),
        stroke: 1pt,
        name: "mof-light",
      )

      // 底部文字
      content(((mof-start-x + mof-end-x) / 2, bot-y - 0.9), "（金属有机框架多孔选择性吸附柱）", anchor: "north")

      // Connections (Bottom)
      line("start.east", (branch-x, 0), (branch-x, bot-y), "mof-dark.west", ..arrow-style)

      content((branch-x + 0.2, bot-y + 0.2), [MOFs吸附法], anchor: "south-west")

      // Output
      line("mof-light.east", (10.0, bot-y), ..arrow-style)
      content((10.2, bot-y), "超高纯度乙烯（>99.9%）", anchor: "west")
    })]
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
    figure()[#滴定曲线],
  )

  电荷守恒#ce("Na^+ + H^+ = Cl^- + ClO^- + OH^-")
== 非选择题: 本题共4 小题,共55分。
// #set enum(numbering:  numbly(
//   "{1}.",
//   "({1})",
// ))
#set enum(numbering: "1.(1)")

16. (14分) 废 SCR 催化剂(含 $"TiO"_2$、#ce("V2O5")、#ce("WO3") 等)的回收对环境保护和资源循环利用意义重大。通过如下工艺流程可以回收其中的钛、钒、钨等。
  #figure[#废SCR催化剂回收流程]
  已知: ① #ce("TiO2")、#ce("V2O5") 和 #ce("WO3") 都能与 NaOH 溶液反应,分别生成不溶性的 #ce("Na2TiO3") 和可溶性的 $"NaVO"_3$、#ce("Na2WO4"); ② $K_(s p) ("CaWO"_4) = 9 times 10^(-9)$。
  回答下列问题:\
  (1) $基 态_23 V$ 原子的价层电子轨道表示式为 #uline(width: 5em)。\
  (2) “球磨”的目的是 #uline(width: 20em)。\
  (3) “碱浸”后通过 #uline(width: 8em) (填操作名称)可以实现钛与钒、钨分离。\
  (4) “酸浸”后钛主要以 $"TiO"^(2+)$ 形式存在,“热水解”反应的离子方程式为 #uline(width: 5em)。\
  (5) “煅烧” #ce("NH4VO3") 的化学方程式为 #uline(width: 10em)。\
  (6) “沉钨”中析出 $"CaWO"_4$ 时,需要加入过量 #ce("CaCl2"),其目的是 #uline(width: 10em)。\
  (7) 向 20 mL $0.3$ $"mol"dot "L"^(-1)$ #ce("Na2WO4") 的滤液中加入等体积的 #ce("CaCl2") 溶液(忽略混合过程中的体积变化),欲使 $"WO"_4^(2-)$ 浓度小于 $1 times 10^(-6)$ $"mol"dot "L"^(-1)$,则 #ce("CaCl2") 溶液的最小浓度为 #uline(width: 10em) $"mol"dot "L"^(-1)$。

17. (13分) 过氧化铜 ($"CuO"_2$) 是黄褐色固体,可用作有机合成的氧化剂和催化剂。某校实验兴趣小组制备过氧化铜的步骤如下:

  I. 称取 $2.0$ g $"NH"_4 "Cl"$ 和 $2.0$ g $"CuSO"_4 dot 5 #ce("H2") O$ 于烧杯中,加入 40 mL 水溶解。\
  II. 缓慢加入 NaOH 固体并搅拌,溶液中先出现绿色沉淀 #ce("[Cu2(OH)3Cl]"),然后沉淀慢慢变为蓝色,最后溶解形成溶液 A。\
  III. 在冰水浴下,将 40 mL 3% $#ce("H2") "O"_2$ 溶液加入溶液 A 中,搅拌均匀,产生黄褐色沉淀,离心分离。\
  IV. 沉淀洗涤、晾干、称重,得 $0.6$ g 粗品。

  回答下列问题:\
  (1) 步骤 I 配制溶液时,下列仪器中不需要的是 #uline(width: 10em) (填仪器名称)。\

  #figure(image("images/image-11.png", width: 40%),)
  (2) 步骤 II 中生成绿色沉淀的离子方程式为 #uline(width: 10em)。
  溶液 A 的颜色为 #uline(width: 8em)。\
  (3) 步骤 III 在冰水浴中进行反应的原因是 #uline(width: 15em)。\
  (4) 步骤 III 中为避免反应过于剧烈,加入 $#ce("H2") "O"_2$ 溶液应采用 #uline(width: 10em) 的方法。\
  (5) 步骤 IV 中用到了乙醇洗涤,其目的是 #uline(width: 15em)。\
  (6) 取粗品 $0.1000$ g (杂质不参加反应)与过量酸性 KI 完全反应后,调节溶液至弱酸性。以淀粉为指示剂,用 $0.1000$ $"mol"dot L^(-1)$ #ce("Na2S2O3") 标准溶液滴定,滴定终点时消耗 #ce("Na2S2O3") 标准溶液分别为 $27.02$ mL、$26.98$ mL、$28.00$ mL (已知: $2 "Cu"^(2+) + 4"I"^- === 2 "CuI" arrow.b + "I"_2$, $I_2 + 2 S_2 O_3^(2-) === 2 "I"^- + "S"_4"O"_6^(2-)$)。粗品中 #ce("CuO2") 的纯度为 #uline(width: 10em)。

18. (14分) 甲醇既是重要的化工原料,又是一种清洁燃料。利用 $#ce("CO2")$ 加氢合成甲醇的主要反应如下:\
  $ I. #ce("CO2") (g) + 3 #ce("H2") (g) <=> #ce("CH3OH") (g) + #ce("H2") O (g) quad Delta H_1 $

  $ II. #ce("CO2") (g) + #ce("H2") (g) <=> #ce("CO") (g) + #ce("H2") O (g) quad Delta #ce("H2") > 0 $

  回答下列问题:\
  (1) 我国学者结合实验与计算机模拟结果,研究了光催化 $#ce("CO2")$ 加氢合成甲醇的反应历程,如图所示,其中吸附在催化剂表面的物种用 \* 表示。
  #figure(
    caption: [反应历程图，显示相对能量与反应历程的关系],
  )[#反应历程图]

  ① $Delta H_1$ #uline(width: 3em) 0 (填 “>” 或 “<”)。
  ② 图示历程包含 #uline(width: 3em) 个基元反应,其中最大能垒(活化能)步骤的化学方程式为 #uline(width: 30em)。

  (2) 向刚性容器中充入一定量 $#ce("CO2")$ 和 $#ce("H2")$,在相同压强和不同温度下,反应相同时间,$#ce("CO2")$ 的转化率和甲醇选择性[已知甲醇的选择性 $= (n#ce("CH3OH")) / (n_("反应")(#ce("CO2"))) times 100 %$]随温度的变化如图所示:
  #figure(
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
