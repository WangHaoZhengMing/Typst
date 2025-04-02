#import "@preview/cetz:0.3.4": *
#import draw: *

#set text(font: ("Heiti SC", "Source Han Sans SC")) // Use fonts that support Chinese

#figure(
  canvas({
    // Set a default stroke color similar to the image
    set-style(stroke: rgb("#445566")) // Dark blue-gray

    // Define node positions (centers of circles)
    let pos_a = (0, 5)
    let pos_b = (5, 5)
    let pos_c = (8, 2.5)
    let pos_d = (6, 0)
    let pos_e = (0, 0)
    let pos_f = (2.5, 2.5)

    // Define node radius
    let node_radius = 0.7

    // Draw nodes as circles using explicit center and radius
    // circle(center: pos_a, radius: node_radius)
    // circle(center: pos_b, radius: node_radius)
    // circle(center: pos_c, radius: node_radius)
    // circle(center: pos_d, radius: node_radius)
    // circle(center: pos_e, radius: node_radius)
    // circle(center: pos_f, radius: node_radius)

    // Add labels inside nodes
    content(pos_a, [A])
    content(pos_b, [B])
    content(pos_c, [C])
    content(pos_d, [D])
    content(pos_e, [E])
    content(pos_f, [F])

    // Draw lines (edges) between node centers
    line(pos_a, pos_b)
    line(pos_a, pos_f)
    line(pos_a, pos_e)
    line(pos_b, pos_f)
    line(pos_b, pos_d)
    line(pos_b, pos_c)
    line(pos_f, pos_e)
    line(pos_f, pos_d)
    line(pos_e, pos_d)
    line(pos_c, pos_d)

    // Add edge labels (weights) near the midpoint of lines
    // Helper function for midpoints (optional, but cleaner)
    let midpoint(p1, p2) = ( (p1.at(0)+p2.at(0))/2, (p1.at(1)+p2.at(1))/2 )

    // Place labels, maybe with slight nudge for clarity
    // content(midpoint(pos_a, pos_b) + (0, 0.3), [17]) // Nudge up
    // content(midpoint(pos_a, pos_f) + (-0.3, 0.3), [1]) // Nudge up-left
    // content(midpoint(pos_a, pos_e) + (-0.3, 0), [16]) // Nudge left
    // content(midpoint(pos_b, pos_f) + (0.3, 0.3), [11]) // Nudge up-right
    // content(midpoint(pos_b, pos_d) + (0.3, 0), [5]) // Nudge right
    // content(midpoint(pos_b, pos_c) + (0.3, 0), [6]) // Nudge right
    // content(midpoint(pos_f, pos_e) + (-0.3, -0.3), [33]) // Nudge down-left
    // content(midpoint(pos_f, pos_d) + (0.3, -0.3), [14]) // Nudge down-right
    // content(midpoint(pos_e, pos_d) + (0, -0.3), [4]) // Nudge down
    // content(midpoint(pos_c, pos_d) + (0.3, 0), [10]) // Nudge right

  }),
  caption: [图 1] // Add caption
)