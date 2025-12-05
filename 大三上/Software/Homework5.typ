#import "@preview/cetz:0.4.2": canvas, draw, vector

// --- 全局样式设置 ---
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  numbering: "1",
)

#let font-sans = ( "Microsoft YaHei", "Heiti SC")
#let font-serif = ("Microsoft YaHei", "Source Han Serif SC", "SimSun", "PingFang SC")

#set text(font: font-serif, size: 10.5pt, lang: "zh")
#set par(justify: true, leading: 0.8em)

// --- 辅助函数 ---
#let section-header(title) = {
  v(1.5em)
  text(font: font-sans, weight: "bold", size: 14pt, fill: black, title)
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + rgb("#DDDDDD"))
  v(1em)
}

#let question(number: 1, stem: [], options: none, answer: "", analysis: none) = {
  block(breakable: true, width: 100%, spacing: 1.5em)[
    #grid(
      columns: (2em, 1fr),
      gutter: 0.5em,
      text(font: font-sans, weight: "bold", str(number) + "."), text(weight: "semibold", stem),
    )
    #if options != none {
      pad(left: 2.5em, top: 0.5em, grid(
        columns: 1, row-gutter: 0.6em,
        ..options.map(opt => text(fill: rgb("#555555"), opt))
      ))
    }
    #pad(left: 2.5em, top: 0.8em)[
      #block(fill: rgb("#f0f8ff"), inset: 8pt, radius: 4pt, width: 100%)[
        *My Answer:* #text(fill: rgb("#0000AA"), weight: "bold", answer)
        #if analysis != none {
          text(size: 9pt, fill: gray)[Analysis: #analysis]
        }
      ]
    ]
  ]
}

// --- CeTZ UML 绘图辅助函数 ---
#let uml-actor(pos, name, scale: 1.0) = {
  draw.group(
    {
      draw.circle((0, 0.5), radius: 0.25) // Head
      draw.line((0, 0.25), (0, -0.4)) // Body
      draw.line((-0.3, 0), (0.3, 0)) // Arms
      draw.line((0, -0.4), (-0.3, -0.8)) // Left Leg
      draw.line((0, -0.4), (0.3, -0.8)) // Right Leg
      draw.content((0, -1.2), text(size: 8pt, name))
    },
    name: name,
  )
  draw.move-to(pos) // Position the group
}

#let uml-usecase(pos, label, name: none) = {
  let n = if name == none { label } else { name }
  draw.content(
    pos,
    box(inset: 5pt, radius: 50%, stroke: 1pt, fill: white)[#text(size: 8pt, label)],
    name: n,
    anchor: "center",
  )
}

#let uml-class(pos, name, attrs: [], ops: []) = {
  draw.content(
    pos,
    box(stroke: 1pt, width: 3.5cm, fill: white)[
      #set align(left)
      #box(width: 100%, inset: 5pt, fill: rgb("#eeeeee"), stroke: (bottom: 0.5pt))[#align(center)[*#name*]]
      #box(width: 100%, inset: 5pt, stroke: (bottom: 0.5pt))[#text(size: 8pt, attrs)]
      #box(width: 100%, inset: 5pt)[#text(size: 8pt, ops)]
    ],
    name: name,
    anchor: "north",
  )
}

// --- 文档开始 ---

#align(center)[
  #v(2cm)
  #text(font: font-sans, size: 24pt, weight: "bold")[Homework-5] \
  #v(1em)
  #text(size: 12pt)[Total Score: 180 | Questions: 26]
]

#pagebreak()

#section-header("一. Single Choice (8 questions, 16 points)")

#question(
  number: 1,
  stem: [Which of these is not an element of a requirements model?],
  options: ([A. Behavioral elements], [B. Class-based elements], [C. Data elements], [D. Scenario-based elements]),
  answer: "C",
  analysis: "需求建模（Requirements modeling）通常包括场景（Scenario）、类（Class）、行为（Behavioral）和流（Flow）元素。'数据元素'（Data elements）通常是类/流模型的一部分，在此上下文中不是顶层类别。",
)

#question(
  number: 2,
  stem: [Which of the following is not an objective for building a requirements model?],
  options: (
    [A. define set of software requirements that can be validated],
    [B. describe customer requirements],
    [C. develop an abbreviated solution for the problem],
    [D. establish basis for software design],
  ),
  answer: "C",
  analysis: "构建需求模型的目标是理解问题，而不是设计一个'快速'或简略的解决方案（abbreviated solution）。",
)

#question(
  number: 3,
  stem: [UML activity diagrams are useful in representing which analysis model elements?],
  options: (
    [A. Behavioral elements],
    [B. Class-based elements],
    [C. Flow-based elements],
    [D. Scenario-based elements],
  ),
  answer: "D",
  analysis: "活动图（Activity diagrams）通过展示交互流程来补充用例（use cases/scenarios）。",
)

#question(
  number: 4,
  stem: [Which of the following should be considered as candidate objects in a problem space?],
  options: ([A. events], [B. people], [C. structures], [D. all of the above]),
  answer: "D",
  analysis: "对象（Objects）可以是物理实体（人、结构）或概念性事件（events）。",
)

#question(
  number: 5,
  stem: [Which of the following items does not appear on a CRC card?],
  options: ([A. class collaborators], [B. class name], [C. class reliability], [D. class responsibilities]),
  answer: "C",
  analysis: "CRC 代表类（Class）、职责（Responsibility）、协作（Collaboration）。可靠性（Reliability）是一个质量属性。",
)

#question(
  number: 6,
  stem: [Class responsibilities are defined by],
  options: (
    [A. its attributes only],
    [B. its collaborators],
    [C. its operations only],
    [D. both its attributes and operations],
  ),
  answer: "D",
  analysis: "职责（Responsibilities）包含类知道什么（属性 attributes）和做什么（操作 operations）。",
)

#question(
  number: 7,
  stem: [The state diagram],
  options: (
    [A. depicts relationships between data objects],
    [B. depicts functions that transform the data flow],
    [C. indicates how data are transformed by the system],
    [D. indicates system reactions to external events],
  ),
  answer: "D",
  analysis: "状态图（State diagrams）对系统响应外部事件（external events）的动态行为进行建模。",
)

#question(
  number: 8,
  stem: [For purposes of behavior modeling a state is any],
  options: (
    [A. consumer or producer of data.],
    [B. data object hierarchy.],
    [C. observable mode of behavior.],
    [D. well defined process.],
  ),
  answer: "C",
  analysis: "状态（State）表示对象生命周期中的某种条件（condition）或情况（situation）。",
)

#section-header("二. True or False (10 questions, 20 points)")

#question(
  number: 9,
  stem: [In structured analysis models focus on the structure of the classes defined for a system along with their interactions.],
  options: ([A. True], [B. False]),
  answer: "B (False)",
)
#question(
  number: 10,
  stem: [Creation and refinement of use cases is an important part of scenario-based modeling.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 11,
  stem: [It is important to consider alternative actor interactions when creating a preliminary use case.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 12,
  stem: [Brainstorming is one technique that may be used to derive a complete set of use case exceptions.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 13,
  stem: [UML swimlane diagrams allow you to represent the flow of activities by showing the actors having responsibility for creating each data element.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 14,
  stem: [In the grammatical parse of a processing narrative the nouns become object candidates in the analysis model.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 15,
  stem: [Collaborators in CRC modeling are those classes needed to fulfill a responsibility on another card.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 16,
  stem: [An analysis package involves the categorization of analysis model elements into useful groupings.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)
#question(
  number: 17,
  stem: [Attributes cannot be defined for a class until design has been completed.],
  options: ([A. True], [B. False]),
  answer: "B (False)",
)
#question(
  number: 18,
  stem: [In many cases there is no need to create a graphical representation of a usage scenario.],
  options: ([A. True], [B. False]),
  answer: "A (True)",
)

#section-header("三. Short Answer & Design (8 questions, 144 points)")

#question(
  number: 19,
  stem: [What are the steps needed to build an object-behavior model?],
  answer: "1. 评估用例（use cases）以理解交互序列。 2. 识别驱动序列的事件（events）。 3. 为每个用例创建序列。 4. 构建状态图（state diagram）。 5. 审查一致性。",
)

// --- Q23: SafeHome Security ---
#question(
  number: 23,
  stem: [SafeHome Security Function Design],
  answer: [
    *(a) 用例图 (Use Case Diagram):*
    参与者 (Actors): 传感器 (Sensors), 监控中心 (MonitoringAgency). 用例 (Cases): 检测情况 (Detect Situation), 自动拨号 (Auto-Dial).
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Sensor")
      uml-actor((6, 0), "MonitoringAgency")

      uml-usecase((3, 0), "Detect Situation", name: "UC_Det")
      uml-usecase((3, -1.5), "Auto-Dial", name: "UC_Dial")

      draw.line("Sensor", "UC_Det")
      draw.line("UC_Det", "UC_Dial", mark: (end: ">"), name: "include")
      draw.content("include", text(size: 8pt, "<<include>>"))
      draw.line("UC_Dial", "MonitoringAgency")
    })

    *(b) 类图 (Class Diagram):*
    类 (Classes): 传感器 (Sensor), 报警系统 (AlarmSystem), 情况 (Situation).
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Sensor", attrs: [- type \ - status \ - location], ops: [+ detect() \ + signal()])
      uml-class((5, 0), "AlarmSystem", attrs: [- state \ - phoneNum], ops: [+ dial() \ + soundAlarm()])
      uml-class((2.5, -3), "Situation", attrs: [- type \ - severity], ops: [+ log()])

      draw.line("Sensor", "AlarmSystem")
    })
  ],
)

// --- Q26: Bank of China ATM ---
#question(
  number: 26,
  stem: [BOC ATM System Design],
  answer: [
    *(a) 用例图 (Use Case Diagram):*
    参与者 (Actor): 存款人 (Depositor), 柜员 (Teller), ATM. 用例 (Cases): 取款 (Withdraw), 存款 (Deposit), 转账 (Transfer).
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Depositor")
      uml-actor((6, 0), "Teller")

      uml-usecase((3, 2), "Withdraw Cash", name: "UC_With")
      uml-usecase((3, 0.5), "Deposit", name: "UC_Dep")
      uml-usecase((3, -1), "Transfer", name: "UC_Trans")

      draw.line("Depositor", "UC_With")
      draw.line("Depositor", "UC_Dep")
      draw.line("Teller", "UC_Dep") // Teller processes deposit
    })

    *(b) 类图 (Class Diagram):*
    类 (Classes): 账户 (Account), 卡 (Card), ATM.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Account", attrs: [- accountNo \ - balance \ - owner], ops: [+ credit() \ + debit()])
      uml-class((5, 0), "Card", attrs: [- cardNo \ - pin], ops: [+ validate() \ + insert()])
      uml-class((2.5, -3), "ATM", attrs: [- location \ - cashStock], ops: [+ dispense() \ + printBill()])

      draw.line("Card", "Account", mark: (end: ">"))
      draw.line("ATM", "Card", name: "rel")
      draw.content("rel", text(size: 8pt, "reads"))
    })
  ],
)
