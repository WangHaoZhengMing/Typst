#import "@preview/typsium:0.2.0": ce
#import "@preview/showybox:2.0.4": showybox
#import "@preview/touying:0.6.1": *
#import themes.dewdrop: *

#import "@preview/numbly:0.1.0": numbly

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  config-info(
    title: [化学],
    // subtitle: [Subtitle],
    // author: [Authors],
    date: datetime.today(),
    // institution: [Institution],
  ),
)

#title-slide()

// #outline-slide()

#set document(title: "2023-2024学年度武汉市部分学校高三年级调研考试 化学")
#set page(numbering: "1/1")
#set heading(level: 1, numbering: "一、")
#set text(font: "PingFang SC")
#let uline(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}

#let answerbox(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}

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
  #ce("H2O") 中的氧的价层电子对数为: $2+(6-1times 2)/2=4$, 所以为正四面体构型
  #showybox(
    title: [VSEPR模型判断方法],
    [以ABn型分子为例，判断VSEPR模型的步骤如下：

      1. 计算价层电子对数(Z)：
        Z = m + n
        其中：
        - m为孤电子对数, n为σ键电子对数（即角标数）

      2. 计算孤电子对数(m)：\
        m = $("中心原子价电子数" - n)/2$

      3. 根据Z值确定VSEPR模型：
        - Z = 2：直线型
        - Z = 3：平面三角形 |||| Z = 4：正四面体形
    ],
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
  *CH₃CH₂OH氧化反应：*
  + *a. 燃烧（完全氧化）：*
    + 性质：在空气或氧气中点燃#sym.Delta，生成二氧化碳和水，并放出大量热量。
    + 方程式：
      `CH₃CH₂OH + 3O₂ → (点燃) 2CO₂ + 3H₂O`

  + *b. 催化氧化（部分氧化）：*
    + 性质：在加热条件下，乙醇蒸气通过灼热的铜或银作催化剂，可以被氧化成乙醛。如果使用强氧化剂（如酸性高锰酸钾溶液或酸性重铬酸钾溶液），乙醇可以直接被氧化成乙酸。
    + 方程式：
      + 氧化成乙醛： `2CH₃CH₂OH + O₂ → (Cu或Ag, Δ) 2CH₃CHO + 2H₂O` （乙醛）
      + 被强氧化剂氧化成乙酸： `CH₃CH₂OH + O₂ → (催化剂, Δ) CH₃COOH + H₂O` (这是一个简化的表示，实际反应可能更复杂，例如用KMnO₄)
      + 更具体的用重铬酸钾： `3CH₃CH₂OH + 2K₂Cr₂O₇ + 8H₂SO₄ → 3CH₃COOH + 2Cr₂(SO₄)₃ + 2K₂SO₄ + 11H₂O` （现象：橙黄色溶液变为绿色）
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
  
  #ce("H3BO3 H + H2O <-> [B(OH)4^-] + H^+")

5. 设 $N_A$ 为阿伏加德罗常数的值。下列说法正确的是 // Note: Question number repeated from page 1
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. $0.1$ mol #ce("NH4^+") 中氮的价层电子对数为 $0.4 N_A$ || $4+(5-1-1times 4)/2=4$],
    [B. $0.1$ $"mol" dot L^(-1)$ #ce("HCLO4") 溶液中 #ce("H^+") 的数目为 $0.1 N_A$],
    [C. 标准状况下, $2.24$ L 氯仿中分子数为 $0.1 N_A$],
    [D. 常温下, $5.6$ g Fe 与足量浓硝酸反应转移的电子数为 $0.3 N_A$],
  )
  #table(
    columns: 2,
    align: left,
    table.header(
      [化合物],
      [备注],
    ),

    [甲醇 (CH₃OH)], [工业酒精的主要成分],
    [乙酸 (CH₃COOH)], [食醋的主要成分（醋酸）],
    [苯 (C₆H₆)], [一种重要的有机溶剂和化工原料],
    [甲苯 (C₇H₈)], [常见的有机溶剂],
    [己烷 (C₆H₁₄)], [常见的非极性有机溶剂，汽油的组分之一],
    [环己烷 (C₆H₁₂)], [常见的非极性有机溶剂],
    [丙酮 (CH₃COCH₃)], [一种常见的有机溶剂，也叫二甲基酮],
    [乙醚 (CH₃CH₂OCH₂CH₃)], [曾用作麻醉剂，也是常见的有机溶剂],
    [四氯化碳 (CCl₄)], [曾用作溶剂和灭火剂，但因毒性和环境问题已严格限制使用。与氯仿结构相似],
    [二氯甲烷 (CH₂Cl₂)], [一种常用的有机溶剂],
    [甘油 (C₃H₈O₃)], [即丙三醇，是一种黏稠的液体],
    [乙二醇 (C₂H₆O₂)], [常用于防冻剂],
    [液溴 (Br₂)], [在常温下为液体的元素之一（深红棕色挥发性液体）],
    [汞 (Hg)], [金属单质中唯一在常温下为液体的元素（俗称水银）],
  )
  *烷烃的物理状态*
  + 碳原子数少（通常 C1 - C4）：
    + 在常温常压下（例如 25°C, 1 atm）为气态。
  + 碳原子数适中（通常 C5 - C16/C17）：
    + 戊烷 (C₅H₁₂, C5) - 如正戊烷，是第一个在常温下为液态的直链烷烃。
  #v(100%)
7. 我国科学家利用黑磷实现了高速场效应晶体管的应用尝试,黑磷的结构如图所示。下列说法错误的是

  #figure(image("images/image-3.png", width: 70%))
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 黑磷与白磷互为同素异形体], [B. 1 mol 黑磷含有 3 mol $P-P$ 键],
    [C. 黑磷中 P 的杂化方式为 $s p^3$], [D. 黑磷层间作用为范德华力],
  )
  B. 在黑磷的结构中，每个磷原子都与周围的三个磷原子形成共价键。如果我们考虑 1 mol 的磷原子（以黑磷的形式存在），那么每个磷原子贡献了 3 个键的*一半*给它所连接的 P-P 键（因为一个 P-P 键连接两个磷原子）。

  C. 在黑磷中，每个磷原子与另外三个磷原子形成三个 σ 键。磷原子是第VA族元素，有5个价电子。形成三个共价键后，还剩余 $5 - 3 = 2$ 个电子，即一对孤对电子。

  价层电子对互斥理论 (VSEPR) 中，一个原子的价层电子对数 = σ键数 + 孤对电子数。

  对于黑磷中的 P 原子：
  - σ键数 = 3
  - 孤对电子对数 = 1
  - 价层电子对总数 = $3 + 1 = 4$

  价层电子对数为 4 时，中心原子的杂化方式为 $s p^3$ 杂化。
  #image("images/杂化轨道与电子对数的关系.png")
+ 下面方程式不正确的是
  #grid(
    columns: 1,
    gutter: 10pt,
    // [A. 铝粉和氧化铁组成的铝热剂用于焊接钢轨: $2 A l + F e_2 O_3 arrow("高温") A l_2 O_3 + 2 F e$],
    // [B. 向煤中加入石灰石实现燃煤脱硫: $2 Ca C O_3 + 2 S O_2 + O_2 arrow.t(Delta) 2 Ca S O_4 + 2 #ce("CO2")$],
    // [C. 向 $Mg(O H)_2$ 悬浊液中滴加 $Fe Cl_3$ 溶液: $3 Mg(O H)_2 (s) + 2 Fe Cl_3 (aq) === 2 Fe(O H)_3 (s) + 3 Mg Cl_2 (aq)$],
    // [D. 向甲醛中加入足量的银氨溶液并加热: $H C H O + 2 [ Ag(N H_3)_2 ] O H arrow.t(Delta) H C O O N H_4 + 2 Ag arrow.b + 3 N H_3 + #ce("H2") O$],
    image("images/image-12.png")
  )

9. 碲元素(Te)位于周期表中第五周期 VIA 族,含碲有机物在医学、材料科学等领域发挥着独特的作用。某含碲有机物结构简式如图所示,下列说法错误的是
  #figure(
    image("images/image-4.png", width: 30%),
    caption: none,
  )
  #grid(
    columns: (auto, auto),
    [
      #grid(
        columns: 1,
        column-gutter: 30em,
        row-gutter: 10pt,
        [A. 基态碲原子($5"s"^2 5"p"^4$)未成对电子数为 2],
        [B. 其中含氧官能团有 2 种],
        [C. 苯环上的一氯代物有 5 种],
        [D. 其中手性碳原子个数为 2],
      )],
    [#image("images/手性碳示意图.png", width: 50%)],
  )
  // #image("images/9.取代.png", width: 50%)
  #v(100%)
10. 一种可用于头孢菌素改性剂的物质的结构如图所示,其中 X、Y、Z、W 是原子序数递增的短周期主族元素。下列说法正确的是
  #figure(
    image("images/image-5.png", width: 20%), // Structure of X, Y, Z, W compound
    caption: none,
  )
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 原子半径: $Z > W$], [B. 第一电离能: $Z < Y$],
    [C. 沸点: $X_2 Z < X_2 W$], [D. 键角: $Y Z_2 > W Z_2$],
  )
  #figure(image("image.png"), caption: [$"H"_2"S"$ 的部分性质])
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
  #ce("CO2 + 2e^- + 2HCO3^- === CO + 2CO3^2- + H2O")
13. 镓的某种化合物的晶胞结构如图所示(晶胞参数为 a pm)。下列说法正确的是
  #grid(
    columns: 2,
    gutter: 1fr,
    grid(
      columns: 1,
      gutter: 14pt,
      [A. Ga 元素位于周期表的 ds 区],
      [B. 晶体结构中 N 的配位数为 4],
      [C. 该物质的化学式为 $"GaN"_2$],
      [D. 该晶体的密度为 $display((4 times 84) / (a^3 N_A) times 10^(-27) g dot c m^(-3))$],
    ),
    image("images/image-7.png", width: 50%),
  )
  
  第 四 周 期 ⽫ A 族 元 
  #image("images/立体.png", width: 40%)
14. 由乙烷、乙烯、乙炔和二氧化碳组成的"四组分混合气体"在工业上较为常见,可利用传统方法或 MOFs 吸附法提纯得到高纯度乙烯,工艺流程如图所示。
  #figure(image("images/image-13.png", width: 60%))
  下列说法错误的是
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 传统方法存在步骤繁琐等问题], [B. 洗气池中可盛放碱性溶液],
    [C. 反应器中仅发生了 $sigma$ 键的断裂和生成], [D. 吸附法利用了各分子尺寸大小的差异],
  )
  #showybox(title: "几个键的比较:")[
    
    1. *定义与形成：*
      - σ键：由原子轨道端对端重叠形成，电子云沿键轴对称分布(可以由 s-s、s-p 或 p-p 轨道重叠形成)
      - π键：由p轨道侧向重叠形成，电子云分布在键轴两侧

    2. *键的强度：*
      - σ键：250~420 kJ/mol. | π键：约100~150 kJ/mol 
    #table(
      columns: 2,
      align: left,
      table.header(
        [分子],
        [键类型],
      ),
      [C=C (乙烯)], [1 σ (sp²-sp²) + 1 π (p-p)],
      [C≡C (乙炔)], [1 σ + 2 π],
    )
    ]
  
15. 常温下,向饱和氯水中以恒定速率滴加 NaOH 溶液,测得溶液的 pH 随时间的变化如图所示。溶液中氯元素的存在形式仅考虑 #ce("Cl2")、#ce("Cl ^-")、#ce("ClO^-")、#ce("HClO"),该过程不考虑 #ce("HClO") 的分解。下列说法错误的是

  #grid(
    columns: 2,
    gutter: 1fr,
    grid(
      columns: 1,
      gutter: 15pt,
      [A. M 点: $c(H^+) > c(C l^-) > c(H C l O)$],
      [B. N 点: $c(N a^+) = c(C l^-) + c(C l O^-)$],
      [C. 从 M 点到 P 点, $c(H C l O) / c(C l O^-)$ 逐渐减小],
      [D. 从 M 点到 P 点,水的电离程度逐渐增大],
    ),
    image("images/image-1.png", width: 50%),
  )
  #v(100%)
  #ce("Cl2 + H2O <->HClO +HCl ");\
  #ce("HClO <-> H^+ + ClO^-")

  $
    (#ce("HClO") times #ce("H^-")) / (#ce("ClO^-")times #ce("H^-")) = (#ce("HClO") times #ce("H^-")) / (K_a("HClO")times #ce("HClO"))
  $


  电荷守恒#ce("Na^+ + H^+ = Cl^- + ClO^- + OH^-")
== 非选择题: 本题共4 小题,共55分。
// #set enum(numbering:  numbly(
//   "{1}.",
//   "({1})",
// ))
// #set enum(numbering: "1.(1)")

16. (14分) 废 SCR 催化剂(含 $"TiO"_2$、#ce("V2O5")、#ce("WO3") 等)的回收对环境保护和资源循环利用意义重大。通过如下工艺流程可以回收其中的钛、钒、钨等。

  #figure(image("images/image-2.png", width: 70%))
  已知: ① #ce("TiO2")、#ce("V2O5") 和 #ce("WO3") 都能与 NaOH 溶液反应,分别生成不溶性的 #ce("Na2TiO3") 和可溶性的 $"NaVO"_3$、#ce("Na2WO4"); ② $K_(s p) ("CaWO"_4) = 9 times 10^(-9)$。
  回答下列问题:\
  (1) $基 态_23 V$ 原子$3d^3 4s^2$的价层电子轨道表示式为 #uline(width: 5em)。\
  (2) "球磨"的目的是 #uline(width: 20em)。\
  (3) "碱浸"后通过 #uline(width: 8em) (填操作名称)可以实现钛与钒、钨分离。\
  (4) "酸浸"后钛主要以 $"TiO"^(2+)$ 形式存在,"热水解"反应的离子方程式为 #uline(width: 5em)。\
  (5) "煅烧" #ce("NH4VO3") 的化学方程式为 #uline(width: 10em)。\
  (6) "沉钨"中析出 #ce("CaWO4") 时,需要加入过量#ce("CaCl2"),其目的是 #uline(width: 8em)。\
  (7) 向 20 mL $0.3$ $"mol"dot L^(-1)$ #ce("Na2WO4") 的滤液中加入等体积的 #ce("CaCl2") 溶液(忽略混合过程中的体积变化),欲使 $"WO"_4^(2-)$ 浓度小于 $1 times 10^(-6)$ $"mol"dot L^(-1)$,则 #ce("CaCl2") 溶液的最小浓度为 #uline(width: 10em) $"mol"dot L^(-1)$。\
  由反应式可知: 生成沉淀所用的 #ce("Ca^2+") 的物质的量为: $0.3 "mol/L" times 20 "mL"$

  20 mL $0.3$ $"mol" dot L^(-1)$ #ce("Na2WO4") 中含有 $0.3 times 20 "mL"$ 的 #ce("WO4^(2-)")

  $ K_(s p) ("CaWO"_4) = c("Ca"^(2+)) times c("WO"_4^(2-)) = 9 times 10^(-9) $  
  则 $["Ca"^(2+)] = 3 times 10^(-3) "mol"dot L^(-1)$

  所要的 #ce("CaCl2") 的物质的量为: $ 3 times 10^(-3) times 40 "mL" $

  总共要 $0.3 times 20 "mL" + 9 times 10^(-9) times 40 "mL"$ 的 #ce("CaCl2") 的物质的量

  所以 #ce("CaCl2") 的浓度为: 
  $ (0.3 times 20 "mL" + 9 times 10^(-3) times 40 "mL")/(20 "mL") = 0.318 "mol" dot L^(-1) $

17. (13分) 过氧化铜 #ce("CuO2") 是黄褐色固体,可用作有机合成的氧化剂和催化剂。某校实验兴趣小组制备过氧化铜的步骤如下:

  I. 称取 $2.0$ g $"NH"_4 "Cl"$ 和 $2.0$ g $"CuSO"_4 dot 5 #ce("H2") O$ 于烧杯中,加入 40 mL 水溶解。\
  II. 缓慢加入 NaOH 固体并搅拌,溶液中先出现绿色沉淀 #ce("Cu2(OH)3Cl") ,然后沉淀慢慢变为蓝色,最后溶解形成溶液 A。\
  III. 在冰水浴下,将 40 mL 3% $#ce("H2") "O"_2$ 溶液加入溶液 A 中,搅拌均匀,产生黄褐色沉淀,离心分离。\
  IV. 沉淀洗涤、晾干、称重,得 $0.6$ g 粗品。

  回答下列问题:\
  (1) 步骤 I 配制溶液时,下列仪器中不需要的是 #uline(width: 10em) (填仪器名称)。\

  #figure(
    grid(
      columns: 4,
      gutter: 1fr,
      image("images/image-11.png", width: 70%),
    ),
  )
  (2) 步骤 II 中生成绿色沉淀的离子方程式为 #uline(width: 18em, answer: [#ce("2Cu^(2+)+Cl^- +3OH^-=Cu2(OH)3Cl")#sym.arrow.b])。
  溶液 A 的颜色为 #uline(width: 8em)。\
  (3) 步骤 III 在冰水浴中进行反应的原因是 #uline(width: 15em)。\
  (4) 步骤 III 中为避免反应过于剧烈,加入 $#ce("H2") "O"_2$ 溶液应采用 #uline(width: 10em) 的方法。\
  (5) 步骤 IV 中用到了乙醇洗涤,其目的是 #uline(width: 15em)。\
  (6) 取粗品 $0.1000$ g (杂质不参加反应) 与过量酸性 KI 完全反应后,调节溶液至弱酸性。以淀粉为指示剂,用 $0.1000$ $"mol"dot L^(-1)$ $N a_2 S_2 O_3$ 标准溶液滴定,滴定终点时消耗 $N a_2 S_2 O_3$ 标准溶液分别为 $27.02$ mL、$26.98$ mL、$28.00$ mL \ (已知: $2 "Cu"^(2)+ + 4 "I"^- === 2 "CuI" arrow.b + "I"_2$, $"I"_2 + 2"S"_2"O"_3^(2-) === 2 "I"^- + "S"_4"O"_6^(2-)$)。粗品中 $C u O_2$ 的纯度为 #uline(width: 10em)。
  #showybox(title: "解析")[
  #ce("2CuO2+8H^+ +8I^- -> 2CuI+3I2+4H2O")\
  #ce("I2+2S2O3^2- -> 2I^- + S4O6^2-"), 我们可以得出关系式为:#ce("2CuO~3I2~6S2O3^2-")\
  则:$ n(#ce("CuO2"))=0.1"mol"\/L times 0.27L times 1/3 = 0.009 "mol" $
]
18. (14分) 甲醇既是重要的化工原料,又是一种清洁燃料。利用 $#ce("CO2")$ 加氢合成甲醇的主要反应如下:\
  $ I. #ce("CO2") (g) + 3 #ce("H2") (g) <=> #ce("CH3OH") (g) + #ce("H2") O (g) quad Delta H_1 $
  $ II. #ce("CO2") (g) + #ce("H2") (g) <=> #ce("CO") (g) + #ce("H2") O (g) quad Delta #ce("H2") > 0 $

  回答下列问题:\
  (1) 我国学者结合实验与计算机模拟结果,研究了光催化 $#ce("CO2")$ 加氢合成甲醇的反应历程,如图所示,其中吸附在催化剂表面的物种用 \* 表示。
  #figure(
    image("images/反应历程.png", width: 70%), // Reaction coordinate diagram for CO2 hydrogenation to methanol
    caption: [反应历程图，显示相对能量与反应历程的关系],
  )
  ① $Delta H_1$ #uline(width: 3em) 0 (填 ">" 或 "<")。
  ② 图示历程包含 #uline(width: 3em) 个基元反应,其中最大能垒(活化能)步骤的化学方程式为 #uline(width: 30em)。

  (2) 向刚性容器中充入一定量 $#ce("CO2")$ 和 $#ce("H2")$,在相同压强和不同温度下,反应相同时间,$#ce("CO2")$ 的转化率和甲醇选择性[已知甲醇的选择性 $= (n#ce("CH3OH")) / (n_("反应")(#ce("CO2"))) times 100 %$]随温度的变化如图所示:
  #figure(
    image("images/image-9.png", width: 45%), // Graph of CO2 conversion rate and methanol selectivity vs temperature
    caption: [$"CO"_2$转化率和甲醇选择性随温度的变化曲线],
  )
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
  #v(100%)
根据题意：
#ce("CO2") 的总起始量为 1 mol, #ce("H2") 的总起始量为 3 mol。
达到平衡时 #ce("CO2") 的总转化率为 20%，则反应消耗的 #ce("CO2") 总量为:
$ n(#ce("CO2"))_(("reacted"_"total")) = 1 "mol" times 20 percent = 0.20 "mol" $

甲醇的选择性为 75%，选择性定义为转化为目标产物的某反应物占该反应物总消耗量的比例。在这里，指转化为甲醇的 #ce("CO2") 占反应消耗的 #ce("CO2") 总量的比例。
所以，反应 I (#ce("CO2 + 3H2 <-> CH3OH + H2O")) 中消耗的 #ce("CO2") 量为:
$ n(#ce("CO2"))_(("RxnI")) = n(#ce("CO2"))_(("反应总量")) times "选择性"(#ce("CH3OH")) $
$ n(#ce("CO2"))_(("RxnI")) = 0.20 "mol" times 75 percent = 0.15 "mol" $#table(
    columns: 8,
    align: center,
    stroke: none, 
    [反应一:],[$"CO"_2$],[$+$],[$3H_2$],[#ce("<->")],[$"CH"_3"OH"$],[$+$],[$H_2O$], 
    [起始量/mol],[1],[],[3],[],[0],[],[0],
    [转化量/mol],[0.15],[],[0.45],[],[0.15],[],[0.15],
  )

    #table(
    columns: 8,
    align: center,
    stroke: none, 
    [反应一:],[$"CO"_2$],[$+$],[$H_2$],[#ce("<->")],[$"CO"$],[$+$],[$H_2O$], 
    [转化量/mol],[0.05],[],[0.05],[],[0.05],[],[0.05],
    [平衡量/mol],[0.8],[],[2.5],[],[0.05],[],[0.2],
  )
  则 #ce("H2") 的转化率为 $(0.45 plus 0.05)/3 times 100 percent = 16.7percent $

  反应二的气体分子数不变, 我们可以用 n 来代替平衡常数 $K_p$

  $
  K_p = (P("CO") dot P("H2O"))/(P("CO2") dot P("H2")) = (n("CO") dot n("H2O"))/(n("CO2") dot n("H2"))
    = (0.05 times 0.2)/(0.8 times 2.5) = 0.005
  $
19. (14分) 文拉法辛(化合物 H)是一种用于治疗各类抑郁症的药物,其合成路线如图所示。
  #figure(
    image("images/image-8.png", width: 73%), // Synthesis route of Venlafaxine (Compound H)
    caption: [文拉法辛合成路线图],
  )
  回答下列问题:\
  (1) A 的化学名称是 #uline(width: 15em)。\
  (2) D $->$ E 的反应类型是 #uline(width: 15em)。\
  (3) F 的结构简式为 #uline(width: 15em)。\
  (4) G 的官能团名称为醚键、 #uline(width: 8em)、 #uline(width: 8em)。\
  (5) A 与 HCHO 反应形成线型结构高分子的反应方程式为 #uline(width: 30em)。\
  #image("images/酚醛树脂的合成.png", width: 50%)
  (6) 在 D 的同分异构体中,同时满足下列条件的共有 #uline(width: 5em) 种(不考虑立体异构)。

  #grid(
    columns: 4,
    gutter: 1fr,
    [a. 能使溴水褪色], [b. 含有酰胺基], [c. 含有苯环,不含其他环],
  )
  其中核磁共振氢谱有 5 组峰,且峰面积之比为 $2:2:2:2:1$ 的同分异构体的结构简式为 #uline(width: 10em) (只写一种)。
  $ "不饱和度"("DBE") = C - H/2 + N/2 + 1 $
  $ "PH"-C-C-"CONH"_2 $
  $ "PH"-C-C-"NCHO" $
  #line(length:  100%)
  // $ "PH"-C-C $
  还有以上两种的同分异构体
  #line(length:  100%)
  $ "PH"-"CON"-C-C $
  $ "PH"-"NCO"-C-C $
  $C-C$ 也连到 N 原子上