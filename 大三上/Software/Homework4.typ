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
      columns: (2em, 1fr),
      gutter: 0.5em,
      text(font: font-sans, weight: "bold", str(number) + "."), text(weight: "semibold")[#stem (#answer)],
    )

    // 2. Options (if applicable)
    #if options != none {
      if options_columns == 1 {
        // four line
        pad(left: 2.5em, bottom: 0.5em, grid(
          columns: options_columns,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
      if options_columns == 2 {
        // two line
        pad(left: 2.5em, bottom: 0.5em, grid(
          columns: options_columns,
          column-gutter: 1fr,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
      if options_columns == 4 {
        // a line
        pad(left: 2.5em, bottom: 0.5em, grid(
          columns: options_columns,
          column-gutter: 1fr,
          row-gutter: 0.6em,
          ..options.map(opt => text(fill: rgb("#555555"), opt))
        ))
      }
    }

    // 3. Answer & Analysis Section (Minimalist Sidebar Design)
    #pad(left: 2.5em)[
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
  #text(font: font-sans, size: 30pt, weight: "bold")[Homework-4] \
  #v(0.5em)
  #text(size: 15pt, fill: gray)[Number of questions: 30 | Total score: 100]
]
#pagebreak()
#section-header("一. Single Choice")

#question(
  number: 1,
  options_columns: 1,
  stem: [Which of the following is not one of the principles of good coding?],
  options: (
    [A. Create unit tests before you begin coding],
    [B. Create a visual layout that aids understanding],
    [C. Keep variable names short so that code is compact],
    [D. Write self-documenting code, not program documentation]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    Modern software engineering emphasizes readability over compactness. Variable names should be descriptive (meaningful), not artificially short. Option A refers to TDD, which is a valid practice. B and D are standard clean code principles.
  ],
)

#question(
  number: 2,
  options_columns: 1,
  stem: [Which of the following are valid reasons for collecting customer feedback concerning delivered software?],
  options: (
    [A. Allows developers to make changes to the delivered increment],
    [B. Delivery schedule can be revised to reflect changes],
    [C. Developers can identify changes to incorporate into next increment],
    [D. All of the above]
  ),
  answer: "D",
  analysis: [
    *Correct Answer: D* \
    Customer feedback in iterative development is used to fix current issues (A), adjust planning/scheduling (B), and prioritize the backlog for the next increment (C).
  ],
)

#question(
  number: 3,
  options_columns: 1,
  stem: [Which of the following is not one of Hooker's core principles of software engineering practice?],
  options: (
    [A. All design should be as simple as possible, but no simpler],
    [B. A software system exists only to provide value to its users],
    [C. Pareto principle (20% of any product requires 80% of the effort)],
    [D. Remember that you produce others will consume]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    Hooker's 7 Principles are: 1. The Reason It All Exists (Value), 2. KISS (Simple), 3. Maintain the Vision, 4. What You Produce, Others Will Consume, 5. Be Open to the Future, 6. Plan Ahead for Reuse, 7. Think! \
    The Pareto Principle (80/20 rule) is a general economic concept, not one of Hooker's specific SE principles.
  ],
)

#question(
  number: 4,
  options_columns: 1,
  stem: [During project inception the intent of the of the tasks are to determine],
  options: (
    [A. basic problem understanding],
    [B. nature of the solution needed],
    [C. people who want a solution],
    [D. a, b, c]
  ),
  answer: "D",
  analysis: [
    *Correct Answer: D* \
    Inception is the first phase of requirements engineering. Its goals are to establish a basic understanding of the problem (A), the people who want a solution (stakeholders) (C), and the nature of the solution (B), alongside establishing communication.
  ],
)

#question(
  number: 5,
  options_columns: 1,
  stem: [Which is not the problem that makes requirements elicitation difficult?],
  options: (
    [A. budgeting],
    [B. scope],
    [C. understanding],
    [D. volatility]
  ),
  answer: "A",
  analysis: [
    *Correct Answer: A* \
    Christel and Kang identified three specific categories of problems for requirements elicitation: *Scope* (boundary definition), *Understanding* (users don't know what they want), and *Volatility* (requirements change). Budgeting is a project management constraint, not an inherent elicitation difficulty.
  ],
)

#question(
  number: 6,
  options_columns: 1,
  stem: [Which of the following is not one of the context-free questions that would be used during project inception?],
  options: (
    [A. What will be the economic benefit from a good solution?],
    [B. Who is behind the request for work?],
    [C. Who will pay for the work?],
    [D. Who will use the solution?]
  ),
  answer: "A",
  analysis: [
    *Correct Answer: C (Likely intended answer in this specific test bank context)* \
    According to Pressman, the first set of context-free questions are: "Who is behind the request?", "Who will use the solution?", and "What will be the economic benefit?". While "Who will pay" is valid, it is often considered the "odd one out" in exams checking for verbatim textbook lists. *Note: Student selected A, which is definitely a standard question.*
  ],
)

#question(
  number: 7,
  options_columns: 1,
  stem: [In collaborative requirements gathering the facilitator],
  options: (
    [A. arranges the meeting place],
    [B. can not be a customer],
    [C. controls the meeting],
    [D. must be an outsider]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    The facilitator's primary role is to control the meeting flow, mediate disputes, and keep the team focused. They can be a customer, developer, or outsider (not exclusively D or B), and "arranging the place" is administrative.
  ],
)

#question(
  number: 8,
  options_columns: 1,
  stem: [Which of the following is not one of the requirement classifications used in Quality Function Deployment (QFD)?],
  options: (
    [A. exciting],
    [B. expected],
    [C. mandatory],
    [D. normal]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    QFD classifies requirements into three types: *Normal* (stated), *Expected* (implicit), and *Exciting* (delighters). "Mandatory" is not a standard QFD category name (it usually falls under Expected/Normal).
  ],
)

#question(
  number: 9,
  options_columns: 1,
  stem: [The work products produced during requirement elicitation will vary depending on the],
  options: (
    [A. size of the budget.],
    [B. size of the product being built.],
    [C. software process being used.],
    [D. both a and b]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    The formality and type of work products (documents vs. user stories) are primarily dictated by the *software process* (e.g., Waterfall requires heavy docs, Agile requires light cards). While product size matters, the process model is the governing factor for the *type* of artifact.
  ],
)

#question(
  number: 10,
  options_columns: 1,
  stem: [The result of the requirements engineering task is an analysis model that defines which of the following problem domain(s)?],
  options: (
    [A. information],
    [B. functional],
    [C. behavioral],
    [D. all of the above]
  ),
  answer: "D",
  analysis: [
    *Correct Answer: D* \
    The analysis model provides a description of the required *information* (data), *function* (what the system does), and *behavior* (how it reacts to events).
  ],
)

#question(
  number: 11,
  options_columns: 1,
  stem: [The system specification describes the],
  options: (
    [A. Function, performance and constraints of a computer-based system],
    [B. implementation of each allocated system],
    [C. element software architecture],
    [D. time required for system simulation]
  ),
  answer: "A",
  analysis: [
    *Correct Answer: A* \
    The System Specification (SS) is a top-level document that describes the function, performance, and constraints of the entire computer-based system (hardware, software, people) before software-specific allocation occurs.
  ],
)

#question(
  number: 12,
  options_columns: 1,
  stem: [Which of the following is not one of the context-free questions that would be used during project inception?],
  options: (
    [A. What will be the economic benefit from a good solution?],
    [B. Who is against this project?],
    [C. Who will pay for the work?],
    [D. Who will use the solution?]
  ),
  answer: "B",
  analysis: [
    *Correct Answer: B* \
    Inception questions aim to identify stakeholders and goals neutrally ("Context-free"). Asking "Who is against this project?" is a loaded, political question, not a standard context-free opening question.
  ],
)

#question(
  number: 13,
  options_columns: 1,
  stem: [Which of following is not a UML diagram used creating a system analysis model?],
  options: (
    [A. activity diagram],
    [B. class diagram],
    [C. dataflow diagram],
    [D. state diagram]
  ),
  answer: "C",
  analysis: [
    *Correct Answer: C* \
    Dataflow Diagrams (DFD) belong to *Structured Analysis* methods. While useful, they are *not* part of the UML standard (Unified Modeling Language). UML uses Activity Diagrams for similar flow purposes.
  ],
)

#question(
  number: 14,
  options_columns: 1,
  stem: [The best way to conduct a requirements validation review is to],
  options: (
    [A. examine the system model for errors],
    [B. have the customer look over the requirements],
    [C. send them to the design team and see if they have any concerns],
    [D. use a checklist of questions to examine each requirement]
  ),
  answer: "D",
  analysis: [
    *Correct Answer: D* \
    Validation reviews are most effective when systematic. Using a formal *checklist* ensures consistency in checking for errors in content, interpretation, traceability, and clarity.
  ],
)

#section-header("二. True or False")

#question(
  number: 15,
  options_columns: 4,
  stem: [Requirements engineering is a generic process that does not vary from one software project to another.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    Requirements engineering varies significantly based on project size, complexity, and the process model (e.g., Agile vs. Waterfall).
  ],
)

#question(
  number: 16,
  options_columns: 4,
  stem: [A stakeholder is anyone who will purchase the completed software system under development.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    A stakeholder is anyone who benefits from, uses, or is affected by the system. This includes end-users, developers, and managers, not *only* the purchaser.
  ],
)

#question(
  number: 17,
  options_columns: 4,
  stem: [It is relatively common for different customers to propose conflicting requirements, each arguing that his or her version is the right one.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: A (True)* \
    Conflict is a natural part of requirements gathering; negotiation is required to resolve these conflicts.
  ],
)

#question(
  number: 18,
  options_columns: 4,
  stem: [Non-functional requirements can be safely ignored in modern software development projects.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    Non-functional requirements (NFRs) like performance, security, and reliability are critical. Ignoring them often leads to system failure.
  ],
)

#question(
  number: 19,
  options_columns: 4,
  stem: [User stories are complete descriptions the user needs and include the non-functional requirements for a software increment.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    User stories are short, simple descriptions (often one sentence). They are *not* complete specifications and typically focus on functionality; NFRs are often handled as constraints or separate acceptance criteria.
  ],
)

#question(
  number: 20,
  options_columns: 4,
  stem: [Developers and customers create use-cases to help the software team understand how different classes of end-users will use functions.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: A (True)* \
    Use cases are a scenario-based technique to describe interactions between actors and the system.
  ],
)

#question(
  number: 21,
  options_columns: 4,
  stem: [Use-case actors are always people, never system devices.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    Actors represent roles played by users *or* other systems/hardware that interact with the system.
  ],
)

#question(
  number: 22,
  options_columns: 4,
  stem: [Analysis patterns facilitate the transformation of the analysis model into a design model by suggesting reliable solutions to common problems.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: A (True)* \
    Analysis patterns provide reusable solutions to common modeling problems, speeding up analysis and the transition to design.
  ],
)

#question(
  number: 23,
  options_columns: 4,
  stem: [In win-win negotiation, the customer's needs are met even though the developer's need may not be.],
  options: ([A. True], [B. False]),
  answer: "B",
  analysis: [
    *Correct Answer: B (False)* \
    Win-Win means *both* parties win. The customer gets the product, and the developer gets realistic budgets/deadlines.
  ],
)

#question(
  number: 24,
  options_columns: 4,
  stem: [In requirements validation the requirements model is reviewed to ensure its technical feasibility.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: A (True)* \
    Validation checks for consistency, completeness, and *feasibility* (can it actually be built?).
  ],
)

#question(
  number: 25,
  options_columns: 4,
  stem: [The most common reason for software project failure is lack of functionality.],
  options: ([A. True], [B. False]),
  answer: "A",
  analysis: [
    *Correct Answer: B (False)* \
    Projects rarely fail because they don't have enough features; they fail due to poor requirements, scope creep, lack of user involvement, or unrealistic expectations.
  ],
)

#section-header("三. Short Answer")

#question(
  number: 26,
  stem: [What are the seven steps for requirements engineering?],
  analysis: [
    The seven distinct tasks are:
    1.  *Inception* (起始)
    2.  *Elicitation* (导出)
    3.  *Elaboration* (精化)
    4.  *Negotiation* (协商)
    5.  *Specification* (规格说明)
    6.  *Validation* (确认)
    7.  *Requirements Management* (需求管理)
  ],
)

#question(
  number: 27,
  stem: [What three deployments are used in Quality Function Deployment (QFD)?],
  analysis: [
    QFD typically uses:
    1.  *Function deployment* (used to determine value of each function required)
    2.  *Information deployment* (identifies data objects and events)
    3.  *Task deployment* (examines behavior of the system)
    *(Sometimes Value Deployment is also cited, but Function, Information, and Task are the standard technical deployments).*
  ],
)

#question(
  number: 28,
  stem: [Describe the weaknesses of use-cases as part of the requirements engineering process.],
  analysis: [
    1.  They are often not formal enough for complex logic.
    2.  They do not handle *Non-Functional Requirements* (NFRs) like performance or security well.
    3.  They focus on user interaction, potentially missing back-end system-to-system requirements.
  ],
)

#question(
  number: 29,
  stem: [What are the elements of the analysis model? And What is the content (diagram) of each element?],
  analysis: [
    The analysis model consists of:
    1.  *Scenario-based elements:* Depicted by Use Case diagrams, Activity diagrams.
    2.  *Class-based elements:* Depicted by Class diagrams, CRC cards.
    3.  *Behavioral elements:* Depicted by State diagrams, Sequence diagrams.
    4.  *Flow-oriented elements:* Depicted by Data Flow Diagrams (DFD) or Control Flow Diagrams.
  ],
)

#question(
  number: 30,
  stem: [Which UML diagrams are useful for analysis modeling?],
  analysis: [
    Key UML diagrams for analysis include:
    1.  *Use Case Diagram* (Scenarios)
    2.  *Activity Diagram* (Flow/Logic)
    3.  *Class Diagram* (Static Structure)
    4.  *Sequence Diagram* (Interaction/Behavior)
    5.  *State Diagram* (Behavior/Status changes)
  ],
)