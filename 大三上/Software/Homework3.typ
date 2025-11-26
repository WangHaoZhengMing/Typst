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
  #text(font: font-sans, size: 30pt, weight: "bold")[Homework-3] \
  #v(0.5em)
  #text(size: 15pt, fill: gray)[Number of questions: 18 | Total score: 100]
]
#pagebreak()
#section-header("一. Single Choice")

#question(
  number: 1,
  options_columns: 1,
  stem: [Which of the following traits need to exist among the members of an agile software team?],
  options: (
    [A. Competence],
    [B. Decision-making ability],
    [C. Mutual trust and respect],
    [D. All of the above]
  ),
  answer: "D",
  analysis: [
    Agile teams require a mix of competence, the ability to make local decisions (autonomy), and mutual trust to function as a self-organizing unit.
  ],
)

#question(
  number: 2,
  options_columns: 1,
  stem: [What are the four framework activities found in the Extreme Programming (XP) process model?],
  options: (
    [A. analysis, design, coding, testing],
    [B. planning, analysis, design, coding],
    [C. planning, analysis, coding, testing],
    [D. planning, design, coding, testing]
  ),
  answer: "D",
  analysis: [
    According to standard Software Engineering texts (e.g., Pressman), the four core XP framework activities are *Planning*, *Design*, *Coding*, and *Testing*. (Note: Student incorrectly selected C).
  ],
)

#question(
  number: 3,
  options_columns: 1,
  stem: [Which is not one of the key questions that is answered by each team member at each daily Scrum meeting?],
  options: (
    [A. What did you do since the last meeting?],
    [B. What obstacles are you encountering?],
    [C. What is the cause of the problems you are encountering?],
    [D. What do you plan to accomplish at the next team meeting?]
  ),
  answer: "C",
  analysis: [
    The three standard Daily Scrum questions are: 1. What did you do? 2. What will you do? 3. Any obstacles? *Root cause analysis* (Option C) is not part of the daily stand-up; it is typically addressed in retrospectives or separate meetings. (Note: Student incorrectly selected B, which IS a key question).
  ],
)

#question(
  number: 4,
  options_columns: 1,
  stem: [Agile Modeling (AM) provides guidance to practitioner during which of these software tasks?],
  options: (
    [A. Analysis and design],
    [B. Coding],
    [C. Testing],
    [D. All of the above]
  ),
  answer: "A",
  analysis: [
    Agile Modeling (AM) is a practice specifically focused on effective modeling and documentation, which primarily maps to the *Analysis and Design* tasks in software engineering. (Note: Student incorrectly selected D).
  ],
)

#question(
  number: 5,
  options_columns: 1,
  stem: [Which of the following is not necessary to apply agility to a software process?],
  options: (
    [A. Eliminate the use of project planning and testing],
    [B. Only essential work products are produced],
    [C. Process allows team to streamline tasks],
    [D. Uses incremental product delivery strategy]
  ),
  answer: "A",
  analysis: [
    Agile does *not* eliminate planning and testing; it adapts them (e.g., adaptive planning, continuous testing). Eliminating them completely is not necessary nor recommended.
  ],
)

#question(
  number: 6,
  options_columns: 1,
  stem: [How do you create agile processes to manage unpredictability?],
  options: (
    [A. Risk analysis must be conducted before planning takes place],
    [B. Software increments must be delivered in short time periods],
    [C. Software processes must adapt to changes incrementally],
    [D. both B and C]
  ),
  answer: "D",
  analysis: [
    Agility manages unpredictability through *both* rapid delivery of increments (B) to gain feedback and the process capability to adapt to change (C). (Note: Student selected C, which is incomplete).
  ],
)

#section-header("二. Short Answer")

#question(
  number: 7,
  stem: [Describe the 5 phases of the Unified Process model for software engineering?],
  analysis: [
    The five phases are:
    1.  *Inception* (起始)
    2.  *Elaboration* (细化)
    3.  *Construction* (构造)
    4.  *Transition* (移交)
    5.  *Production* (生产)
  ],
)

#question(
  number: 8,
  stem: [Describe the three key assumptions regarding software projects that every agile software process must address.],
  analysis: [
    According to Pressman/Standard SE texts, the three key assumptions are:
    1.  It is difficult to predict in advance which requirements will persist and which will change. (Requirements unpredictability)
    2.  For many types of software, design and construction are interleaved.
    3.  Analysis, design, construction, and testing are not as predictable as we might like.
  ],
)

#question(
  number: 9,
  stem: [Describe the role of customers and end-users on an agile process team?],
  analysis: [
    Customers and end-users are active members of the agile team (often "onsite"). Their role involves:
    -   Providing continuous feedback.
    -   Defining and prioritizing user stories/requirements.
    -   Participating in reviews to validate the software increment.
    -   Collaborating daily with developers to clarify needs.
  ],
)

#question(
  number: 10,
  stem: [List the key issues stressed by an agile philosophy of software engineering.],
  analysis: [
    Key issues include:
    1.  Importance of self-organizing teams.
    2.  Communication and collaboration between team members and customers.
    3.  Rapid delivery of working software.
    4.  Recognition that change represents opportunity.
    5.  Customer satisfaction as the highest priority.
  ],
)

#question(
  number: 11,
  stem: [What are the tradeoffs (values) proposed by the "Manifesto for Agile Software Development"?],
  analysis: [
    1.  *Individuals and interactions* over processes and tools.
    2.  *Working software* over comprehensive documentation.
    3.  *Customer collaboration* over contract negotiation.
    4.  *Responding to change* over following a plan.
  ],
)

#question(
  number: 12,
  stem: [Please explain what pair programming is and why it is used.],
  analysis: [
    *Definition*: Two developers work together at one workstation; one writes the code (driver) while the other reviews it in real-time (navigator/observer).
    *Purpose*: To perform continuous real-time code review, improve design quality, reduce defects, share knowledge (reduce "truck factor"), and improve team morale.
  ],
)

#question(
  number: 13,
  stem: [What are the traits of Successful Software Engineers?],
  analysis: [
    (Based on Pressman):
    1.  Sense of *individual responsibility*.
    2.  Acutely *aware of the needs* of team members and stakeholders.
    3.  *Brutally honest* about design flaws and offers constructive criticism.
    4.  *Resilient* under pressure.
    5.  Heightened sense of *fairness*.
    6.  Attention to *detail*.
    7.  *Pragmatic*.
  ],
)

#question(
  number: 14,
  stem: [What are the effective Software Team Attributes?],
  analysis: [
    (Based on Pressman):
    1.  Sense of *purpose*.
    2.  Sense of *involvement*.
    3.  Sense of *trust*.
    4.  Sense of *improvement*.
    5.  *Diversity* of team member skill sets.
  ],
)

#section-header("三. True or False")

#question(
  number: 15,
  options_columns: 4,
  stem: [All agile process models conform to a greater or lesser degree to the principles stated in the "Manifesto for Agile Software Development".],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    True. Compliance with the Manifesto is the defining characteristic of an "Agile" process.
  ],
)

#question(
  number: 16,
  options_columns: 4,
  stem: [It is not possible to build software that meets the customers's needs today and exhibits the quality characteristics that will enable it to be extended tomorrow.],
  options: ([A. True], [B. False]),
  answer: "B",
  analysis: [
    False. This is a core goal of software engineering (agile or otherwise)—to deliver value now while maintaining technical excellence for future extensibility.
  ],
)

#question(
  number: 17,
  options_columns: 4,
  stem: [In agile software processes the highest priority is to satisfy the customer through early and continuous delivery of valuable software.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    True. This is the first principle of the Agile Manifesto.
  ],
)

#question(
  number: 18,
  options_columns: 4,
  stem: [Agility is nothing more than the ability of a project team to respond rapidly to change.],
  options: ([A. True], [B. False]),
  answer: "B",
  analysis: [
    False. While responsiveness is key, agility also encompasses effective team structures, customer collaboration, delivery of value, and specific engineering practices. "Nothing more than" makes the statement incorrect.
  ],
)