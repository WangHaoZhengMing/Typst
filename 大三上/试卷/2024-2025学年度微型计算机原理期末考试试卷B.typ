#set document(title: "2024-2025 年《微机原理及接口技术》期末复习试题")
#set text(font: "PingFang SC")

//这个是选择题要用的横线
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
#align(center, text(15pt)[#text(font: "simsun")[$2024-2025$ 年《微机原理及接口技术》期末复习试题]])
#align(center)[#text(size: 1.8em, font: "Heiti SC")[微机原理及接口技术]]
#text(font: "Heiti SC")[注意事项]：
#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答上所粘贴的条形码上的姓名、准考证号与您本人是否相符。



== 选择题
#set enum(numbering: "1.")
+ CPU 与外设间数据传送的控制方式有#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 中断方式], [B. 程序控制方式], [C. DMA 方式], [D. 以上三种都是],
  )

+ 在异步串行通信的数据格式是: 1位起始位, 7位数据位, 1位校验位, 1位停止位, 若传输率为 2400 位/秒, 则每秒传输的最大字符个数为#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 10 个], [B. 110 个], [C. 120 个], [D. 240 个],
  )

+ CPU 与 I/O 设备间传送的信号有#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 控制信息], [B. 状态信息], [C. 数据信息], [D. 以上三种都有],
  )

+ 8255 中即可作数据输入、输出端口，又可提供控制信息、状态信息的端口是#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. B 口], [B. A 口], [C. C 口], [D. 以上三个端口均可以],
  )

+ 8253 有#uline() 个定时通道。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 1], [B. 2], [C. 2], [D. 3],
  )

+ 8086 最多可以直接寻址#uline() 个 8 位 I/O 端口。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 65536], [B. 65535], [C. 256], [D. 255],
  )

+ 8086 中一个存储段最大为#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 32KB], [B. 64KB], [C. 1MB], [D. 1MKB],
  )

+ 指令 `OUT DX, AL` 中间 `DX` 代表的含义是#uline()
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 中断类型], [B. 端口地址], [C. 待遇操作数], [D. A 或 B],
  )

+ RS-232C 是一种#uline() 通信标准。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 并行], [B. 串行], [C. 半并行], [D. 不是通信标准],
  )

+ 8086 的中断响应周期占用#uline() 个总线周期。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. 1], [B. 2], [C. 3], [D. 4],
  )

== 填空
#set enum(numbering: "1.")

+ 8253 有#uline() 种工作方式, 若输入时钟 $"CLK1" = 1"MHz"$, 计数初值为 500, BCD 码计数方式, $"OUT1"$ 输出为方波, 则初始化时该通道的控制字应为#uline()。

+ 8259A 有#uline() 个初始化命令字, 其中#uline() 是必须设置的。

+ 中断类型码为 8 的中断向量一定存放在从地址#uline() 开始的 4 个连续单元中, 若其中断服务程序的入口地址为 $3040:2010$, 则这四个单元中的具体内容依次为#uline()。

+ 一片 8259A 可以管理#uline() 级中断。

+ 下面是响应 $"IRQ9"$ 中断的中断服务子程序, 其功能是响应中断后, 从地址 $219H$ 的数据口读取数据 (假设该数据是某一字符的 ASCII 码) 并送屏幕显示, 请完成该子程序的设计。
  #coder(
    ```assembly
    SERVICE PROC
      ...... ; 保留现场(略)
      MOV DX, (1)__________
      IN AL, DX
      (2)__________
      (3)__________ ; 送屏幕显示
      INT 21H
      (4)__________
      (5)__________
      (6)__________ ; 结束中断
      ...... ; 恢复现场(略)
      (7)__________ ; 中断返回
    SERVICE ENDP
    ```,
  )




+ 设 PC 系统机外扩了一片 8254 实验电路, 仔细分析下图实验电路和下面程序 (行号已经标注), 并回答问题。

  [图示为一个 8254 芯片的连接电路。8254 的数据线 $D_0-D_7$ 与 CPU 的 $D_0-D_7$ 相连。地址线 $A_0, A_1$ 连接到 8254 的 $A_0, A_1$。译码器输出 $C S$ 连接到 8254 的片选 $C S$。$I O R$ 和 $I O W$ 分别连接到 8254 的 $R D$ 和 $W R$。8254 的 $G A T E_0$ 接 +5V。$C L K_0$ 输入一个 2KHz 的时钟信号。$O U T_0$ 连接到一个 LED，然后接地。]

  #coder(
    ```assembly
    (1) MOV DX, 203H
    (2) MOV AL, 36H
    (3) OUT DX, AL
    (4) MOV AX, 2000
    (5) MOV DX, 200H
    (6) OUT DX, AL
    (7) MOV AL, AH
    (8) OUT DX, AL
    ```,
  )

问题:
// #set enum(numbering: "(1)")
+ 由已知条件可知 8254 的控制口地址为#uline()。
+ 由已知条件可知在该实验中 8254 的#uline() 定时/计数器被使用到 (填: 0 号, 1 号或 2 号), 并且工作在#uline() 工作方式。
+ 程序运行后, LED 将#uline() (填: 闪烁, 一直点亮或一直熄灭)。
+ 如果程序不变, 从 $C L K 0$ 端输入的信号变为 1KHz, 则 LED 将#uline() (填: 闪烁, 闪烁但频率减慢, 闪烁但频率加快, 一直点亮或一直熄灭)。
+ 如果从 $C L K 0$ 端输入的信号保持 2KHz 不变, 而将程序中第(4)行指令的源操作数改为 1000, 则 LED 将#uline() (填: 闪烁但频率减慢, 闪烁但频率加快, 一直点亮或一直熄灭)。
== 问答题
+ 在一个 8086CPU 和单片 8259A 组成的系统中, 试说明:
  + 8086CPU 响应可屏蔽中断的条件是什么？
  + 8086CPU 在响应中断过程中, 连续执行两个 $I N T A$ 周期, 其作用是？
  + 假如 8259A 已被编程, $"ICW2"=0A H$, 若连接在 8259A 的 $I R 3$ 端的外设提出中断申请, 它的中断向量的存放地址是什么？

+ 说明 ADC0809 模/数转换器的引脚 $A L E$、$"START"$、$E O C$ 和 $O E$ 的作用。

+ 简述 RS232C 标准和帧格式。

+ 什么是 8086CPU 的总线周期, 它至少需要由几个 T 状态 (时钟周期) 组成？在什么情况下需要在总线周期中插入等待周期 $T w$, $T w$ 应插入在哪里？

== 设计题


+ 如图所示, 用 8 个逻辑电平开关通过 8255 并行接口芯片控制 8 个发光二极管的亮与灭。

  [图示为一个 8255A 芯片的连接电路。CPU 的数据线 $D_7-D_0$ 和控制线 $R D, W R, A_0, A_1$ 连接到 8255A 对应引脚。地址线 $A_7-A_2$ 经过译码器连接到 8255A 的 $C S$。8255A 的 $P A$ 口 ($P A_0-P A_7$) 连接到 VCC 和一组开关 $K_0-K_7$。$P C$ 口 ($P C_0-P C_7$) 连接到一组发光二极管。]

  已知: 8255 的端口地址为 $288H text~28B H$。

  要求:
  #set enum(numbering: "(1)")
  + 写出 A 口, C 口和控制口的端口地址。
  + 写出程序段, 使开关闭合时相应的发光二极管不亮, 闭合时对应的发光二极管亮。

+ ADC0809 通过 8255 同 PC 总线的接口如图所示, 采用中断方式依次从 $"IN0" \~ "IN7"$ 转换 8 个模拟量, 把转换后的数据依次存入内存 BUFFER 的变量区中, 给出满足上述要求的控制程序, 请在空缺处填写正确内容。
[图示为 ADC0809 和 8255A 连接的电路图。8255A 的 $P A$ 口 ($P A_0 - P A_7$) 连接到 ADC0809 的数据输出 $D_0 - D_7$。8255A 的 $P B$ 口 ($P B_0, P B_1, P B_2, P B_3$) 分别连接到 ADC0809 的 $A L E, S T A R T, A D D A, A D D B$。8255A 的 $P C$ 口 ($P C_0$) 连接到 ADC0809 的 $E O C$。ADC0809 的 $O E$ 连接到地。ADC0809 的模拟输入为 $I N 0 text{\~} I N 7$。]

  #grid(
    columns: 2,
    gutter: 1em,
    [
      *主程序*
      #coder(
        ```assembly
        ·······
        IN AL, ①__________
        MOV AL, ②__________
        OUT ③__________, AL
        MOV SI, __________
        MOV CX, 8
        MOV BL, 00H ; 通道0开始转换
        MOV AL, BL
        OUT ④__________, AL
        ADD AL, 80H
        OUT 81H, AL
        SUB AL, 80H
        OUT 81H, AL
        STI
        .
        .
        .
        ```,
      )
    ],
    [
      *中断服务程序*
      #coder(
        ```assembly
          IN AL, ⑤__________
          MOV [SI], AL
          INC ⑥__________
          INC BL
          CMP BL, ⑦__________
          ⑧__________ EXIT
          MOV AL, BL ; 转换下一路
          OUT ⑨__________, AL
          ADD AL, 80H
          OUT 81H, AL
          SUB AL, 80H
          OUT 81H, AL
        EXIT: ⑩__________
        ```,
      )
    ],
  )

  答:
  #grid(
    columns: 5,
    gutter: 1em,
    [① #uline()], [② #uline()], [③ #uline()], [④ #uline()], [⑤ #uline()],
    [⑥ #uline()], [⑦ #uline()], [⑧ #uline()], [⑨ #uline()], [⑩ #uline()],
  )


#pagebreak()
#align(center)[= 附录]

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  align: center,
  table.header(
    [*标志*], [*D7*], [*D6*], [*D5*], [*D4*], [*D3*], [*D2*], [*D1*],
    [*D0*],
  ),
  [1], table.cell(colspan: 2)[A组方式选择], [端口A], [端口C(高4位)], [B组方式], [端口B], [端口C(低4位)],
  [], [00-方式0], [01-方式1], [1-输入], [1-输入], [0-方式0], [1-输入], [1-输入],
  [], [01-方式1], [1x-方式2], [0-输出], [0-输出], [1-方式1], [0-输出], [0-输出],
)
#align(center)[8255A 的方式选择控制字]

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: 0.5pt,
  align: center,
  table.header(
    [*标志*], [*D7*], [*D6*], [*D5*], [*D4*], [*D3*], [*D2*], [*D1*],
    [*D0*],
  ),
  [0], table.cell(colspan: 3)[无关], table.cell(colspan: 3)[位选择], [1-置1, 0-置0],
  [], [], [], [], [D2], [D1], [D0], [000-位0],
  [], [], [], [], [001-位1], [010-位2], [011-位3],
  [], [], [], [], [100-位4], [101-位5], [110-位6],
  [], [], [], [], [111-位7], [], [],
)
#align(center)[8255 端口 C 按位置 0/置 1 控制字]

#table(
  columns: 8,
  stroke: 0.5pt,
  align: center,
  table.header([*SC1*], [*SC0*], [*RL1*], [*RL0*], [*M2*], [*M1*], [*M0*], [*BCD*]),
  table.cell(colspan: 2)[计数器选择],
  table.cell(colspan: 2)[读写方式选择],
  table.cell(colspan: 3)[工作方式选择],
  [计数方式选择],
  [00 计数器0], [], table.cell(colspan: 2)[00 锁存], table.cell(colspan: 3)[000 方式0], [0 二进制],
  [01 计数器1], [], table.cell(colspan: 2)[01 只读/写低位字节], table.cell(colspan: 3)[001 方式1], [1 BCD码],
  [10 计数器2], [], table.cell(colspan: 2)[10 只读/写高位字节], table.cell(colspan: 3)[010 方式2], [],
  [], [], table.cell(colspan: 2)[11 先读/写低位字节再读/写高位字节], table.cell(colspan: 3)[011 方式3], [],
  [], [], [], [], table.cell(colspan: 3)[100 方式4], [],
  [], [], [], [], table.cell(colspan: 3)[101 方式5], [],
)
#align(center)[8253 的方式选择控制字]
