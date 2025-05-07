#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#set page(margin: 10pt,)

#diagram( 
  node-stroke: 1pt,
  node((-4.2, -3.4), [dgr ], shape: "circle", name: <node0>),
  node((-4.2, -5.7), [ret], shape: "circle", name: <node1>),
  node((-4.2, 1.9), [y5y], shape: "circle", name: <node2>),
  node((-4.2, -1.0), [ryr], shape: "circle", name: <node3>),
  node((0.3, -2.0), [yy], shape: "rect", name: <node4>),
  edge(<node4>, <node1>, "->"),
  edge(<node4>, <node0>, "->"),
  edge(<node4>, <node3>, "->"),
  edge(<node4>, <node2>, "->"),
)
