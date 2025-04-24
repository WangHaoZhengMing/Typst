#set text(font: "PingFang SC")
#import "@preview/cetz:0.3.4": *
#import "@preview/cetz-plot:0.1.0": *

1. 在计算机术语中，将运算器和控制器以及#underline(stroke: 1pt,"寄存器组")合在一起称为#underline(stroke: 1pt,"中央处理器"), 而将#underline(stroke: 1pt,"外部设备")和存储器合在一起称为#underline(stroke: 1pt,"计算机主机")。

#figure(
  canvas({
    import draw: *

    rect((0.5, -2), (4.5, 2), stroke: black)
    content((2.4, 1.6), "计算机主机")

    // 绘制CPU外框
    rect((-4, -2), (0, 2), stroke: black)
    content((-2, 1.6), "CPU")

    // CPU内部组件
    rect((-3.5, -1.5), (-2, -0.5), stroke: black)
    content((-2.75, -1), "运算器")

    rect((-1.8, -1.5), (-0.3, -0.5), stroke: black)
    content((-1.06, -1), "控制器")

    rect((-3.5, 0.2), (-0.3, 1.2), stroke: black)
    content((-2, 0.7), "寄存器组")

    // 存储器
    rect((1, -1.5), (4, -0.5), stroke: black)
    content((2.5, -1), "存储器")

    // 外部设备
    rect((1, 0.2), (4, 1.2), stroke: black)
    content((2.5, 0.7), "外部设备")
  }),
  caption: [计算机主机组成示意图],
)
2. 数的真值变成机器码可采用#underline(stroke: 1pt," 补码 ")表示法，#underline(stroke: 1pt," 原码 ")表示法和#underline(stroke: 1pt," 反码 ")表示法。

  解析：

  #figure(
    table(
      columns: (auto, auto, auto, auto),
      align: center,
      [*数值*], [*原码*], [*反码*], [*补码*],
      [+5], [0101], [0101], [0101],
      [-5], [1101], [1010], [1011],
      [+0], [0000], [0000], [0000],
      [-0], [1000], [1111], [N/A],
    ),
    caption: [4位二进制数的不同表示法示例],
  )

3. 广泛使用的#underline(stroke: 1pt," 动态随机存取存储器 ")不如#underline(stroke: 1pt," 静态随机存取存储器 ")高速,它们都是半导体随机读写存储器。(推荐写英文缩写)

  解析：
  - *DRAM (Dynamic RAM)*：利用电容存储电荷来表示数据（0或1）。电容会漏电，需要定期刷新（充电）以维持数据，因此称为“动态”。结构简单，集成度高，成本较低，容量大，但速度相对较慢，主要用作计算机的主存（内存）。
  - *SRAM (Static RAM)*：利用触发器（通常由多个晶体管组成）来存储数据。只要供电，数据就能保持不变，无需刷新，因此称为“静态”。结构复杂，集成度低，成本高，容量小，但速度快，主要用作CPU的高速缓存（Cache）。


4. 形式指令地址的方式，称为#underline(stroke: 1pt," 立即 ")方式,有#underline(stroke: 1pt," 直接 ")寻址和#underline(stroke: 1pt," 间接 ")寻址。

  解析：寻址方式是指指令中如何给出操作数或指令的地址。



5. CPU从#underline(stroke: 1pt," 主存 ")取出一条指令的命令并执行这条指令称为#underline(stroke: 1pt," 指令周期 ")。由于各种指令操作功能不同，各种指令的指令周期是#underline(stroke: 1pt," 不相同 ")。

  解析：指令周期是CPU执行一条指令所花费的全部时间。它通常包含若干个机器周期（CPU周期），而每个机器周期又包含若干个时钟周期（T周期）。
  一个典型的指令周期包括：
  1. *取指周期 (Fetch Cycle)*：从主存获取指令。
  2. *间址周期 (Indirect Cycle)*：如果指令是间接寻址，需要访问内存获取有效地址。
  3. *执行周期 (Execute Cycle)*：执行指令指定的操作。
  4. *中断周期 (Interrupt Cycle)*：如果允许中断且有中断请求，则响应中断。
  由于不同指令的操作复杂度和寻址方式不同（例如，有的指令需要访存取操作数，有的不需要；有的需要多次访存），完成这些阶段所需的时间也不同，因此指令周期通常是可变的，即不相同。


6. 微型计算机的标准总线从16位的#underline(stroke: 1pt," ISA ")总线，发展到32位的#underline(stroke: 1pt," EISA ")总线和#underline(stroke: 1pt," VESA ")总线,又进一步发展到64位的PCI总线。

  解析：
  #figure(
    table(
      columns: (auto, auto, auto, auto, auto, auto),
      align: center + horizon,
      [*总线标准*], [*位宽*], [*频率*], [*最大带宽*], [*特点*], [*首次发布*],
      [ISA(Industry Standard Architecture)], [16位], [8MHz], [8MB/s], [IBM PC/AT标准总线], [1984年 IBM],
      [EISA(Extended ISA)], [32位], [8.33MHz], [33MB/s], [ISA扩展，向下兼容], [1988年 PC厂商联盟],
      [VESA(Video Electronics Standards Association)],
      [32位],
      [33MHz],
      [132MB/s],
      [局部总线，主要用于显卡],
      [1992年 VESA组织],

      [PCI(Peripheral Component Interconnect)], [32/64位], [33/66MHz], [533MB/s], [高性能，广泛应用], [1993年 Intel],
    ),
    caption: [计算机总线技术发展历程],
  )

7. VESA标准是一个可扩展的标准。它除了兼容传统的#underline(stroke: 1pt," VGA ")等显示方式外,还支持#underline(stroke: 1pt)[1280 #sym.times 1024 ]像素光栅,每像素点#underline(stroke: 1pt," 24 ")颜色深度。

  解析：
  - *VGA (Video Graphics Array)*：IBM于1987年推出的标准，分辨率为640x480，16色；或320x200，256色。
  - *SVGA (Super VGA)*：VGA的扩展，没有统一标准，通常指比VGA更高分辨率和更多颜色的显示模式，如800x600, 1024x768等。
  - *VESA (Video Electronics Standards Association)*：一个制定视频标准的组织。它制定了VESA Local Bus (VLB) 总线标准，以及 *VESA BIOS Extensions (VBE)*，允许软件以标准方式访问SVGA显卡的高分辨率和多颜色模式。
  - *颜色深度 (Color Depth)*：指每个像素点能表示的颜色数量，通常用位数表示。16位颜色深度（High Color）可以表示 2^16 = 65536 种颜色。题目中的“16颜色深度”可能指16位颜色深度，而非仅16种颜色。VBE标准支持多种颜色深度，包括8位（256色）、15/16位（高彩）、24位（真彩）等。

8. 中断处理过程可以#underline(stroke: 1pt," 嵌套 ")进行。#underline(stroke: 1pt," 优先级高 ")的设备可以中断#underline(stroke: 1pt," 优先级低 ")的中断服务程序。

  解析：中断是计算机处理外部或内部紧急事件的一种机制。当中断发生时，CPU暂停当前任务，转去执行相应的中断服务程序 (ISR)。

  *中断嵌套 (Interrupt Nesting)*：指在一个中断服务程序执行期间，如果发生了一个优先级更高的中断请求，CPU会暂停当前正在执行的低优先级中断服务程序，转而去处理高优先级的中断。待高优先级中断处理完毕后，再返回继续执行被中断的低优先级中断服务程序。这需要CPU在进入中断服务程序时保存现场（寄存器状态等），并在中断返回时恢复现场。

  实现中断嵌套的关键在于中断优先级管理和现场保护机制。并非所有系统都允许或支持无限层嵌套。通常，在进入ISR时会暂时屏蔽同级或更低优先级的中断，只允许更高优先级的中断请求打断当前ISR的执行。


