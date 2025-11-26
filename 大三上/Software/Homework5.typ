#import "@preview/cetz:0.4.2": canvas, draw, vector

// --- 全局样式设置 ---
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  numbering: "1",
)

#let font-sans = ("Helvetica", "Arial", "Microsoft YaHei", "Heiti SC")
#let font-serif = ("Times New Roman", "Source Han Serif SC", "SimSun", "PingFang SC")

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
      text(font: font-sans, weight: "bold", str(number) + "."), 
      text(weight: "semibold", stem)
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
  draw.group({
    draw.circle((0, 0.5), radius: 0.25) // Head
    draw.line((0, 0.25), (0, -0.4)) // Body
    draw.line((-0.3, 0), (0.3, 0)) // Arms
    draw.line((0, -0.4), (-0.3, -0.8)) // Left Leg
    draw.line((0, -0.4), (0.3, -0.8)) // Right Leg
    draw.content((0, -1.2), text(size: 8pt, name))
  }, name: name)
  draw.move-to(pos) // Position the group
}

#let uml-usecase(pos, label, name: none) = {
  let n = if name == none { label } else { name }
  draw.content(pos, box(inset: 5pt, radius: 50%, stroke: 1pt, fill: white)[#text(size: 8pt, label)], name: n, anchor: "center")
}

#let uml-class(pos, name, attrs: [], ops: []) = {
  draw.content(pos, box(stroke: 1pt, width: 3.5cm, fill: white)[
    #set align(left)
    #box(width: 100%, inset: 5pt, fill: rgb("#eeeeee"), stroke: (bottom: 0.5pt))[#align(center)[*#name*]]
    #box(width: 100%, inset: 5pt, stroke: (bottom: 0.5pt))[#text(size: 8pt, attrs)]
    #box(width: 100%, inset: 5pt)[#text(size: 8pt, ops)]
  ], name: name, anchor: "north")
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
  answer: "C", analysis: "Requirements modeling typically consists of Scenario, Class, Behavioral, and Flow elements. 'Data elements' are usually part of class/flow models, not a top-level category in this context."
)

#question(
  number: 2,
  stem: [Which of the following is not an objective for building a requirements model?],
  options: ([A. define set of software requirements that can be validated], [B. describe customer requirements], [C. develop an abbreviated solution for the problem], [D. establish basis for software design]),
  answer: "C", analysis: "The goal is to understand the problem, not to design a 'quick' or abbreviated solution."
)

#question(
  number: 3,
  stem: [UML activity diagrams are useful in representing which analysis model elements?],
  options: ([A. Behavioral elements], [B. Class-based elements], [C. Flow-based elements], [D. Scenario-based elements]),
  answer: "D", analysis: "Activity diagrams supplement use cases (scenarios) by showing the flow of interaction."
)

#question(
  number: 4,
  stem: [Which of the following should be considered as candidate objects in a problem space?],
  options: ([A. events], [B. people], [C. structures], [D. all of the above]),
  answer: "D", analysis: "Objects can be physical entities (people, structures) or conceptual occurrences (events)."
)

#question(
  number: 5,
  stem: [Which of the following items does not appear on a CRC card?],
  options: ([A. class collaborators], [B. class name], [C. class reliability], [D. class responsibilities]),
  answer: "C", analysis: "CRC stands for Class, Responsibility, Collaboration. Reliability is a quality attribute."
)

#question(
  number: 6,
  stem: [Class responsibilities are defined by],
  options: ([A. its attributes only], [B. its collaborators], [C. its operations only], [D. both its attributes and operations]),
  answer: "D", analysis: "Responsibilities encompass what the class knows (attributes) and what it does (operations)."
)

#question(
  number: 7,
  stem: [The state diagram],
  options: ([A. depicts relationships between data objects], [B. depicts functions that transform the data flow], [C. indicates how data are transformed by the system], [D. indicates system reactions to external events]),
  answer: "D", analysis: "State diagrams model the dynamic behavior of a system in response to events."
)

#question(
  number: 8,
  stem: [For purposes of behavior modeling a state is any],
  options: ([A. consumer or producer of data.], [B. data object hierarchy.], [C. observable mode of behavior.], [D. well defined process.]),
  answer: "C", analysis: "A state represents a condition or situation during the life of an object."
)

#section-header("二. True or False (10 questions, 20 points)")

#question(number: 9, stem: [In structured analysis models focus on the structure of the classes defined for a system along with their interactions.], options: ([A. True], [B. False]), answer: "B (False)")
#question(number: 10, stem: [Creation and refinement of use cases is an important part of scenario-based modeling.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 11, stem: [It is important to consider alternative actor interactions when creating a preliminary use case.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 12, stem: [Brainstorming is one technique that may be used to derive a complete set of use case exceptions.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 13, stem: [UML swimlane diagrams allow you to represent the flow of activities by showing the actors having responsibility for creating each data element.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 14, stem: [In the grammatical parse of a processing narrative the nouns become object candidates in the analysis model.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 15, stem: [Collaborators in CRC modeling are those classes needed to fulfill a responsibility on another card.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 16, stem: [An analysis package involves the categorization of analysis model elements into useful groupings.], options: ([A. True], [B. False]), answer: "A (True)")
#question(number: 17, stem: [Attributes cannot be defined for a class until design has been completed.], options: ([A. True], [B. False]), answer: "B (False)")
#question(number: 18, stem: [In many cases there is no need to create a graphical representation of a usage scenario.], options: ([A. True], [B. False]), answer: "A (True)")

#section-header("三. Short Answer & Design (8 questions, 144 points)")

#question(
  number: 19,
  stem: [What are the steps needed to build an object-behavior model?],
  answer: "1. Evaluate use cases to understand interaction sequence. 2. Identify events driving the sequence. 3. Create a sequence for each use case. 4. Build a state diagram. 5. Review for consistency."
)

// --- Q20: Online Payment System ---
#question(
  number: 20,
  stem: [Online Payment System Design],
  answer: [
    *(a) Use Case Diagram:* 
    Actors: Buyer, Seller, System. Cases: Pay, Confirm Receipt, Query Order.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Buyer")
      uml-actor((6, 0), "Seller")
      
      uml-usecase((3, 1.5), "Make Payment", name: "UC1")
      uml-usecase((3, 0), "Confirm Receipt", name: "UC2")
      uml-usecase((3, -1.5), "Query Order", name: "UC3")
      
      draw.line("Buyer", "UC1")
      draw.line("Buyer", "UC2")
      draw.line("Buyer", "UC3")
      draw.line("Seller", "UC3")
    })

    *(b) Class Diagram:*
    Potential classes: Buyer, Seller, Order, Transaction, Account.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Order", attrs: [- orderID \ - amount \ - date], ops: [+ create() \ + getStatus()])
      uml-class((5, 0), "Account", attrs: [- balance \ - ownerID], ops: [+ transfer() \ + refund()])
      uml-class((2.5, -3), "Transaction", attrs: [- transID \ - status \ - timestamp], ops: [+ log() \ + audit()])
      
      draw.line("Order", "Account", mark: (end: ">"))
      draw.line("Order", "Transaction", mark: (end: "<>"))
    })
  ]
)

// --- Q21: SafeHome Remote ---
#question(
  number: 21,
  stem: [SafeHome Remote Access Design],
  answer: [
    *(a) Use Case Diagram:* 
    Actor: RemoteUser. Cases: Login, Select Surveillance, Pick Camera, View All.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "RemoteUser")
      
      uml-usecase((4, 2), "Log On", name: "UC_Log")
      uml-usecase((4, 0.5), "Select Surveillance", name: "UC_Surv")
      uml-usecase((4, -1), "Pick Camera", name: "UC_Pick")
      uml-usecase((4, -2.5), "View All Cameras", name: "UC_ViewAll")
      
      draw.line("RemoteUser", "UC_Log")
      draw.line("RemoteUser", "UC_Surv")
      draw.line("RemoteUser", "UC_Pick")
      draw.line("RemoteUser", "UC_ViewAll")
    })
    
    *(b) Class Diagram:*
    Classes: User, System, Camera, FloorPlan.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "User", attrs: [- userID \ - password], ops: [+ login() \ + validate()])
      uml-class((5, 0), "Camera", attrs: [- cameraID \ - location \ - status], ops: [+ view() \ + snapshot()])
      uml-class((2.5, -3), "FloorPlan", attrs: [- layoutData], ops: [+ display() \ + selectCamera()])
      
      draw.line("User", "Camera", name: "link1")
      draw.content("link1", anchor: "south", [1..\*])
    })
  ]
)

// --- Q22: PHTRS Pothole System ---
#question(
  number: 22,
  stem: [Pothole Tracking (PHTRS) Design],
  answer: [
    *(a) Use Case Diagram:*
    Actors: Citizen, RepairCrew. Cases: Report Pothole, Issue Work Order.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Citizen")
      uml-actor((6, 0), "RepairCrew")
      
      uml-usecase((3, 1), "Report Pothole", name: "UC_Rep")
      uml-usecase((3, -1), "Update Status", name: "UC_Upd")
      
      draw.line("Citizen", "UC_Rep")
      draw.line("RepairCrew", "UC_Upd")
    })
    
    *(b) Class Diagram:*
    Classes: Pothole, WorkOrder, RepairCrew.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Pothole", attrs: [- id \ - size \ - location \ - priority], ops: [+ report() \ + assignPriority()])
      uml-class((5, 0), "WorkOrder", attrs: [- orderNo \ - status \ - hoursWorked], ops: [+ create() \ + close()])
      uml-class((2.5, -3), "RepairCrew", attrs: [- crewID \ - members], ops: [+ assign() \ + repair()])
      
      draw.line("Pothole", "WorkOrder", mark: (end: "<>")) // Composition/Aggregation
    })
  ]
)

// --- Q23: SafeHome Security ---
#question(
  number: 23,
  stem: [SafeHome Security Function Design],
  answer: [
    *(a) Use Case Diagram:*
    Actors: Sensors, MonitoringAgency. Cases: Detect Situation, Auto-Dial.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Sensor")
      uml-actor((6, 0), "MonitoringAgency")
      
      uml-usecase((3, 0), "Detect Situation", name: "UC_Det")
      uml-usecase((3, -1.5), "Auto-Dial", name: "UC_Dial")
      
      draw.line("Sensor", "UC_Det")
      draw.line("UC_Det", "UC_Dial", mark: (end: ">"), name: "include")
      draw.content("include", text(size:8pt, "<<include>>"))
      draw.line("UC_Dial", "MonitoringAgency")
    })
    
    *(b) Class Diagram:*
    Classes: Sensor, AlarmSystem, Situation.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Sensor", attrs: [- type \ - status \ - location], ops: [+ detect() \ + signal()])
      uml-class((5, 0), "AlarmSystem", attrs: [- state \ - phoneNum], ops: [+ dial() \ + soundAlarm()])
      uml-class((2.5, -3), "Situation", attrs: [- type \ - severity], ops: [+ log()])
      
      draw.line("Sensor", "AlarmSystem")
    })
  ]
)

// --- Q24: SafeHome Configuration ---
#question(
  number: 24,
  stem: [SafeHome Configuration Design],
  answer: [
    *(a) Use Case Diagram:*
    Actor: Homeowner. Cases: Configure System, Set Password, Monitor Sensors.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Homeowner")
      uml-usecase((4, 1.5), "Configure System", name: "UC_Conf")
      uml-usecase((4, 0), "Set Password", name: "UC_Pass")
      uml-usecase((4, -1.5), "Monitor Sensors", name: "UC_Mon")
      
      draw.line("Homeowner", "UC_Conf")
      draw.line("Homeowner", "UC_Pass")
      draw.line("Homeowner", "UC_Mon")
    })
    
    *(b) Class Diagram:*
    Classes: Configuration, ControlPanel, Sensor.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Configuration", attrs: [- delayTime \ - masterPassword], ops: [+ update() \ + save()])
      uml-class((5, 0), "ControlPanel", attrs: [- displayState], ops: [+ showPrompt() \ + getInput()])
      uml-class((2.5, -3), "Sensor", attrs: [- number \ - type], ops: [+ assignNumber()])
      
      draw.line("ControlPanel", "Configuration")
    })
  ]
)

// --- Q25: WeChat Food Ordering ---
#question(
  number: 25,
  stem: [WeChat Food Ordering System],
  answer: [
    *(a) Use Case Diagram:*
    Actor: Customer, DeliveryStaff. Cases: Search Food, Place Order, Filter.
    #v(1em)
    #canvas(length: 1cm, {
      uml-actor((0, 0), "Customer")
      uml-actor((6, 0), "DeliveryStaff")
      
      uml-usecase((3, 1.5), "Search Food", name: "UC_Search")
      uml-usecase((3, 0), "Place Order", name: "UC_Order")
      uml-usecase((3, -1.5), "View Delivery", name: "UC_View")
      
      draw.line("Customer", "UC_Search")
      draw.line("Customer", "UC_Order")
      draw.line("Customer", "UC_View")
      draw.line("DeliveryStaff", "UC_View")
    })
    
    *(b) Use Cases Description:*
    1. *Log In:* User enters WeChat ID/Phone. System validates.
    2. *Place Order:* User selects food, adds to cart, submits payment.
    3. *Receive Order:* Restaurant receives notification, prepares food.
  ]
)

// --- Q26: Bank of China ATM ---
#question(
  number: 26,
  stem: [BOC ATM System Design],
  answer: [
    *(a) Use Case Diagram:*
    Actor: Depositor, Teller, ATM. Cases: Withdraw, Deposit, Transfer.
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
    
    *(b) Class Diagram:*
    Classes: Account, Card, ATM.
    #v(1em)
    #canvas(length: 1cm, {
      uml-class((0, 0), "Account", attrs: [- accountNo \ - balance \ - owner], ops: [+ credit() \ + debit()])
      uml-class((5, 0), "Card", attrs: [- cardNo \ - pin], ops: [+ validate() \ + insert()])
      uml-class((2.5, -3), "ATM", attrs: [- location \ - cashStock], ops: [+ dispense() \ + printBill()])
      
      draw.line("Card", "Account", mark: (end: ">"))
      draw.line("ATM", "Card", name: "rel")
      draw.content("rel", text(size:8pt, "reads"))
    })
  ]
)