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