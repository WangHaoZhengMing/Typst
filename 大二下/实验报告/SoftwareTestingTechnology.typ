#set text(font:"pingfang sc")
#align(center, text(size: 18pt, weight: "bold")[软件测试实验报告])
#align(center, grid(
  columns: 4,
  gutter: 1em,
  [姓名：#underline(evade: false, stroke: 0.5pt, offset: 3pt)[ 王浩然 ]],
  [学号：#underline(evade: false, stroke: 0.5pt, offset: 3pt)[ 231040100116 ]],
  [班级：#underline(evade: false, stroke: 0.5pt, offset: 3pt)[计科2301]],
  [日期：#underline(evade: false, stroke: 0.5pt, offset: 3pt)[2025-05-12]],
))
#set heading(level: 1, numbering: "一、")
#show heading: it => {
  show h.where(amount: 0.3em): none
  it
}
== 实验内容
#rect(width: 100%, inset: 10pt, stroke: none)[
]

== 实验步骤
#rect(width: 100%, inset: 10pt, stroke: none)[
  详细描述实验步骤及遇到的问题，解决的方法。
]

== 实验结果
#rect(width: 100%, inset: 10pt, stroke: none)[
  （有截图和详细说明）
]

== 实验的心得体会
#rect(width: 100%, inset: 10pt, stroke: none)[
  （字数和具体程度）
]
