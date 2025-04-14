#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/cetz:0.3.4": *
#import "@preview/cetz-plot:0.1.0": *
#set text(size: 12pt, font: ("New Computer Modern", "Songti SC"), lang: "zh")
#show: show-cn-fakebold
#set page(margin: 2cm)
// #set par(justify: true, leading: 1em)
#set block(above: 1.2em)
#let fakepar = context {
  box()
  v(-measure(block() + block()).height)
}
// #show heading: it => it + fakepar
#set math.mat(delim: "[")
#show heading.where(level: 1): set align(center)
#show heading.where(level: 2): set text(size: 12pt)

#let quiz(body1, body2) = {
  counter("quiz").step()
  grid(
    columns: (1.6em, auto),
    context { counter("quiz").display("1.") }, // 使用 context
    body1,
  )
  {
    set par(first-line-indent: 1.6em)
    body2
  }
}
#let ubox(width) = box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))
#let ident() = h(1.6em)

// #set page(footer: align(center)[数据结构 #counter(page).display("第 1 页（共 1 页）",both: true)])

//----------------------------------------------------------------------------------
#align(left)[#text(font: "Heiti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[$2024-2025$ 年河南工业大学期末考试]])
#align(center)[#text(size: 1.8em, font: "Heiti SC")[计算机组成原理]]
#text(font:"Heiti SC")[注意事项]：

#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答上所粘贴的条形码上的姓名、准考证号与您本人是否相符。
== 一、选择题：本大题共 $10$ 小题，每小题 $1$ 分，共 $10$ 分。在每小题给出的四个选项中，只有一项是符合题目要求的。#set enum(numbering: "1、")
#enum(
  spacing: 1.5em,
  [冯·诺依曼机工作的基本方式的特点是\
    #grid(
      columns: 2,
      gutter: 10pt,
      column-gutter: 1fr,
      [A. 本指令流单数据流],
      [B. 按地址访问并顺序执行指令],
      [C. 堆栈操作],
      [D. 存储器按内容选择地址]
    )],

  [在机器数中，零的表示形式是唯一的。\
    #grid(
      columns: 4,
      gutter: 1fr,
      [A. 原码],
      [B. 补码],
      [C. 移码],
      [D. 反码]
    )],

  [在定点二进制运算器中，减法运算一般通过 \_\_\_\_ 来实现。\
    #grid(
      columns: 2,
      gutter: 10pt,
      column-gutter: 1fr,
      [A. 原码运算的二进制减法器],
      [B. 补码运算的二进制减法器],
      [C. 原码运算的十进制加法器],
      [D. 补码运算的二进制加法器]
    )],

  [某计算机字长32位，其存储容量为4MB，若按半字编址，它的寻址范围是\
    #grid(
      columns: 4,
      gutter: 1fr,
      [A. 0\~4MB],
      [B. 0\~2MB],
      [C. 0\~2M],
      [D. 0\~1M]
    )],

  [主存贮器和CPU之间增加cache的目的是\
    #grid(
      columns: auto,
      gutter: 10pt,
      [A. 解决CPU和主存之间的速度匹配问题],
      [B. 扩大主存贮器容量],
      [C. 扩大CPU中通用寄存器的数量],
      [D. 既扩大主存贮器容量，又扩大CPU中通用寄存器的数量]
    )],

  [单地址指令中为了完成两个数的算术运算，除地址码指明的一个操作数外，另一个常需采用\
    #grid(
      columns: 2,
      gutter: 10pt,
      column-gutter: 70pt,
      [A. 堆栈寻址方式],
      [B. 立即寻址方式],
      [C. 隐含寻址方式],
      [D. 间接寻址方式]
    )],

  [同步控制是\
    #grid(
      columns: 2,
      gutter: 10pt,
      column-gutter: 50pt,
      [A. 只适用于CPU控制的方式],
      [B. 只适用于外围设备控制的方式],
      [C. 由统一时序信号控制的方式],
      [D. 所有指令执行时间都相同的方式]
    )],

  [描述PCI总线中基本概念不正确的句子是\
    #grid(
      columns: auto,
      gutter: 10pt,
      [A. PCI总线是一个与处理器无关的高速外围设备],
      [B. PCI总线的基本传输机制是猝发或传送],
      [C. PCI设备一定是主设备],
      [D. 系统中只允许有一条PCI总线]
    )],

  [CRT的分辨率为1024×1024像素，像素的颜色数为256，则刷新存储器的容量为\
    #grid(
      columns: 4,
      gutter: 1fr,
      [A. 512KB],
      [B. 1MB],
      [C. 256KB],
      [D. 2MB]
    )],

  [为了便于实现多级中断,保存现场信息最有效的办法是采用\_\_\_\
    #grid(
      columns: 4,
      gutter: 1fr,
      [A. 通用寄存器], [B. 堆栈], [C. 存储器], [D. 外存],
    )
  ],
)
== 二、填空题（共 8 题，每空 1 分，共 8 分）
#let uline(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}
1. 在计算机术语中，将运算器和控制器以及存储器合在一起称为#uline()。

2. 数的真值变成机器码可采用#uline()表示法，#uline()表示法和#uline()表示法。

3. 广泛使用的#uline()不如#uline()高速。

4. 形成指令地址的方式，称为#uline()；取出一条指令的命令称为#uline()。由于各种指令功能不同，各种指令的指令周期是#uline()。

5. CPU从#uline()取指令。

6. 微型计算机的标准总线从16位的#uline()总线，又进一步发展到64位的PCI总线。

7. VESA标准是一个可扩展的#uline()。

8. 中断处理过程可以进行#uline()的中断服务程序。

== 三、简答题（共 3 题，每题 5 分，共 15 分）
1. 什么是刷新存储器？其存储容量与什么因素有关？

+ 外设的 I/O 控制方式分为哪几类? 各具什么特点?
+ 什么是指令周期?什么是机器周期?什么是时钟周期?三者有什么关系?
== 四、综合题(共 $5$ 题, 每题 $10$ 分, 共 $50$ 分)
+ 已知 $x=-0.01111,y=+0.11001,$ 求 $[x]_补,[-x]_补,[y]_补,[-y]_补$, $x+y=?, x-y=?$

+ 假设机器字长16位，主存储容量为128K 字节，指令长度为16位或32 位，其有128条指令，设计计算机指令格式，要求有直接、立即数、相对、基值、间接、变址六种寻址方式。

+ 某机字长 32 位，常规设计的存储空间 $≤32$M，若将存储空间扩至 256M，请提出一种可能方案.

+ 如@计组2425, 有两条独立的总线和两个独立的存贮器。已知指令存贮器IM 最大容量为16384字（字长18位），数据存器 DM 最大容量是65536字（字长16位）。各寄存器均有"打入"（$R_"in"$）"送出"（$R_"out"$）控制命令，但图中未标出
  #figure(
    image("image/计组2425.jpg", width: 80%),
    caption: [4题图],
  )<计组2425>
  假设处理机格式为:

  #figure(
    canvas({
      import draw: *
      rect((-5,0), (-2,1))
      rect((-2,0), (1,1))
      content((-3.5,0.5), [OP])
      content((0,0.5), [X])
      content((-4.8,1.3), [17])
      content((-2,1.3), [10 #h(1em) 9])
      content((0.5,1.3), [0])
    })
  )
  加法指令可写为 "$"ADD" X (R_i)$"。其功能是 $("AC"_o+((R_i)+X)→"AC"_I)$，其中 $((R_i)+X)$ 部分通过寻址方式指向数据存贮器，现取R为$R_I$。试画出ADD指令从取指令开始到执行结束的操作序列图，写明基本操作步骤和相应的微操作控制信号。

+ 假设某磁盘，每面有220道：已知磁盘转速 =3000装/分。数据传输率为175000B/s。求该磁盘总容量.
