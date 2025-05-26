#import "@preview/cetz-plot:0.1.1": *
#import "@preview/cetz:0.3.4": *
#set page(width: auto, height: auto)
#figure(caption: [])[
#canvas(length: 1cm, {
  import draw: *
  
  // Draw BUS lines
  line((-9, 6), (7, 6), stroke: (thickness: 3pt, paint: gray))
  content((0, 6.3), $"BUS"_1$)
  
  line((-9, -6), (7, -6), stroke: (thickness: 3pt, paint: gray))
  content((0, -6.3), $"BUS"_2$)
  
  // Left Column - Registers R0-R3
  let reg-width = 1.8
  let reg-height = 0.6
  
  rect((-7.5, 4), (-7.5 + reg-width, 4 + reg-height), stroke: black)
  content((-7.5 + reg-width/2, 4 + reg-height/2), $R_0$)
  
  rect((-7.5, 3.2), (-7.5 + reg-width, 3.2 + reg-height), stroke: black)
  content((-7.5 + reg-width/2, 3.2 + reg-height/2), $R_1$)
  
  rect((-7.5, 2.4), (-7.5 + reg-width, 2.4 + reg-height), stroke: black)
  content((-7.5 + reg-width/2, 2.4 + reg-height/2), $R_2$)
  
  rect((-7.5, 1.6), (-7.5 + reg-width, 1.6 + reg-height), stroke: black)
  content((-7.5 + reg-width/2, 1.6 + reg-height/2), $R_3$)
  
  // IAR (Instruction Address Register)
  rect((-7.5, 0.5), (-5.3, 1.2), stroke: black)
  content((-6.4, 0.85), "IAR")
  
  // Instruction Memory
  rect((-7.5, -1), (-5.3, 0.2), stroke: black, fill: gray.lighten(70%))
  content((-6.4, -0.4), "指令存储器")
  content((-8.2, -0.4), [IM])
  
  // IDR (Instruction Data Register)
  rect((-7.5, -2.8), (-5.3, -2.1), stroke: black)
  content((-6.4, -2.45), "IDR")
  
  // Middle Column - Control Units
  rect((-3, 4), (-0.8, 4.7), stroke: black, name: "PC")
  content((-1.9, 4.35), [PC])
  line((-1.9,6),"PC", mark: (end: ">"))
  
  rect((-3, 2.3), (-0.8, 3.0), stroke: black,name:"AC0")
  content((-1.9, 2.65), $"AC"_0$)
  line((-3.5,-6),(-3.5,3.3),(-2.5,3.3),(-2.5,3),mark: (end: ">"))
  line((-0.2,6),(-0.2,3.5),(-1,3.5),(-1,3), mark: (end: ">"))
  
  // Control Unit
  rect((-3.4, -1.5), (-0.6, -0.7), stroke: black, fill: gray.lighten(80%))
  content((-2, -1.1), [操作控制器])
  line((-2.7, -3.3),(-2.7,-1.5), mark: (end: ">"))
  line((-1.4, -3.3),(-1.4, -3),(0,-3),(0,-6), mark: (end: ">"))
  
  // OP and X registers
  rect((-3.4, -4), (-2, -3.3), stroke: black, name:"OP")
  content((-2.7, -3.65),[OP])
  
  rect((-2, -4), (-0.6, -3.3), stroke: black)
  content((-1.3, -3.65), "X")
    // OP/X to BUS2
  line((-2, -4), (-2, -6), mark: (start: ">"))
  line("AC0",(-1.9, 1.7),(0.4,1.7), mark: (end: ">"))
  line((0.4,-6),(0.4,6),mark: (end: ">",start: ">"))
    // DAR connections
  line((2.6, -1.5), (2.6, -2.3), mark: (end: ">"))
  
  // DM to DDR
  line((2.6, -3.5), (2.6, -4.8), mark: (end: ">", start: ">"))
  
  // DDR to BUS2
  line((2.6, -5.4), (2.6, -6), mark: (end: ">", start: ">"))
   
  // DAR (Data Address Register)
  rect((1.5, -1.5), (3.7, -0.8), stroke: black,name: "DAR")
  content((2.6, -1.15), [DAR])
  line((1.2,6),(1.2,0),(2.6,0),"DAR",mark: (end: ">"))
  
  // Data Memory
  rect((1.5, -3.5), (3.7, -2.3), stroke: black, fill: gray.lighten(70%))
  content((2.6, -2.9), [数据存储器])
  content((4.5, -2.9), [DM])
  
  // DDR (Data Data Register)
  rect((1.5, -5.4), (3.7, -4.8), stroke: black)
  content((2.6, -5.05), [DDR])
  line((2,-5.4),(2,-5.7),(0.8,-5.7),(0.8,6), mark: (end: ">"))
  // Right Column - Data processing
  rect((2, 3), (3.6, 3.7), stroke: black, name: "AC1")
  content((2.8, 3.35), $"AC"_1$)
  line((2.8, 3.7),(2.8, 6),  mark: (end: ">"))
  line((1.5,6),(1.5,2.4),(2.5,2.4),(2.5,3), mark: (end: ">"))
  
  // ALU (as trapezoid-like shape)
  line((5.5, 1.5), (5.5, 3.6), (4.5, 3.3), (4.5, 1.8), close: true, fill: gray.lighten(90%), stroke: black)
  content((5, 2.5), [ALU])
  line((4.5,2.4),(3.3,2.4),(3.3,3),mark: (end: ">"))
    // ALU output
  line( (6, 6),(6, 3),(5.5,3), mark: (end: ">"))
  line((6, -6),(6, 2),(5.5,2),  mark: (end: ">"))
 
  // Connections - using arrows
  // R0-R3 connections to BUS1 (input)
  line((-7.5, 4.3), (-8.1, 4.3))
  line((-7.5, 3.5), (-8.1, 3.5))
  line((-7.5, 2.7), (-8.1, 2.7))
  line((-7.5, 1.9), (-8.1, 1.9))
  line((-8.1, 1.9), (-8.1, 6), mark: (end: "<"))
  
  // R0-R3 connections to BUS1 (output)
  line((-5.7, 4.3), (-5, 4.3))
  line((-5.7, 3.5), (-5, 3.5))
  line((-5.7, 2.7), (-5, 2.7))
  line((-5.7, 1.9), (-5, 1.9))
  line((-5, 1.9), (-5, 6), mark: (end: ">"))
  
  // IAR connections
  line((-6.4, 0.5), (-6.4, 0.2), mark: (end: ">"))
  line((-8.5,6),(-8.5,1),(-7.5,1), mark: (end: ">"))
  
  // IM to IDR
  line((-6.4, -1), (-6.4, -2.1), mark: (end: ">", start: ">"))
  
  // IDR to BUS2
  line((-6.4, -2.8), (-6.4, -6), mark: (end: ">", start: ">"))
  
  
  // AC0 connections
  line((-3.5, 6), (-3.5, 3.7),(-2, 3.7),(-2,4) , mark: (start: ">"))

})]