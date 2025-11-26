#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
)
// Font Stack: San Francisco / Helvetica style for headers, Serif for body
#let font-sans = ("Helvetica", "Arial", "Microsoft YaHei")
#let font-serif = ("PingFang SC", "Microsoft YaHei", "Times New Roman", "Source Han Serif SC")

#set text(
  font: font-serif,
  size: 10.5pt,
  lang: "zh",
  fill: rgb("#333333"), // Soft black for better readability
)

#set par(
  justify: true,
  leading: 0.8em, // Airy line height
)


// Section Header
#let section-header(title) = {
  v(1.5em)
  text(font: font-sans, weight: "bold", size: 14pt, fill: black, title)
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + rgb("#DDDDDD")) // Thin separator
  v(1em)
}

// Question Block
#let question(
  number: 1,
  stem: [],
  options_columns: 1,
  options: none,
  answer: "",
  analysis: [],
) = {
  block(breakable: false, width: 100%, spacing: 2em)[
    // 1. Question Stem
    #grid(
      columns: (1.5em, 1fr),
      text(font: font-sans, weight: "bold", str(number) + "."),
      text(weight: "semibold")[#stem (#answer)],
    )

    // 2. Options (if applicable)
    #if options != none {
      if options_columns == 1 {
        // four line
        pad(left: 2em, bottom: 0.5em, grid(
          columns: options_columns,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
      if options_columns == 2 {
        // two line
        pad(left: 2em, bottom: 0.5em, grid(
          columns: options_columns,
          column-gutter: 1fr,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
      if options_columns == 4 {
        // a line
        pad(left: 2em, bottom: 0.5em, grid(
          columns: options_columns,
          column-gutter: 1fr,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
    }

    // 3. Answer & Analysis Section (Minimalist Sidebar Design)
    #pad(left: 2em)[
      #block(
        stroke: (left: 1pt + rgb("#406cfc")), // Subtle vertical line
        inset: (left: 0.5em),
        [
          #text(font: font-sans, size: 9pt, weight: "bold", fill: black)[ANALYSIS:]#text(
            fill: rgb("#444444"),
            size: 10pt,
            analysis,
          )
        ],
      )
    ]
  ]
}


#align(center)[
  #v(6cm)
  #text(font: font-sans, size: 30pt, weight: "bold")[Homework 2] \
  #v(0.5em)
  #text(size: 15pt, fill: gray)[Software Engineering Process Models]
]
#pagebreak()
#section-header("Single Choice")

#question(
  number: 1,
  options_columns: 4,
  stem: [Which of the items listed below is not one of the software engineering layers?],
  options: ("A. Process", "B. Manufacturing", "C. Methods", "D. Tools"),
  answer: "B",
  analysis: [
    软件工程的分层技术 (Layered Technology) 包含过程 (Process)、方法 (Methods) 和工具 (Tools)。*制造 (Manufacturing)* 是传统硬件工程的概念，软件开发是逻辑构建而非物理制造。
  ],
)

#question(
  number: 2,
  stem: [Which of these are the 5 generic software engineering framework activities?],
  options: (
    "A. communication, planning, modeling, construction, deployment",
    "B. communication, risk management, measurement, production, reviewing",
    "C. analysis, designing, programming, debugging, maintenance",
    "D. analysis, planning, designing, programming, testing",
  ),
  answer: "A",
  analysis: [
    通用过程框架 (Generic Process Framework) 的五个核心活动依次是：沟通 (Communication)、策划 (Planning)、建模 (Modeling)、构建 (Construction) 和部署 (Deployment)。
  ],
)

#question(
  number: 3,
  stem: [Process models are described as agile because they:],
  options: (
    "A. eliminate the need for cumbersome documentation",
    "B. emphasize maneuverability and adaptability",
    "C. do not waste development time on planning activities",
    "D. make extensive use of prototype creation",
  ),
  answer: "B",
  analysis: [
    敏捷 (Agile) 的核心在于应对变化。其之所以被称为"敏捷"，是因为它强调*机动性 (Maneuverability)* 和*适应性 (Adaptability)*，而非单纯地消除文档或不进行规划。
  ],
)

#question(
  number: 4,
  stem: [The waterfall model of software development is:],
  options: (
    "A. A reasonable approach when requirements are well defined.",
    "B. A good approach when a working program is required quickly.",
    "C. The best approach to use for projects with large development teams.",
    "D. An old fashioned model that is rarely used any more.",
  ),
  answer: "A",
  analysis: [
    瀑布模型 (Waterfall Model) 是线性的，一旦进入下一阶段很难返回。因此，它仅适用于*需求定义非常明确 (Requirements are well defined)* 且稳定的项目。
  ],
)

#question(
  number: 5,
  stem: [The incremental model of software development is:],
  options: (
    "A. A reasonable approach when requirements are well defined.",
    "B. A good approach when a working core product is required quickly.",
    "C. The best approach to use for projects with large development teams.",
    "D. A revolutionary model that is not used for commercial products.",
  ),
  answer: "B",
  analysis: [
    增量模型 (Incremental Model) 允许先交付一个*核心产品 (Core Product)*，随后在后续增量中逐步添加功能，非常适合需要快速抢占市场的场景。
  ],
)

#question(
  number: 6,
  stem: [Evolutionary software process models:],
  options: (
    "A. Are iterative in nature.",
    "B. Can easily accommodate product requirements changes.",
    "C. Do not generally produce throwaway systems.",
    "D. All of the above.",
  ),
  answer: "D",
  analysis: [
    演化模型 (Evolutionary Models) 如原型和螺旋模型，本质是*迭代的 (Iterative)*，设计初衷是为了适应*需求变更 (Requirements changes)*，且通常旨在开发逐步完善的系统而非抛弃型原型。
  ],
)

#question(
  number: 7,
  stem: [The prototyping model of software development is:],
  options: (
    "A. A reasonable approach when requirements are well defined.",
    "B. A useful approach when a customer cannot define requirements clearly.",
    "C. The best approach to use for projects with large development teams.",
    "D. A risky model that rarely produces a meaningful product.",
  ),
  answer: "B",
  analysis: [
    原型模型 (Prototyping) 最主要的应用场景是*客户无法清晰定义需求 (Customer cannot define requirements clearly)*，通过可视化的原型帮助客户明确需求。
  ],
)

#question(
  number: 8,
  stem: [The spiral model of software development:],
  options: (
    "A. Ends with the delivery of the software product.",
    "B. Is more chaotic than the incremental model.",
    "C. Includes project risks evaluation during each iteration.",
    "D. All of the above.",
  ),
  answer: "C",
  analysis: [
    螺旋模型 (Spiral Model) 的显著特征是在每次迭代中都明确包含*风险评估 (Risk Evaluation)*，通过风险驱动开发过程。
  ],
)

#question(
  number: 9,
  stem: [The concurrent development model is:],
  options: (
    "A. Another name for concurrent engineering.",
    "B. Defines events that trigger engineering activity state transitions.",
    "C. Only used for development of parallel or distributed systems.",
    "D. Used whenever a large number of change requests are anticipated.",
    "E. Both a and b",
  ),
  answer: "B",
  analysis: [
    并发开发模型 (Concurrent Development Model) 关注软件工程活动的状态。外部*事件 (Events)* 触发活动在不同状态（如"等待"、"开发中"、"完成"）之间进行转换 (Transitions)。
  ],
)

#question(
  number: 10,
  stem: [The component-based development model is:],
  options: (
    "A. Only appropriate for computer hardware design.",
    "B. Not able to support the development of reusable components.",
    "C. Dependent on object technologies for support.",
    "D. Not cost effective by known quantifiable software metrics.",
  ),
  answer: "C",
  analysis: [
    基于组件的开发 (Component-Based Development) 依赖于标准化的接口和*对象技术 (Object Technologies)* 来实现组件的复用和组装。
  ],
)

#question(
  number: 11,
  stem: [The formal methods model of software development makes use of mathematical methods to:],
  options: (
    "A. Define the specification for computer-based systems.",
    "B. Develop defect free computer-based systems.",
    "C. Verify the correctness of computer-based systems.",
    "D. All of the above.",
  ),
  answer: "D",
  analysis: [
    形式化方法 (Formal Methods) 利用严格的数学符号进行*规格说明 (Specification)* 和*验证 (Verification)*，旨在开发*无缺陷 (Defect-free)* 的系统，常用于安全关键领域。
  ],
)

#question(
  number: 12,
  options_columns: 4,
  stem: [Which of these is not one of the phase names defined by the Unified Process model for software development?],
  options: (
    "A. Inception phase",
    "B. Elaboration phase",
    "C. Construction phase",
    "D. Validation phase",
  ),
  answer: "D",
  analysis: [
    统一过程 (UP) 的四个阶段是：初始 (Inception)、细化 (Elaboration)、构建 (Construction) 和移交 (Transition)。*验证 (Validation)* 是活动而非阶段名称。
  ],
)

#question(
  number: 13,
  stem: [The linear sequential model of software development is:],
  options: (
    "A. A reasonable approach when requirements are well defined.",
    "B. A good approach when a working program is required quickly.",
    "C. The best approach to use for projects with large development teams.",
    "D. An old fashioned model that cannot be used in a modern context.",
  ),
  answer: "A",
  analysis: [
    线性顺序模型 (Linear Sequential Model) 即瀑布模型，适用于*需求定义明确 (Requirements well defined)* 的场景。
  ],
)

#section-header("True or False")

#question(
  number: 14,
  options_columns: 4,
  stem: [Software engineering umbrella activities are only applied during the initial phases of software development projects.],
  options: ("A. True", "B. False"),
  answer: "False",
  analysis: [
    *普适性活动 (Umbrella Activities)*（如项目管理、QA、配置管理）贯穿于软件开发的*整个生命周期*，而非仅在初始阶段。
  ],
)

#question(
  options_columns: 4,
  number: 15,
  stem: [Planning ahead for software reuse reduces the cost and increases the value of the systems into which they are incorporated.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    *软件复用 (Software Reuse)* 需要前期规划，虽然初期投入较高，但长期来看能显著降低开发成本并提升系统价值。
  ],
)

#question(
  options_columns: 4,
  number: 16,
  stem: [The essence of software engineering practice might be described as understand the problem, plan a solution, carry out the plan, and examine the result for accuracy.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    这句话准确概括了工程实践的本质步骤：理解问题、计划方案、执行计划、检查结果。
  ],
)

#question(
  number: 17,
  options_columns: 4,
  stem: [In agile process models the only deliverable work product is the working program.],
  options: ("A. True", "B. False"),
  answer: "False",
  analysis: [
    尽管敏捷强调可工作的软件，但它*不是唯一的*交付物。必要的文档、模型和用户故事也是交付的一部分，只是文档比传统方法更精简。
  ],
)

#question(
  number: 18,
  options_columns: 4,
  stem: [A most software development projects are initiated to try to meet some business need.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    软件项目的根本驱动力通常是*商业需求 (Business Need)*，如纠正缺陷、适应市场变化或提升业务能力。
  ],
)

#question(
  number: 19,
  options_columns: 4,
  stem: [In general software only succeeds if its behavior is consistent with the objectives of its designers.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    此题不仅要看设计者的目标，更关键的是*用户的需求*。软件成功的标准是满足用户需求 (User Requirements)，而非仅仅符合设计者的内部目标。若设计者误解了需求，软件依然是失败的。因此，#text(fill: red)[严格来说此陈述有误 (False)]。
  ],
)

#question(
  number: 20,
  options_columns: 4,
  stem: [The communication activity is best handled for small projects using six distinct actions (inception, elicitation, elaboration, negotiation, specification, validation).],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    这六个动作构成了*需求工程 (Requirements Engineering)* 的标准流程，即使在较小的项目中，这些沟通活动也是必要的。
  ],
)

#question(
  number: 21,
  options_columns: 4,
  stem: [A good software development team always uses the same task set for every project to insure high quality work products.],
  options: ("A. True", "B. False"),
  answer: "False",
  analysis: [
    没有一种过程适合所有项目。优秀的团队会根据项目的特征（规模、复杂度、紧迫性）调整*任务集 (Task Set)*，而非僵化地使用同一套流程。
  ],
)

#question(
  number: 22,
  options_columns: 4,
  stem: [Software processes can be constructed out of pre-existing software patterns to best meet the needs of a software project.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    利用*过程模式 (Process Patterns)* 可以灵活构建适合特定项目的软件过程，这符合现代软件工程的裁剪 (Tailoring) 思想。
  ],
)

#question(
  number: 23,
  options_columns: 4,
  stem: [Process technology tools allow software organizations to compress schedules by skipping unimportant activities.],
  options: ("A. True", "B. False"),
  answer: "False",
  analysis: [
    工具 (Tools) 的目的是提高效率和质量，而不是为了*跳过 (Skipping)* 必要的工程活动。盲目跳过活动会导致质量风险。
  ],
)

#question(
  number: 24,
  options_columns: 4,
  stem: [It is generally accepted that one cannot have weak software processes and create high quality end products.],
  options: ("A. True", "B. False"),
  answer: "True",
  analysis: [
    过程质量往往决定了产品质量。薄弱或混乱的过程 (Weak Process) 很难持续产出高质量的软件。
  ],
)

#section-header("Short Answer")

#question(
  number: 25,
  stem: [Why are incremental process models considered by many to be the best approach to software development in a modern context?],
  answer: "Incremental process models are considered best because they: 1. Allow Early Delivery... 2. Adapt to Changes... 3. Reduce Risk... 4. Enable Continuous Improvement...",
  analysis: [
    现代软件开发具有快节奏和需求多变的特点。增量模型的优势在于：
    1. *快速上市 (Time-to-market)*: 早期发布核心功能。
    2. *风险控制 (Risk Management)*: 逐步集成，将大风险分散。
    3. *反馈循环 (Feedback Loop)*: 每个增量都能获取用户反馈，从而适应现代不确定的市场需求。
  ],
)

#question(
  number: 26,
  stem: [Describe the phases of the prototyping model for software development?],
  answer: "1. Requirements Gathering... 2. Quick Design... 3. Prototype Development... 4. User Evaluation... 5. Refinement...",
  analysis: [
    原型模型的核心流程包括：
    1. *沟通 (Communication)*: 确定初始目标。
    2. *快速计划与建模 (Quick Plan & Modeling)*: 聚焦于可见部分（UI/输出）。
    3. *构建原型 (Construction of Prototype)*.
    4. *部署与反馈 (Deployment & Feedback)*: 用户评估并提出修改意见，进而驱动下一轮迭代。
  ],
)

#question(
  number: 27,
  stem: [Describe the role of risk analysis in evolutionary process models like the spiral model.],
  answer: "Risk analysis plays a central role... 1. Identifying Risks... 2. Assessing Risks... 3. Mitigating Risks... 4. Guiding Iteration Planning...",
  analysis: [
    在螺旋模型中，*风险分析 (Risk Analysis)* 是决定项目走向的关键。在每次螺旋迭代开始前，必须评估技术或管理风险。如果风险过大，项目可能被终止（No-Go）；如果风险可控，则制定缓解措施并进入下一阶段。这是它是区别于其他模型的主要特征。
  ],
)

#question(
  number: 28,
  stem: [Please describe the advantages and disadvantages of waterfall model, incremental model, and evolutionary model respectively, as well as their applicable scenarios.],
  answer: "Waterfall: Clear structure but inflexible. Incremental: Early delivery but higher management cost. Evolutionary: Highly adaptive but resource intensive...",
  analysis: [
    - *瀑布模型*: 优点是严谨、易管理；缺点是拒绝变更；适用于需求极度稳定的项目。
    - *增量模型*: 优点是早期交付价值；缺点是系统架构设计要求高；适用于需要快速抢占市场的项目。
    - *演化/螺旋模型*: 优点是风险驱动、适应性强；缺点是成本高、周期长；适用于高风险、大规模、需求模糊的复杂系统。
  ],
)
