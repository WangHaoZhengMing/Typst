#import "@preview/cetz:0.4.2"

#set page(width: auto, height: auto, margin: 1cm)

// Visual settings
#let atom-radius-2d = 0.25
#let atom-radius-3d = 0.18
#let bond-width-2d = 1pt
#let bond-width-3d = 2.5pt
#let text-size = 10pt

#grid(
  columns: 2,
  column-gutter: 20pt,
  align: center+horizon,
  [#figure(caption: [黑磷（层状投影）])[#cetz.canvas({
      import cetz.draw: *

      // ==========================================
      // LEFT DIAGRAM: 2D Projection (Hexagonal Network)
      // ==========================================
      group(name: "left-diagram", {
        let dx = 1.2
        let dy = 0.7

        // Helper to draw "P" atom with background mask
        let draw-p(x, y) = {
          content((x, y), box(fill: white, inset: 2pt, [$upright(P)$]), anchor: "center")
        }

        let cols = 4
        let rows = 2

        // Draw Bonds
        for c in range(cols + 1) {
          for r in range(rows + 1) {
            // Calculate base position
            // Staggered columns: Odd columns are shifted down
            let x1 = float(c) * dx
            let shift = if calc.odd(c) { dy * 2.0 } else { 0.0 }
            let y-top = float(r) * dy * 4.0 + shift

            // Define the two atoms in the vertical pair
            let p-top = (x1, -y-top)
            let p-bot = (x1, -(y-top + dy))

            // 1. Vertical Bond
            line(p-top, p-bot, stroke: bond-width-2d)

            // 2. Diagonal Bonds to the Right (if not last column)
            if c < cols {
              // Logic:
              // If current col is EVEN:
              //   Bot atom connects to Right-col Top atom (Down-Right)
              //   Top atom connects to Right-col Bot atom of PREVIOUS row?
              //   Let's look at the hexagonal structure:
              //   Even Col Bot (y) connects to Odd Col Top (y+dy)

              let x-right = (c + 1) * dx
              // Odd column shift is dy*2
              // The "Top" atom of the odd column in the same row index `r` is at:
              let y-right-top = float(r) * dy * 4.0 + dy * 2.0

              // Top of current (Even) connects to Bottom of (Odd, r-1)? No.
              // Let's strictly follow standard honeycomb:
              // Bottom of Even(r) -> Top of Odd(r)
              // Top of Even(r) -> Bottom of Odd(r-1)

              if calc.even(c) {
                // Connection: Bot(Even) -> Top(Odd)
                let p-right-top = (x-right, -y-right-top)
                line(p-bot, p-right-top, stroke: bond-width-2d)

                // Connection: Top(Even) -> Bot(Odd, prev row)
                // Or visually: Top(Even) goes Up-Right
                let p-right-bot-prev = (x-right, -(y-right-top - dy * 4.0 + dy))
                // Only draw if valid or for stubs
                if r > 0 {
                  line(p-top, (x-right, -(y-right-top - dy * 3.0)), stroke: bond-width-2d)
                } else {
                  // Top row stubs (Up-Right)
                  line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
                }
              } else {
                // If current col is ODD:
                // Bot(Odd) -> Top(Even, next r)
                // Top(Odd) -> Bot(Even, same r)

                // We only need to draw forward (to right) to avoid double drawing
                // Odd Col (c) to Even Col (c+1)
                let y-next-even-top = float(r) * dy * 4.0
                let y-next-even-bot = y-next-even-top + dy

                // Connection: Bot(Odd) -> Top(Even, next Row)
                // p-bot is (x1, -(y-top + dy))
                // Target is (x-right, -(y-next-even-top + dy*4)) -> (x-right, -y-next-even-top_next)
                // Let's simplify: Just mirror the Even->Odd logic.

                // Connection: Top(Odd) -> Bot(Even, same r)
                // p-top is (x1, -y-top). y-top = base + 2dy
                // Target Bot(Even) is at base + dy
                // The line goes Up-Right
                line(p-top, (x-right, -y-next-even-bot), stroke: bond-width-2d)

                // Connection: Bot(Odd) -> Top(Even, next r)
                // The line goes Down-Right
                // If r is last, draw stub
                if r < rows {
                  line(p-bot, (x-right, -(y-next-even-top + dy * 4.0)), stroke: bond-width-2d)
                } else {
                  line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
                }
              }
            }

            // 3. Stubs on Left Edge (c == 0)
            if c == 0 {
              // Even col (0).
              // Top atom needs Up-Left stub
              line(p-top, (x1 - dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
              // Bot atom needs Down-Left stub
              line(p-bot, (x1 - dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
            }

            // 4. Stubs on Right Edge (c == cols)
            if c == cols {
              // Check parity to decide direction
              if calc.even(c) {
                // Same as Left Edge mirrored?
                // Top atom needs Up-Right
                line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
                // Bot atom needs Down-Right
                line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
              } else {
                // Odd col at end
                // Top atom (low) needs Down-Right stub? No, it connected to Bot-Even-Left.
                // It needs Up-Right stub.
                line(p-top, (x1 + dx * 0.6, -y-top + dy * 0.6), stroke: bond-width-2d)
                line(p-bot, (x1 + dx * 0.6, -(y-top + dy) - dy * 0.6), stroke: bond-width-2d)
              }
            }
          }
        }

        // Draw Atoms (P Labels) on top of lines
        for c in range(cols + 1) {
          for r in range(rows + 1) {
            let x1 = float(c) * dx
            let shift = if calc.odd(c) { dy * 2.0 } else { 0.0 }
            let y-top = float(r) * dy * 4.0 + shift

            draw-p(x1, -y-top)
            draw-p(x1, -(y-top + dy))
          }
        }
      })

      // ==========================================
      // RIGHT DIAGRAM: 3D Microscopic Structure
      // ==========================================

      // ==========================================
      // PLACEMENT
      // ==========================================
    })]

  ],
  [#figure(caption: [黑磷的微观结构])[
    #cetz.canvas({
      import cetz.draw: *
      group(name: "right-diagram", anchor: "center", {
        // Helper to draw shaded atom
        let draw-atom(x, y) = {
          circle(
            (x, y),
            radius: atom-radius-3d,
            fill: gradient.radial(white, black, center: (30%, 30%), radius: 80%),
            stroke: none,
          )
        }

        // Function to draw one puckered layer
        let draw-layer(x-origin, y-origin) = {
          let w = 1.0 // zig-zag width
          let h = 0.6 // zig-zag height
          let d-x = 0.4 // perspective depth x
          let d-y = 0.3 // perspective depth y

          let reps = 4

          let front-top = ()
          let front-bot = ()
          let back-top = ()
          let back-bot = ()

          // Generate coordinates
          for i in range(reps) {
            let x0 = x-origin + float(i) * w * 2.0
            let y0 = y-origin

            // Front Zig-Zag
            front-top.push((x0, y0))
            front-bot.push((x0 + w / 2.0, y0 - h))
            front-top.push((x0 + w, y0))
            front-bot.push((x0 + w * 1.5, y0 - h))

            // Back Zig-Zag (shifted)
            back-top.push((x0 + d-x, y0 + d-y))
            back-bot.push((x0 + w / 2.0 + d-x, y0 - h + d-y))
            back-top.push((x0 + w + d-x, y0 + d-y))
            back-bot.push((x0 + w * 1.5 + d-x, y0 - h + d-y))
          }
          // Closing points
          let x-last = x-origin + float(reps) * w * 2.0
          front-top.push((x-last, y-origin))
          back-top.push((x-last + d-x, y-origin + d-y))

          // --- Draw Back Structure ---
          // Back Chain Line
          let back-chain = ()
          for i in range(back-bot.len()) {
            back-chain.push(back-top.at(i))
            back-chain.push(back-bot.at(i))
          }
          back-chain.push(back-top.last())
          line(..back-chain, stroke: (thickness: bond-width-3d, cap: "round"))

          // Cross Bonds (Back to Front)
          // In Black P, the "high" atoms connect to "low" atoms of the other chain?
          // Actually, looking at the structure:
          // High-Back connects to High-Front. Low-Back connects to Low-Front. (Rungs)
          for i in range(back-top.len()) {
            line(back-top.at(i), front-top.at(i), stroke: (thickness: bond-width-3d, cap: "round"))
          }
          for i in range(back-bot.len()) {
            line(back-bot.at(i), front-bot.at(i), stroke: (thickness: bond-width-3d, cap: "round"))
          }

          // Back Atoms
          for pt in back-top { draw-atom(pt.at(0), pt.at(1)) }
          for pt in back-bot { draw-atom(pt.at(0), pt.at(1)) }

          // --- Draw Front Structure ---
          let front-chain = ()
          for i in range(front-bot.len()) {
            front-chain.push(front-top.at(i))
            front-chain.push(front-bot.at(i))
          }
          front-chain.push(front-top.last())
          line(..front-chain, stroke: (thickness: bond-width-3d, cap: "round"))

          // Front Atoms
          for pt in front-top { draw-atom(pt.at(0), pt.at(1)) }
          for pt in front-bot { draw-atom(pt.at(0), pt.at(1)) }
        }

        // Draw 3 stacked layers
        draw-layer(0, 0)
        draw-layer(0, -2.5)
        draw-layer(0, -5.0)

        // Scale Bar
        let scale-x = 9.5
        line((scale-x, 0.2), (scale-x, -2.2), mark: (start: ">", end: ">", size: 0.2), stroke: 1pt)
        content((scale-x + 0.2, -1.0), text(size: text-size)[0.5 mm], anchor: "west")
      })
    })]],
)


