#import "@preview/cuti:0.2.1": show-cn-fakebold
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
#align(left)[#text(font:"Heiti SC")[绝密★启用前]]
#align(center,text(15pt)[#text(font:"Songti SC")[$2024-2025$ 年河南工业大学期末考试]])
#align(center)[#text(size: 1.8em,font: "Heiti SC")[计算机组成原理]]
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
    columns: (2),
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 本指令流单数据流],
    [B. 按地址访问并顺序执行指令],
    [C. 堆栈操作],
    [D. 存储器按内容选择地址]
   )],
   
  [在机器数中，零的表示形式是唯一的。\
   #grid(
    columns: (4),
    gutter: 1fr,
    [A. 原码],
    [B. 补码],
    [C. 移码],
    [D. 反码]
   )],
   
  [在定点二进制运算器中，减法运算一般通过 \_\_\_\_ 来实现。\
   #grid(
    columns: (2),
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 原码运算的二进制减法器],
    [B. 补码运算的二进制减法器],
    [C. 原码运算的十进制加法器],
    [D. 补码运算的二进制加法器]
   )],
   
  [某计算机字长32位，其存储容量为4MB，若按半字编址，它的寻址范围是\
   #grid(
    columns: (4),
    gutter: 1fr,
    [A. 0\~4MB],
    [B. 0\~2MB],
    [C. 0\~2M],
    [D. 0\~1M]
   )],
   
  [主存贮器和CPU之间增加cache的目的是\
   #grid(
    columns: (auto),
    gutter: 10pt,
    [A. 解决CPU和主存之间的速度匹配问题],
    [B. 扩大主存贮器容量],
    [C. 扩大CPU中通用寄存器的数量],
    [D. 既扩大主存贮器容量，又扩大CPU中通用寄存器的数量]
   )],
   
  [单地址指令中为了完成两个数的算术运算，除地址码指明的一个操作数外，另一个常需采用\
   #grid(
    columns: (2),
    gutter: 10pt,
    column-gutter: 70pt,
    [A. 堆栈寻址方式],
    [B. 立即寻址方式],
    [C. 隐含寻址方式],
    [D. 间接寻址方式]
   )],
   
  [同步控制是\
   #grid(
    columns: (2),
    gutter: 10pt,
    column-gutter: 50pt,
    [A. 只适用于CPU控制的方式],
    [B. 只适用于外围设备控制的方式],
    [C. 由统一时序信号控制的方式],
    [D. 所有指令执行时间都相同的方式]
   )],
   
  [描述PCI总线中基本概念不正确的句子是\
   #grid(
    columns: (auto),
    gutter: 10pt,
    [A. PCI总线是一个与处理器无关的高速外围设备],
    [B. PCI总线的基本传输机制是猝发或传送],
    [C. PCI设备一定是主设备],
    [D. 系统中只允许有一条PCI总线]
   )],
   
  [CRT的分辨率为1024×1024像素，像素的颜色数为256，则刷新存储器的容量为\
   #grid(
    columns: (4),
    gutter: 1fr,
    [A. 512KB],
    [B. 1MB],
    [C. 256KB],
    [D. 2MB]
   )],

  [为了便于实现多级中断,保存现场信息最有效的办法是采用\_\_\_\ 
  #grid(
    columns:4,
    gutter: 1fr,
    [A. 通用寄存器],[B. 堆栈],[C. 存储器],[D. 外存]
  )
  ]
)
== 二、填空题（共 8 题，每空 1 分，共 25 分）
1. 在计算机术语中，将运算器和控制器以及 存储器合在一起称为 B。
2. 数的真值变成机器码可采用 A 表示法，移码表示法和 B 。
3. 广泛使用的 A  不如后者高。
4. 形式指令地址的方式，称为A   取出一条指令的命令称为B  。 由于各种指令功能不同，各种指令的指令周期是 C。
5. CPU 从 A。
6. 微型计算机的标准的标准总线从 16 位的 A 总线，又进一步发展到 64 位的 PCI 总线。
7. VESA 标准是一个可扩展的 A。
8. 中断处理过程可以进行 B 的中断服务程序。

== 三、简答题（共 3 题，每题 5 分，共 15 分）
1. 什么是刷新存储器？其存储容量与什么因素有关？
