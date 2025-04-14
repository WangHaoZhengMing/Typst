#let quiz-options(..options) = {
  let indentation = 10pt
  let option_array = options.pos()
  block(
    layout(size => {
      let container_width = size.width - indentation
      let content_width_approx = option_array.fold(0pt, (acc, option) => acc + measure(option).width)
      let width_ratio = content_width_approx / container_width

      if container_width < 120pt or width_ratio > 0.8 /* 4/5 */ {
        // Enumeration
        enum(
          indent: indentation,
          numbering: "A.",
          ..option_array,
        )
      } else {
        // One-liner
        let enumerated_options = option_array
          .enumerate()
          .map(items => {
            let (index, option) = items
            let numbering = str.from-unicode(65 /* 'A' */ + index)
            [#numbering. #option]
          })

        block(width: 80%, h(indentation) + enumerated_options.join(h(1fr)))
      }
    }),
  )
}
#quiz-options(
  "Option 1",
  "Option 2",
  "Option 3",
  "Option 4",
)
#quiz-options(
  "你好这是一个选项",
  "这是第二个选项",
  "这是第三个选项",
  "这是第四个选, ",
)
