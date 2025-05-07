#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#set page(width: auto, height: 20cm, margin: 5mm, fill: white)

// #diagram(
// 	spacing: (18mm, 10mm),
// 	node-stroke: luma(80%),
// 	node((0.5,0), [*Diagram*], name: <d>),
// 	node((0,1), [*Node*], name: <n>),
// 	node((1,1), [*Edge*], name: <e>),

// 	edge(<d>, ((), "|-", (0,0.5)), ((), "-|", <n>), <n>, "1!-n!"),
// 	edge(<d>, ((), "|-", (0,0.5)), ((), "-|", <e>), <e>, "1!-n?"),


// 	edge("1!-n?"),

// 	node((1,2), [*Mark*], name: <m>),

// 	edge(<e>, "-|>", <n>, stroke: teal, label: text(teal)[snap], left),

// 	edge((rel: (-15pt, 0pt), to: <n>), <d>, "-|>", bend: 40deg, stroke: orange, text(orange)[layout], label-angle: auto)
// )


<图二>
#diagram(
  spacing: (18mm, 10mm),
  node-stroke: luma(80%),
  
  node((0,0), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[垃圾分类系统]]], name: <root>),
  node((-2,1), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[用户模块]]], name: <user>),
  node((-4,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[首页]]], name: <home>),
  node((-5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[轮播图浏览]]], name: <carousel>),
  node((-4.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[垃圾搜索识别]]], name: <search>),
  node((-4,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分类常识查看]]], name: <know>),
  node((-3.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[站点定位导航]]], name: <nav>),
  node((-3,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[AI智能问询]]], name: <ai>),
  node((-2.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分类资讯大全]]], name: <info>),
  node((-2,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[图谱指南下载]]], name: <guide>),
  node((-2.5,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分类]]], name: <class>),
  node((-1.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分类词库浏览]]], name: <vocab-browse>),
  node((-1,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[垃圾词库搜索]]], name: <vocab-search>),
  node((-1,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[测试]]], name: <test>),
  node((0,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分类知识竞赛]]], name: <contest>),
  node((0.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[答题结果查看]]], name: <result>),
  node((1,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[答题记录]]], name: <record>),
  node((0,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[我的]]], name: <my>),
  node((1.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[登录授权]]], name: <auth>),
  node((2,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[改进建议]]], name: <suggest>),
  node((2.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[咨询客服]]], name: <service>),
  node((3,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[关于我们]]], name: <about>),
  node((2,1), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[管理员模块]]], name: <admin>),
  node((1,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[首页]]], name: <admin-home>),
  node((3.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[数据分析查看]]], name: <data>),
  node((4,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[分享应用]]], name: <share>),
  node((2,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[系统管理]]], name: <sys>),
  node((4.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[角色管理]]], name: <role>),
  node((5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[用户管理]]], name: <user-manage>),
  node((5.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[菜单管理]]], name: <menu>),
  node((6,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[字典管理]]], name: <dict>),
  node((6.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[通知公告]]], name: <notice>),
  node((3,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[日志管理]]], name: <log>),
  node((7,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[登录日志管理]]], name: <login-log>),
  node((7.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[操作日志管理]]], name: <op-log>),
  node((8,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[短信日志管理]]], name: <sms-log>),
  node((4,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[垃圾分类管理]]], name: <garbage>),
  node((8.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[题库管理]]], name: <question>),
  node((9,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[轮播图管理]]], name: <carousel-manage>),
  node((5,2), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[垃圾识别管理]]], name: <recog>),
  node((9.5,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[图像识别管理]]], name: <img-recog>),
  node((10,3), [#place(dy:39pt,dx:-5pt)[#box(stroke: 0.5pt, width: 10pt,height:95pt)[语音识别管理]]], name: <voice-recog>),

  // Connect all nodes with edges
  edge(<root>, <user>),
  edge(<root>, <admin>),
  
  // User module edges
  edge(<user>, <home>),
  edge(<home>, <carousel>),
  edge(<home>, <search>),
  edge(<home>, <know>),
  edge(<home>, <nav>),
  edge(<home>, <ai>),
  edge(<home>, <info>),
  edge(<home>, <guide>),
  edge(<user>, <class>),
  edge(<class>, <vocab-browse>),
  edge(<class>, <vocab-search>),
  edge(<user>, <test>),
  edge(<test>, <contest>),
  edge(<test>, <result>),
  edge(<test>, <record>),
  edge(<user>, <my>),
  edge(<my>, <auth>),
  edge(<my>, <suggest>),
  edge(<my>, <service>),
  edge(<my>, <about>),
  
  // Admin module edges
  edge(<admin>, <admin-home>),
  edge(<admin-home>, <data>),
  edge(<admin-home>, <share>),
  edge(<admin>, <sys>),
  edge(<sys>, <role>),
  edge(<sys>, <user-manage>),
  edge(<sys>, <menu>),
  edge(<sys>, <dict>),
  edge(<sys>, <notice>),
  edge(<admin>, <log>),
  edge(<log>, <login-log>),
  edge(<log>, <op-log>),
  edge(<log>, <sms-log>),
  edge(<admin>, <garbage>),
  edge(<garbage>, <question>),
  edge(<garbage>, <carousel-manage>),
  edge(<admin>, <recog>),
  edge(<recog>, <img-recog>),
  edge(<recog>, <voice-recog>)
)



)
