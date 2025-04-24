#import "@preview/touying:0.6.1": *
#import "@preview/lilaq:0.2.0" as lq
#import themes.dewdrop: *
#set text(lang: "zh", font: "PingFang SC") // Or another suitable Chinese font like "Songti SC", "Kaiti SC" etc.
#import "@preview/numbly:0.1.0": numbly

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution, // You might want to set institution info
  navigation: "mini-slides", // Or other navigation options
)

// Optional: Set institution info for the footer
#let s = state("institution", "")
#s.update(institution => [数理统计]) // Set footer text

// Optional: Outline slide
#outline-slide()

#set par(first-line-indent: (amount: 1.5em, all: true))
#set heading(numbering: none) // Turn off default heading numbering if desired


// Page 3: Transition
#slide[
  #align(center)[
    #v(2cm)
    这一章我们讨论对参数的假设检验.
    #v(2cm)
    // Placeholder for image if needed
    // #image("professor.png", width: 20%)
    #v(1cm)
    让我们先看一个例子.
  ]
]

// Page 4: Example Intro - Coke Cans
#slide[
  #grid(
    columns: (20%, 80%),
    gutter: 10pt,
    align: horizon,
    [
      // Placeholder for can images
      #rect(width: 100%, height: 8cm, fill: luma(230))[#align(center)[(Image: Cans)]]
    ],
    [
      #align(center)[
        #text(size: 16pt)[罐装可乐的容量按标准应在 #text(fill: blue)[350毫升] 和 #text(fill: blue)[360毫升] 之间.]
      ]
      #v(1.5em)
      生产流水线上罐装可乐不断地封装, 然后装箱外运. 怎 么知道这批罐装可乐的容量是否合格呢?
      #v(2em)
      // Placeholder for factory image
      #rect(width: 100%, height: 6cm, fill: luma(230))[#align(center)[(Image: Factory)]]

      #grid(
        columns: (60%, 40%),
        [把每一罐都打开倒入量杯, 看看容量是否合于标准.],
        [#box(fill: red.darken(50%), stroke: white, radius: 8pt, inset: 10pt)[#align(center)[这样做显然不 行!]]],
      )
    ],
  )
]

// Page 5: Sampling Inspection

#grid(
  columns: (),
  gutter: 10pt,
  [
    通常的办法是进行 #text(fill: blue)[抽样检查].
    #v(1.5em)
    每隔一定时间, 抽查若干罐. 如每隔1小时, 抽 查5罐, 得5个容量的值 $X_1, ..., X_5$, 根据这些值 来判断生产是否正常.
    #v(1.5em)
    如发现不正常, 就应停产, 找出原因, 排除 故障, 然后再生产; 如没有问题, 就继续按规定 时间再抽样, 以此监督生产, 保证质量.
  ],
)
#v(100%)
很明显, 不能由5罐容量的数据, 在把握不大 的情况下就判断生产不正常, 因为停产的损失是 很大的.
#v(1.5em)
当然也不能总认为正常, 有了问题不能及时 发现, 这也要造成损失.
#v(1.5em)
#align(center)[
  #text(size: 16pt)[如何处理这两者的关系, #text(fill: blue)[假设检验] 面对的就 是这种矛盾.]
]


// Page 7: Setting up the problem
#slide[
  #grid(
    columns: auto,
    gutter: 10pt,
    //align: top + horizon,


    [
      罐装可乐的容量按标准应在 350毫升和360毫升之间.

      现在我们就来讨论这个问题.

      在正常生产条件下, 由于种种随机因素的影响, 每罐可乐的容量应在 #text(fill: green)[355毫升] 上下波动. 这些因素 中没有哪一个占有特殊重要的地位. 因此, 假定每 罐容量服从 #text(fill: blue)[正态分布] 是合理的.
    ],
  )
]

// Page 8: Hypotheses Definition
#slide[
  #grid(
    columns: auto,
    gutter: 10pt,
    //align: top + horizon,


    [
      这样, 我们可以认为 $X_1, ..., X_5$ 是取自正态 总体 $N(mu, sigma^2)$ 的样本, 当生产比较稳定时, $sigma^2$ 是一个常数. 现在要检验的假设是:

      #align(center)[$ H_0: mu = mu_0 quad (mu_0 = 355) $]
      #move(dx: 2em, dy: -1em)[
        #box(fill: luma(220), stroke: luma(180), radius: 8pt, inset: 10pt)[
          在实际工作中, 往往把 #text(fill: blue)[不轻易 否定的命题] 作为原假设.
        ]
      ]

      它的对立假设是:
      #v(0.5em)
      #align(center)[$ H_1: mu != mu_0 $]

      称 $H_0$ 为 #text(fill: green)[原假设] (或零假设);
      #v(0.5em)
      称 $H_1$ 为 #text(fill: green)[备择假设] (或对立假设).
    ],
  )
]

// Page 9: Test Logic Basis
#slide[
  #grid(
    columns: auto,
    gutter: 10pt,
    // //align: top + horizon,


    [
      那么, 如何判断原假设 $H_0$ 是否成立呢?

      由于 $mu$ 是正态分布的期望值, 它的估计量是样本 均值 $overline(X)$, 因此可以根据 $overline(X)$ 与 $mu_0$ 的差距
      #align(center)[$ abs(overline(X) - mu_0) $]
      来判断 $H_0$ 是否成立.

      当 $abs(overline(X) - mu_0)$ #text(fill: green)[较小时], 可以认为 $H_0$ 是成立的;
      #v(0.5em)
      当 $abs(overline(X) - mu_0)$ #text(fill: red)[较大时], 应认为 $H_0$ 不成立, 即 生产已不正常.

      较大、较小是一个相对的概念, 合理的界限在何 处? 应由什么原则来确定?
    ]
  )
]

// Page 10: Small Probability Principle
#slide[
  #grid(
    columns: auto,
    gutter: 10pt,
    [
      这里用到人们在实践中普遍采用的一个原则:
      #v(3em)
      #move(dx: 5em)[
        #block(fill: purple.darken(60%), radius: 5pt, inset: 15pt)[
          #text(white, size: 18pt)[小概率事件在一次试验 中基本上不会发生.]
        ]
      ]
    ]
  )
]

// Page 11: Significance Level
#slide[
  在假设检验中, 我们称这个小概率为 #text(fill: blue)[显著性水平], 用 $alpha$ 表示.
  $alpha$ 的选择要根据实际情况而定.
  常取 $ alpha = 0.1, alpha = 0.01, alpha = 0.05 $.
  现在回到我们前面罐装可乐的例中:
  在提出原假设 $H_0$ 后, 如何作出 #text(fill: green)[接受] 和 #text(fill: red)[拒绝] $H_0$ 的结论呢?
]

// Page 12: Formalizing Example
#slide[
  罐装可乐的容量按标准应在350毫升和360毫 升之间. 一批可乐出厂前应进行抽样检查, 现抽 查了 $n$ 罐, 测得容量为 $X_1, X_2, ..., X_n$. 问这一批可 乐的容量是否合格?

  (假设 $X_i ~ N(mu, sigma^2)$, $sigma^2$ 已知, 检验 $mu=355$)
  $ overline(X) = 1 / n sum_(i=1)^n X_i $
  我们在这里知道: $overline(X)$ 符合正态分布, 满足 $overline(X)∼N (mu,(sigma^2)/n)$, 这为我们构造检验统计量提供了理论基础.
  #v(100%)


  #grid(
    columns: auto,
    [
      假设检验的核心是提出两个对立的假设:

      #text(fill: green)[原假设] $(H_0)$:
      $ H_0: mu = 355 $
      这表示我们假设这批可乐的平均容量正好是355毫升, 符合出厂标准.
      原假设是默认的"现状", 我们试图通过数据检验是否能拒绝它.

      #text(fill: green)[备择假设] $(H_1)$:
      $ H_1: mu != 355 $
      这表示我们怀疑这批可乐的平均容量不等于355毫升(可能偏高或偏低).
      备择假设是我们希望通过数据支持的可能性.

      #text(fill: blue)[双侧检验]:
      $H_1: mu != 355$ 表明这是一个双侧检验, 因为我们关注均值是否偏离355(无论偏大还是偏小), 而不是只关心单方向的偏离.
    ]
  )



  #box(inset: 5pt)[提出假设]
  $ H_0: mu = 355 space <==> space H_1: mu != 355 $
  即: 如果数据强烈支持 $mu != 355$, 我们拒绝 $H_0$, 认为这批可乐的平均容量不合格.
  如果数据不足以拒绝 $H_0$, 我们保留 $H_0$, 认为没有足够证据表明均值偏离355.
  由于 $sigma$ 已知,
  选 #text(fill: blue)[检验统计量]

  $ U = (overline(X) - mu_0) / (sigma / sqrt(n)) ~ N(0, 1) $
  它能衡量差异 $abs(overline(X) - mu_0)$ 大小且 #text(fill: green)[分布已知].

  对给定的显著性水平 $alpha$, 可以在 $N(0, 1)$ 表中查到分位点的值 $u_(alpha/2)$, 使

  $ P( abs(U) > u_(alpha / 2) ) = alpha $


  也就是说, "$abs(U) > u_(alpha/2)$" 是一个 #text(fill: red)[小概率事件].
  故我们可以取 #text(fill: red)[拒绝域] 为:
  #align(center)[$ W: abs(U) > u_(alpha / 2) $]

  // Placeholder for N(0,1) diagram with rejection region
  #align(center)[
    #let x = lq.linspace(-3.5, 3.5)
    #let x_left = lq.linspace(-3.5, -1.96) // Example: alpha=0.05, u_alpha/2=1.96
    #let x_right = lq.linspace(1.96, 3.5)
    #show lq.selector(lq.label): set align(top + right)
    #lq.diagram(
      width: 10cm,
      height: 6cm,
      ylim: (0, 0.45),
      xlabel: [$u$],
      ylabel: [$f(u)$],
      lq.plot(x, x.map(x => 1 / calc.sqrt(2 * calc.pi) * calc.exp(-x * x / 2)), label: $U~N(0, 1)$),
      lq.fill-between(
        fill: red.lighten(60%),
        x_left,
        x_left.map(x => 1 / calc.sqrt(2 * calc.pi) * calc.exp(-x * x / 2)),
      ),
      lq.fill-between(
        fill: red.lighten(60%),
        x_right,
        x_right.map(x => 1 / calc.sqrt(2 * calc.pi) * calc.exp(-x * x / 2)),
      ),
      lq.place(-1.96, 0)[$-u_(alpha / 2)$],
      lq.place(1.96, 0)[$u_(alpha / 2)$],
      lq.place(0, 0)[$0$],
      lq.place(-2.5, 0.05)[$alpha / 2$],
      lq.place(2.5, 0.05)[$alpha / 2$],
    )
  ]
  如果由样本值算得该统计量的实测值落入区域 $W$, 则 #text(fill: red)[拒绝 $H_0$]; 否则, #text(fill: green)[不能拒绝 $H_0$].
  #v(100%)
  这里所依据的逻辑是:
  如果 $H_0$ 是对的, 那么衡量差异大小的某个统计 量落入区域 $W$ (拒绝域) 是个 #text(fill: red)[小概率事件]. 如果该统 计量的实测值落入 $W$, 也就是说, $H_0$ 成立下的小概 率事件发生了, 那么就认为 $H_0$ #text(fill: red)[不可信而否定它]. 否 则我们就 #text(fill: green)[不能否定 $H_0$] (只好接受它).

  在上面的例子的叙述中, 我们已经初步介绍 了假设检验的基本思想和方法.
  #v(1.5em)
  下面, 我们再结合另一个例子, 进一步说明假 设检验的一般步骤.

  === 例2
  某工厂生产的一种螺钉, 标准要求长度是 #text(fill: blue)[32.5 毫米]. 实际生产的产品, 其长度 $X$ 假定服从正态分布 $N(mu, sigma^2)$, $sigma^2$ #text(fill: red)[未知]. 现从该厂生产的一批产品中抽 取6件, 得尺寸数据如下:
  #align(center)[
    32.56, 29.66, 31.64, 30.00, 31.87, 31.03
  ]
  问这批产品是否合格?
  #grid(
    columns: (),
    [分析: 这批产品(螺钉长度)的全 体组成问题的总体 $X$. 现在要检 验 $E(X)$ 是否为 #text(fill: blue)[32.5].],
  )
  #v(100%)
  *解答:*
  已知 $X ~ N(mu, sigma^2)$, $sigma^2$ 未知.

  #text(size: 16pt)[第一步: 提出原假设和备择假设]
  #align(center)[$ H_0: mu = 32.5 space <=> space H_1: mu != 32.5 $]
  #v(1.5em)
  #text(size: 16pt)[第二步: 取一检验统计量, 在 $H_0$ 成立下 求出它的分布]
  #align(center)[$ t = (overline(X) - 32.5) / (S / sqrt(6)) ~ t(5) $]
  #box(fill: luma(230), radius: 5pt, inset: 8pt)[
    能衡量差异大小且分布已知
  ]

  #text(size: 16pt)[第三步:]
  对给定的显著性水平 $alpha = 0.01$, 查表确定 临界值 $t_(alpha/2)(5) = t_(0.005)(5) = 4.0322$, 使
  #align(center)[$ P( abs(t) > t_(alpha / 2)(5) ) = alpha $]
  即 "$abs(t) > t_(alpha/2)(5)$" 是一个 #text(fill: red)[小概率事件].
  #move(dx: 10em, dy: 0em)[
    #box(fill: luma(220), stroke: luma(180), radius: 8pt, inset: 10pt)[
      小概率事件在一次 试验中基本上不会 发生.
    ]
  ]
  得 #text(fill: red)[否定域] (拒绝域)
  #align(center)[$ W: abs(t) > 4.0322 $]

  得否定域 $ W: abs(t) > 4.0322 $
  #text(size: 16pt)[第四步:]
  将样本值代入算出统计量 $t$ 的实测值,
  (计算: $overline(x) approx 31.127$, $s approx 1.089$)
  #v(0.5em)
  #align(center)[$
      abs(t) = abs( (31.127 - 32.5) / (1.089 / sqrt(6)) ) approx abs(-1.373 / 0.4446) approx 2.997 < 4.0322
    $]

  #move(dx: 15em, dy: -1em)[
    #box(fill: red.lighten(70%), radius: 8pt, inset: 10pt)[
      没有落入 拒绝域
    ]
  ]
  故 #text(fill: green)[不能拒绝 $H_0$].
  #v(1.5em)
  #block(fill: luma(240), radius: 5pt, inset: 8pt)[
    这并不意味着 $H_0$ 一定对, 只是差异还不够显著, 不足以否定 $H_0$.
  ]
]

// Page 21: Type I and Type II Errors Intro

== 三、假设检验的两类错误
假设检验会不会犯错误呢?
由于作出结论的依据是下述
#grid(
  columns: (40%, 60%),
  gutter: 10pt,
  align: center + horizon,
  [#align(center)[#text(size: 16pt)[小概率原理]]], [#rect(stroke: 1pt, inset: 8pt)[#align(center)[不是一定不发生]]],
)
#v(1.5em)
#block(fill: purple.darken(60%), radius: 5pt, inset: 10pt)[
  #text(white, size: 14pt)[小概率事件在一次试验中 #text(weight: "bold")[基本上] 不会发生.]
]
"基本上" 不发生, 意味着它 #text(fill: red)[仍有可能发生], 只是概率很小.


// Page 22: Defining Errors
#slide[
  如果 $H_0$ #text(fill: green)[成立], 但统计量的实测值落入否定域, 从而作出 #text(fill: red)[否定 $H_0$] 的结论, 那就犯了 "#text(fill: red)[弃真]" 的错误. (#text(fill: red)[Type I Error])
  #v(2em)
  如果 $H_0$ #text(fill: red)[不成立], 但统计量的实测值 #text(fill: green)[未落入否定域], 从而没有作出否定 $H_0$ 的结论 (即 #text(fill: green)[接受了错误的 $H_0$]), 那就犯了 "#text(fill: red)[采伪]" 的错误. (#text(fill: red)[Type II Error])

]

// Page 23: Error Table and Probabilities

#align(center)[#text(size: 18pt)[假设检验的两类错误]]
#table(
  columns: (auto, 1fr, 1fr), // First column sized to content, others share space
  align: center + horizon, // Center content in cells

  inset: (x: 12pt, y: 8pt), // Padding inside cells
  // Row 1: Header spanning two columns
  [], table.cell(colspan: 2)[实际情况], // First cell empty

  // Row 2: Sub-headers
  [决定], [$H_0$为真], [$H_0$不真],

  // Row 3: Reject H0 row
  [拒绝$H_0$],
  [#text(fill: red)[第一类错误]], // Highlighted text
  [正确],

  // Row 4: Accept H0 row
  [接受$H_0$],
  [正确],
  [#text(fill: red)[第二类错误]], // Highlighted text
)


