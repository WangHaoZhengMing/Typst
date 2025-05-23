#set document(title: "如实填写")
#set heading(numbering: "一、")
#set text(font: "PingFang SC")

//选择题要用的横线
#let uline(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}

//代码块要用这个函数
#let coder(code) = block(
  width: 100%,
  inset: 1em,
  fill: rgb("#F6F8FA"),
  radius: 8pt,
)[#v(-8pt)
  #text(size: 24pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
  #v(-5pt)
  #text(size: 12pt, font: "SF Mono")[#code]
]

#align(left)[#text(font: "Heiti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[$2023-2024$ 年《操作系统》期末试题]]) // Modified title based on OCR
#align(center)[#text(size: 1.8em, font: "Heiti SC")[操作系统]] // Modified subject
#text(font: "Heiti SC")[注意事项]：
#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答题卡上所粘贴的条形码上的姓名、准考证号与您本人是否相符。

= 单项选择题(每题1分,共20分)

1. 操作系统的发展过程是 ( )
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 原始操作系统, 管理程序, 操作系统], [B. 原始操作系统, 操作系统, 管理程序],
    [C. 管理程序, 原始操作系统, 操作系统], [D. 管理程序, 操作系统, 原始操作系统],
  )

2. 用户程序中的输入、输出操作实际上是由 ( ) 完成。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 程序设计语言], [B. 操作系统], [C. 编译系统], [D. 标准库程序],
  )

3. 进程调度的对象和任务分别是 ( )。
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 作业, 从就绪队列中按一定的调度策略选择一个进程占用 CPU],
    [B. 进程, 从后备作业队列中按调度策略选择一个作业占用 CPU],
    [C. 进程, 从就绪队列中按一定的调度策略选择一个进程占用 CPU],
    [D. 作业, 从后备作业队列中调度策略选择一个作业占用 CPU],
  )

4. 支持程序浮动的地址转换机制是 ( )
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 动态重定位], [B. 段式地址转换], [C. 页式地址转换], [D. 静态重定位],
  )

5. 在可变分区存储管理中, 最优适应分配算法要求对空闲区表项按 ( )进行排列。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 地址从大到小], [B. 地址从小到大], [C. 尺寸从小到大], [D. 尺寸从大到小],
  )

6. 设计批处理多道系统时, 首先要考虑的是 ( )。
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 灵活性和可适应性], [B. 系统效率和吞吐量],
    [C. 交互性和响应时间], [D. 实时性和可靠性],
  )

7. 当进程因时间片用完而让出处理机时, 该进程应转变为 ( )状态。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 等待], [B. 就绪], [C. 运行], [D. 完成],
  )

8. 文件的保密是指防止文件被 ( )。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 篡改], [B. 破坏], [C. 窃取], [D. 删除],
  )

9. 若系统中有五个并发进程涉及某个相同的变量A, 则变量A的相关临界区是由 ( )临界区构成。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 2个], [B. 3个], [C. 4个], [D. 5个],
  )

10. 按逻辑结构划分, 文件主要有两类: #uline() 和流式文件。
  #grid(
    columns: 4, // Adjusted to 2 columns for these options
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 记录式文件], [B. 网状文件],
    [C. 索引文件], [D. 流式文件],
  )

11. UNIX 中的文件系统采用 ( )。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 网状文件], [B. 记录式文件], [C. 索引文件], [D. 流式文件],
  )

12. 文件系统的主要目的是 ( )。
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 实现对文件的按名存取], [B. 实现虚拟存贮器],
    [C. 提高外围设备的输入输出速度], [D. 用于存贮系统文档],
  )

13. 文件系统中用 ( ) 管理文件。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 堆栈结构], [B. 指针], [C. 页表], [D. 目录],
  )

14. 为了允许不同用户的文件具有相同的 文件名, 通常在文件系统中采用 ( )。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 重名翻译], [B. 多级目录], [C. 约定], [D. 文件名],
  )

15. 在多进程的并发系统中, 肯定不会因竞争 ( ) 而产生死锁。
  #grid(
    columns: 4, // Adjusted for readability
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 打印机], [B. 磁带机],
    [C. CPU], [D. 存储器], // Assuming D was meant to be generic, using OCR text. Or perhaps something else was cut.
  )

16. 一种既有利于短小作业又兼顾到长作业的作业调度算法是 ( )。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 先来先服务], [B. 轮转],
    [C. 最高响应比优先], [D. 均衡调度], // Assuming D based on common algorithms, OCR is "均衡调度"
  )

17. 两个进程合作完成一个任务。在并发执行中, 一个进程要等待其合作伙伴发来消息, 或者建立某个条件后再向后执行, 这种制约性合作关系被称为进程的 ( )。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 互斥], [B. 同步],
    [C. 通信], [D. 伙伴], // OCR is "伙伴"
  )

18. 当每类资源只有一个个体时, 下列说法中不正确的是 ( )。
  #grid(
    columns: 4, // Options are longer
    gutter: 10pt,
    column-gutter: 1fr,

    [A. 有环必死锁],
    [B. 死锁必有环],
    [C. 有环不一定死锁],
    [D. 被锁者一定在环中]
  )

19. 数据文件存放在到存储介质上时, 采用的逻辑组织形式与 ( ) 有关的。
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 文件逻辑结构], [B. 存储介质特性], [C. 主存储器管理方式], [D. 分配外设方式],
  )

20. 在单处理器的多进程系统中, 进程什么时候占用处理器和能占用多长时间, 取决于 ( )。
  #grid(
    columns: 2, // Options are longer
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 进程相应的程序段的长度],
    [B. 进程自身和进程调度策略],
    [C. 进程总共需要运行时间多少],
    [D. 进程完成什么功能],
  )

= 填空题(每空2分,共20分)

1. 若信号量 $S$ 的初值定义为10, 则在 $S$ 上调用了16次 $P$ 操作和15次 $V$ 操作后 $S$ 的值应该为 #uline()。
2. 进程调度的方式通常有 #uline() 和 #uline() 两种方式。
3. 每个索引文件都必须有一张 #uline() 表, 其中的地址登记项用来指出文件在外存上的位置信息。
4. 在一请求分页系统中, 假如一个作业的页面走向为:4、3、2、1、4、3、5、4、3、2、1、5、当分配给该作业的物理块数为4时(开始时没有装入页面), 采用LRU 页面淘汰算法将产生 #uline() 次缺页中断。
5. 信号量被广泛用于三个目的是 #uline() 、 #uline() 和描述前趋关系。
6. 程序并发执行时的特征是 #uline() 、 #uline() 、 #uline() 和独立性。

= 判断题(每题1分,共10分)
// For T/F questions, the user did not specify a format other than extracting the content.
// I will list the statements. Typically, a ( ) or [ ] follows for the answer.
// I will add #uline() for the answer.

1. 文件系统中分配存储空间的基本单位不是记录。 (#uline())
2. 具有多道功能的操作系统一定是多用户操作系统。 (#uline())
3. 虚拟存储器是由操作系统提供的一个假想的特大存储器, 它并不是实际的内存, 其大小可比内存空间大得多。 (#uline())
4. 批处理系统的(主要优点)是系统的吞吐量大、资源利用率高、系统的开销较小。 (#uline())
5. 文件系统中源程序是有结构的记录式文件。 (#uline())
6. 即使在多道程序环境下, 普通用户也能设计用内存物理地址直接访问内存的程序。 (#uline())
7. 顺序文件适合建立在顺序存储设备上, 而不适合建立在磁盘上。 (#uline())
8. SPOOLing 系统实现设备管理的虚拟技术, 即:将独占设备改造为共享设备。它由专门负责I/O的常驻内存进程以及输入、输出井组成。 (#uline())
9. 系统调用是操作系统与外界程序之间的接口, 它属于核心程序。在层次结构设计中, 它最靠近硬件。 (#uline())
10. 若系统中存在一个循环等待的进程集合, 则必定会死锁。 (#uline())

= 程序与算法(共10分)

设有一缓冲池 $P$, $P$ 中含有20个可用缓冲区, 一个输入进程将外部数据读入 $P$, 另一个输出进程将 $P$ 中数据取出并输出。若进程每次操作均以一个缓冲区为单位, 试用记录型信号量写出两个进程的同步算法, 要求写出信号量的初值。
解:

= 问答题(共16分)

某系统有A、B、C、D四类资源可供五个进程 $P_1, P_2, P_3, P_4, P_5$ 共享。系统对这四类资源的拥有量为:A类3个、B类14个、C类12个、D类12个。进程对资源的需求和分配情况如下:

#figure(
  table(
    columns: (auto, auto, auto),
    stroke: 0.5pt,
    align: center,
    [*进程*], [*已占有资源* (A B C D)], [*最大需求数* (A B C D)],
    [$P_1$], [0 0 1 2], [0 0 1 2],
    [$P_2$], [1 0 0 0], [1 7 5 0],
    [$P_3$], [1 3 5 4], [2 3 5 6],
    [$P_4$], [0 6 3 2], [0 6 5 2],
    [$P_5$], [0 0 1 4], [0 6 5 6],
  ),
  caption: [进程资源分配和需求表],
)

按银行家算法回答下列问题:\
(1) 现在系统中的各类资源还剩余多少?(4分)\
(2) 现在系统是否处于安全状态?为什么?(6分)\
(3) 如果现在进程 $P_2$ 提出需要A类资源0个、B类资源4个、C类资源2个和D类资源0个, 系统能否去满足它的请求?请说明原因。(6分)

= 计算题 (第1题6分; 第2题10分, 第3题8分; 共24分)

1. 某一虚拟存储器的用户编程空间共32个页面, 每页为1KB, 内存为16KB。假定某时刻一用户页表中已调入内存的页面的页号和物理块号的对照表如下:
#align(center)[
  #grid(
    columns: 2,
    gutter: 2em,
    [
      #figure(
        table(
          columns: (auto, auto),
          stroke: 0.5pt,
          align: center,
          [*页号*], [*物理块号*],
          [0], [5],
          [1], [10],
          [2], [4],
          [3], [7],
        ),
        caption: [页表对照表],
      )

    ],
    [#v(0.4cm)
      #figure(
        table(
          columns: (auto, auto, auto),
          stroke: 0.5pt,
          align: center,
          [*作业号*], [*提交时间 (小时)*], [*执行时间 (小时)*],
          [1], [8.5], [2.0],
          [2], [9.2], [1.6],
          [3], [9.4], [0.5],
        ),
        caption: [作业提交与执行时间表],
      )<作业提交与执行时间表>
    ],
  )
]
则逻辑地址 0A5D(H) 所对应的物理地址是什么? (6分)

2. 设有三道作业, 它们的提交时间及执行时间由@作业提交与执行时间表 给出。试计算在单道程序环境下, 采用先来先服务调度算法和最短作业优先调度算法时的平均周转时间(时间单位:小时, 以十进制进行计算;要求写出计算过程)(10分)

3. 假定当前磁头位于100号磁道, 进程对磁道的请求序列依次为55, 58, 39, 18, 90, 160, 150, 38, 180。当采用先来先服务和最短寻道时间优先算法时, 总的移动的磁道数分别是多少? (请给出寻道次序和每步移动磁道数)(8分)

//answer
#pagebreak()
#align(center)[= 参考答案]
#set heading(numbering: "1.1")
#let answer-choice(num, answer, reasoning) = {
  text(weight: "bold")[#num. #sym.space #box([正确答案：#answer], stroke: 1pt, outset: 2.5pt)]
  linebreak()
  pad(left: 0em)[#reasoning]
}

#let answer-true-false(num, answer, reasoning) = {
  text(weight: "bold")[#num. #sym.space #box([正确答案：#answer], stroke: 1pt, outset: 2.5pt)]
  linebreak()
  [#reasoning]
}

#let answer-analysis(num, solution) = {
  text(weight: "bold")[#num. #pad(left: 1em)[#solution]
  ]
}

== 选择题

#answer-choice(
  1,
  [B],
  [
    1. *A. 创建一个子类对象时, 对应的父类对象也一并创建。*
      - 这是正确的说法。当创建子类对象时，父类对象会被隐式创建。
      - *正确。*

    2. *B. 选项*
      - 这是错误的说法。原因:
      - *无效。*

    3. *C. 子类继承的方法不可以操作子类新声明的变量。*
      - 这是错误的说法。子类可以在继承的方法中操作子类新声明的变量。
      - *无效。*

    4. *D. 子类新定义的方法没有办法操作子类隐藏的成员变量。*
      - 这是错误的说法。子类新定义的方法可以操作子类隐藏的成员变量。
      - *无效。*
    #figure(
      table(
        columns: (auto, auto),
        inset: 6pt,
        align: left,
        [概念], [说明],
        [构造方法继承], [子类不能继承父类构造方法，但可以通过super( ) 调用],
        [对象创建顺序], [创建子类对象时，先创建父类对象，再创建子类对象],
        [变量访问], [子类可以访问继承的变量和自己声明的变量],
        [变量隐藏], [子类可以声明与父类同名的变量，形成变量隐藏],
        [方法重写], [子类可以重写父类的方法，使用\@Override注解],
        [super关键字], [用于调用父类构造方法和访问父类成员],
      ),
      caption: "Java继承机制的核心概念",
    )

  ],
)

== 判断题
#let apple-table = figure(
  table(
    columns: 6,
    align: center,
    inset: 9pt,
    stroke: rgb("#E5E5E5"),
    fill: (_, row) => if row == 0 { rgb("#F5F5F7") } else { none }, // Light header background
    [题号], [], [], [], [], [], // Header row
    [1-5], [❌], [❌], [✅], [✅], [✅],
    [6-10], [✅], [❌], [❌], [✅], [✅],
    [11-15], [✅], [✅], [❌], [✅], [✅],
    [16-20], [✅], [✅], [✅], [❌], [❌],
  ),
  caption: [判断题答案一览表],
  supplement: "Table",
)

#align(center, apple-table)
#answer-true-false(
  1,
  "❌",
  [Java字节码（.class文件）是二进制文件，但不能直接在任何平台执行。它需要JVM（Java虚拟机）来解释执行。],
)

== 程序分析题

#answer-analysis(
  1,
  [
    #table(
      columns: (auto, auto),
      align: left + horizon,
      [代码1],
      [在这段代码中，Father 是父类，Son 继承并重写了 print 方法，通过多态机制，尽管变量类型是 Father，但实际对象是 Son，因此调用的是 Son 的 print 方法，print(5) 返回 6，最终输出结果为 6。],

      [代码2],
      [在Java中，类的成员变量只能在构造方法或方法中初始化，或者在声明时直接初始化。不能在类体中直接写赋值语句。应该改为 `int n = 200;` 或在构造方法中赋值。],

      [代码3],
      [局部变量m在使用前未初始化。Java要求局部变量在使用前必须显式初始化。应该先给m赋值，如 `int m = 0;` 或其他适当的值。],
    )
  ],
)


== 简答题
写的详细一点就好
