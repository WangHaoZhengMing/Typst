#import "@preview/cetz:0.3.1": *
#import "@preview/cetz-plot:0.1.0": *

#let apple_blue = rgb("#007AFF");#let table_blue = rgb("#3478F6")
#let apple_green = rgb("#34C759")
#let apple_orange = rgb("#FF9500")
#let light_gray = rgb("#F5F5F7")
#let dark_gray = rgb("#86868B");#let apple_gray = rgb("#98989D")
#let text_primary = rgb("#1D1D1F")
#let divider_color = rgb("#D1D1D6")
//--------------------------------
#set page(
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  header: context {
    let current = counter(page).at(here())
    if current != 1 {
      line(length: 100%, stroke: divider_color)
      h(1em)
      text(dark_gray)[Swift Charts]
    }
  },
)

#set text(
  font: ("SF Pro Text", "PingFang SC"),
  size: 11pt,
  fill: text_primary,
  spacing: 150%,
)

// #set heading(
//   numbering: "1.1",
//   outlined: true
// )

#show heading: it => {
  if it.level == 1 {
    text(
      size: 28pt,
      weight: "bold",
      fill: text_primary,
      it.body,
    )
    v(-0.5cm)
  } else if it.level == 2 {
    text(
      size: 18pt,
      weight: "bold",
      fill: text_primary,
      it.body,
    )
    v(-0.5cm)
  } else if it.level == 3 {
    text(
      size: 14pt,
      weight: "bold",
      fill: text_primary,
      it.body,
    )
  } else if it.level == 4 {
    text(
      size: 14pt,
      weight: "semibold",
      fill: text_primary,
      it.body,
    )
    v(-0.2cm)
  }
}
//--------------------------------
#let concept_box(title, content) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1.2em),
    fill: light_gray,
    radius: 12pt,
    [
      #text(weight: "bold", size: 14pt)[#title]

      // #v(0.1em)
      #text(size: 11pt)[#content]
    ],
  )
  v(1em)
}

#let info_box(content) = {
  block(
    width: 100%,
    inset: 1em,
    fill: light_gray,
    radius: 8pt,
    content,
  )
}

#let code_block(content) = {
  block(
    width: 100%,
    inset: 1em,
    fill: rgb("#F6F8FA"),
    radius: 4pt,
    content,
  )
}

#let tip_box(title: "Tip", content) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: rgb("#E8F4F9"),
    // stroke: (left: 4pt + rgb("#69B4D6")),
    radius: 8pt,
    [
      #text(weight: "bold", fill: rgb("#1B809E"))[#title]
      #v(0.3em)
      #content
    ],
  )
  v(1em)
}

#let warning_box(title: "Warning", content) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: rgb("#FFF4E5"),
    stroke: (left: 4pt + rgb("#F5A623")),
    radius: 8pt,
    [
      #text(weight: "bold", fill: rgb("#B45309"))[#title]
      #v(0.3em)
      #content
    ],
  )
  v(1em)
}

#let note_box(title: "Note", content) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: rgb("#F3F4F6"),
    stroke: (left: 4pt + rgb("6B7280")),
    radius: 8pt,
    [
      #text(weight: "bold", fill: rgb("#374151"))[#title]
      #v(0.3em)
      #content
    ],
  )
  v(1em)
}

#let important_box(title: "Important", content) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    fill: rgb("#FEF2F2"),
    stroke: (left: 4pt + rgb("#DC2626")),
    radius: 8pt,
    [
      #text(weight: "bold", fill: rgb("#991B1B"))[#title]
      #v(0.3em)
      #content
    ],
  )
  v(1em)
}

#let code_example(code) = {
  block(
    width: 100%,
    inset: (x: 0em, y: 1em),
    [
      #block(
        width: 100%,
        inset: 1em,
        fill: rgb("#F6F8FA"),
        radius: 8pt,
        stroke: (
          paint: rgb("#E1E4E8"),
          thickness: 1pt,
        ),
        text(font: "SF Mono", code),
      )
    ],
  )
}
//--------------------------------
#let section_divider() = {
  v(1em)
  line(length: 100%, stroke: divider_color)
  v(1em)
}
//--------------------------------
#let title_page(title, subtitle, author: none) = {
  align(center)[
    #block(
      inset: (y: 2cm),
      [
        #text(size: 32pt, weight: "bold")[#title]\
        #v(0.5cm)
        #text(size: 14pt, fill: dark_gray)[#subtitle]
        #if author != none {
          v(1cm)
          text(size: 12pt)[#author]
        }
      ],
    )
  ]
  pagebreak()
}

#title_page(
  "Swift Charts",
  "Construct and customize charts on every Apple platform.",
)
//
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [*文本样式*], [*粗细*], [*字号pt*], [*行高度*], [*强调粗细*], [*示例*],
  [#text(size: 26pt, weight: "regular")[大标题]],
  [Regular],
  [26],
  [32],
  [Bold],
  [#text(size: 26pt, weight: "bold")[示例]],

  [#text(size: 22pt, weight: "regular")[标题 1]],
  [Regular],
  [22],
  [26],
  [Bold],
  [#text(size: 22pt, weight: "bold")[示例]],

  [#text(size: 17pt, weight: "regular")[标题 2]],
  [Regular],
  [17],
  [22],
  [Bold],
  [#text(size: 17pt, weight: "bold")[示例]],

  [#text(size: 15pt, weight: "regular")[标题 3]],
  [Regular],
  [15],
  [20],
  [Semibold],
  [#text(size: 15pt, weight: "semibold")[示例]],

  [#text(size: 13pt, weight: "bold")[提要]], [Bold], [13], [16], [Black], [#text(size: 13pt, weight: "black")[示例]],
  [#text(size: 13pt, weight: "regular")[正文]],
  [Regular],
  [13],
  [16],
  [Semibold],
  [#text(size: 13pt, weight: "semibold")[示例]],

  [#text(size: 12pt, weight: "regular")[标注]],
  [Regular],
  [12],
  [15],
  [Semibold],
  [#text(size: 12pt, weight: "semibold")[示例]],

  [#text(size: 11pt, weight: "regular")[小标题]],
  [Regular],
  [11],
  [14],
  [Semibold],
  [#text(size: 11pt, weight: "semibold")[示例]],

  [#text(size: 10pt, weight: "regular")[脚注]],
  [Regular],
  [10],
  [13],
  [Semibold],
  [#text(size: 10pt, weight: "semibold")[示例]],

  [#text(size: 10pt, weight: "regular")[说明 1]],
  [Regular],
  [10],
  [13],
  [Bold],
  [#text(size: 10pt, weight: "bold")[示例]],

  [#text(size: 10pt, weight: "medium")[说明 2]],
  [Medium],
  [10],
  [13],
  [Semibold],
  [#text(size: 10pt, weight: "semibold")[示例]],
)







#let HHeading(
  title,
  subtitle,
  platforms: (),
  right_content: none,
) = {
  block(
    width: 100%,
    inset: (x: 1.5em, y: 1em),
    stroke: (paint: rgb("#E1E4E8"), thickness: 1pt),
    radius: 8pt,
  )[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      [
        = #title
        #text(size: 13pt)[
          *#subtitle*
        ]
        #if platforms.len() > 0 {
          v(1em)
          let platform_text(content) = text(
            size: 10pt,
            fill: dark_gray,
            weight: "medium",
            content,
          )

          let separator = text(fill: dark_gray, " | ")

          align(left)[
            #for (i, platform) in platforms.enumerate() {
              if i > 0 { separator }
              platform_text(platform)
            }
          ]
        }
      ],
      if right_content != none {
        align(horizon)[
          #right_content]
      } else {
        [
          #align(horizon)[
            #text(size: 90pt, fill: apple_orange)[
              􀫊
            ]
          ]
        ]
      },
    )
  ]
}
