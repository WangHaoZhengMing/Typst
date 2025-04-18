#set text(font:"Songti SC")
#strong[大 作 业]

#strong[课 程 名 称：] #underline[Java程序设计实验]

#strong[专 业 班 级 ：];#underline[计算机科学与技术2301班]

#strong[学 生 姓 名 ：]

#strong[学 号 ：]

#strong[指 导 教 师 ：]

#outline()

= 需求分析
本项目实现了一个基于Java Swing的人事管理系统(HRMS)。系统的主要需求如下：

1. 员工信息管理
   - 基本信息管理：系统支持员工基本信息（ID、姓名）的增删改查操作
   - 工作信息管理：包括部门、职位等信息的维护
   - 薪资信息管理：支持员工薪资的记录和更新

2. 数据持久化需求
   - JSON文件存储：使用JSON格式文件持久化存储员工数据
   - 数据导入导出：支持从文件导入员工数据和导出数据到文件

3. 统计分析功能
   - 部门分布统计：统计各部门人员分布情况
   - 薪资统计分析：计算并展示平均薪资、最高薪资、最低薪资等指标

4. 用户界面需求
   - 图形化操作界面：使用Swing开发直观的图形用户界面
   - 表格化数据展示：使用JTable组件展示员工信息
   - 筛选和搜索：支持按部门筛选和薪资范围搜索

5. 系统性能需求
   - 实时响应：操作反馈及时，数据实时更新
   - 数据一致性：确保数据的完整性和一致性
   - 异常处理：完善的异常处理机制，提供友好的错误提示

= 概要设计
系统采用MVC架构模式，主要包含以下几个核心组件：

1. 模型层（Model）
   - Person类：抽象基类，定义人员的基本属性（ID、姓名）
   - Employee类：继承自Person类，添加部门、职位、薪资等特定属性

2. 数据访问层（DAO）
   - GenericDAO接口：定义通用的CRUD操作接口
   - DataPersistence接口：定义数据持久化相关操作
   - EmployeeDAO接口：扩展通用接口，添加特定的业务方法
   - EmployeeDAOImpl类：实现数据访问和持久化功能

3. 异常处理
   - HRMSException类：自定义异常类，处理业务异常

4. 视图层（View）
   - MainFrame类：主窗口界面，实现用户交互功能

= 运行环境
- 操作系统：Windows/macOS/Linux
- Java运行环境：JDK 11或更高版本
- 内存要求：最小2GB，推荐4GB
- 存储空间：50MB以上

= 开发工具和编程语言
1. 编程语言
   - Java SE 11

2. 开发工具
   - IDE：Visual Studio Code
   - 构建工具：Apache Maven 3.8.1
   - 版本控制：Git

3. 主要框架和库
   - GUI框架：Java Swing
   - JSON处理：Jackson 2.13.4
   - 项目管理：Maven

= 详细设计

== 核心类设计
系统的核心类设计如表1所示。

表1 核心类设计说明
#figure(
  align(center)[#table(
    columns: (20%, 80%),
    align: (left,left),
    [*类名*], [*主要功能和特点*],
    [Person], [- 抽象基类，实现Serializable接口
- 定义ID和姓名等基本属性
- 包含抽象方法getDisplayInfo()
- 重写equals()和hashCode()方法],
    [Employee], [- 继承自Person类
- 扩展部门、职位、薪资等属性
- 实现getDisplayInfo()方法
- 使用\@JsonIgnoreProperties注解支持JSON序列化],
    [HRMSException], [- 自定义异常类
- 定义多种异常类型和错误码
- 支持异常消息和原因链],
    [MainFrame], [- GUI主窗口类
- 实现用户界面和事件处理
- 封装了数据展示和用户交互逻辑]
  )]
)

== 接口设计
系统的接口设计采用了多层次的接口继承结构，如表2所示。

表2 接口设计说明
#figure(
  align(center)[#table(
    columns: (20%, 80%),
    align: (left,left),
    [*接口名*], [*主要功能和特点*],
    [GenericDAO], [- 泛型接口，定义基本CRUD操作
- 使用泛型参数支持不同实体类型
- 统一的异常处理机制],
    [DataPersistence], [- 定义数据持久化相关方法
- 支持文件导入导出功能
- 灵活的文件路径配置],
    [EmployeeDAO], [- 继承GenericDAO和DataPersistence接口
- 扩展员工特有的业务方法
- 提供统计分析功能]
  )]
)

== 数据访问层实现
EmployeeDAOImpl类是系统的核心实现类，其主要功能如表3所示。

表3 EmployeeDAOImpl实现细节
#figure(
  align(center)[#table(
    columns: (25%, 75%),
    align: (left,left),
    [*功能模块*], [*实现细节*],
    [数据存储], [- 使用HashMap存储员工数据
- 提供内存缓存和文件持久化
- 支持JSON格式的序列化和反序列化],
    [CRUD操作], [- 实现增删改查基本操作
- 包含完整的参数验证
- 自动保存数据到文件],
    [高级查询], [- 支持按部门和薪资范围查询
- 使用Stream API实现高效过滤
- 返回符合条件的员工列表],
    [统计分析], [- 计算部门人员分布
- 统计薪资相关指标
- 使用Stream API进行数据聚合]
  )]
)

== 异常处理机制
系统定义了统一的异常处理机制，主要异常类型如表4所示。

表4 异常类型说明
#figure(
  align(center)[#table(
    columns: (20%, 15%, 65%),
    align: (left,center,left),
    [*异常类型*], [*错误码*], [*说明*],
    [文件异常], [1001-1003], [- 文件未找到(1001)
- IO操作失败(1002)
- JSON解析错误(1003)],
    [业务异常], [2001-2002], [- 员工ID重复(2001)
- 员工不存在(2002)],
    [验证异常], [3001], [- 输入数据验证失败
- 包括必填字段和数据格式验证]
  )]
)

== 用户界面设计
系统采用Swing框架实现图形用户界面，主要组件如表5所示。

表5 界面组件说明
#figure(
  align(center)[#table(
    columns: (20%, 80%),
    align: (left,left),
    [*组件类型*], [*功能描述*],
    [输入面板], [- 包含ID、姓名、部门等输入字段
- 实现表单验证和数据收集],
    [数据表格], [- 使用JTable展示员工列表
- 支持选择和编辑功能],
    [工具栏], [- 提供增删改查等基本操作按钮
- 包含导入导出和统计功能],
    [筛选面板], [- 支持按部门筛选
- 实现薪资范围搜索功能]
  )]
)

= 系统设计图

== 类图
#align(center)[图1展示了系统的核心类结构。]

#import "@preview/cetz:0.3.4"
#figure(
  cetz.canvas({
    import cetz.draw: *
    
    // 设置Apple风格的颜色
    let class-fill = rgb(255, 255, 255)  // 纯白背景
    let abstract-fill = rgb(250, 250, 250)  // 浅灰白背景
    let border-color = rgb(200, 200, 200)  // 浅灰色边框
    let text-color = rgb(51, 51, 51)  // 深灰色文字
    let accent-color = rgb(0, 122, 255)  // Apple蓝
    
    // Person抽象类
    rect((-2,0), (4,4), stroke: border-color, fill: abstract-fill, radius: 0.2)
    rect((-2,3.2), (4,4), stroke: none, fill: abstract-fill, radius: (top-left: 0.2, top-right: 0.2))
    content((1,3.6), text(fill: accent-color, weight: "bold")[\<abstract> Person])
    line((-2,3.2), (4,3.2), stroke: border-color)
    content((-2,1.5), (4,3), text(fill: text-color)[
```java
    id: String
    name: String
      getDisplayInfo(): String
      equals(Object): boolean
      hashCode(): int```])
    
    // Employee类 - 增加高度
    rect((6,-0.5), (10,5), stroke: border-color, fill: class-fill, radius: 0.2)  // 高度从4增加到5
    rect((6,4.2), (10,5), stroke: none, fill: class-fill, radius: (top-left: 0.2, top-right: 0.2))  // 调整标题区域位置
    content((8,4.6), text(fill: accent-color, weight: "bold")[Employee])  // 调整标题位置
    line((6,4.2), (10,4.2), stroke: border-color)  // 调整分隔线位置
    content((6,1), (10,4), text(fill: text-color)[
     ```java
     department: String
     position: String
     salary: double
        getDisplayInfo()
        getDepartment()
        getSalary()```
     ])  // 增加内容区域高度
    
    // 继承关系
    line((4,2), (6,2.5), stroke: accent-color, arrow: "->")  // 调整箭头位置
    content((4.7,2.8), text(style: "italic", fill: accent-color)[extends])
    
    // 添加注释
    // rect((-2,-1), (2,0), stroke: border-color, fill: rgb(250, 250, 250), radius: 0.2)
    // content((-2,-1), (2,0), text(style: "italic", fill: text-color)[Implements Serializable])
    // line((1,-0.2), (2,0), stroke: accent-color, arrow: "->")
    }),
    caption: "核心类图（UML表示）"
    )

 
图2展示了系统的接口继承结构。

#figure(
  cetz.canvas({
    import cetz.draw: *
    
    // 设置Apple风格的颜色
    let interface-fill = rgb(250, 250, 250)  // 浅灰白背景
    let class-fill = rgb(255, 255, 255)      // 纯白背景
    let border-color = rgb(200, 200, 200)    // 浅灰色边框
    let text-color = rgb(51, 51, 51)         // 深灰色文字
    let accent-color = rgb(0, 122, 255)      // Apple蓝
    
    // GenericDAO接口
    rect((0,6), (4,9), stroke: border-color, fill: interface-fill, radius: 0.2)
    content((2,8.5), text(fill: accent-color, weight: "bold")[GenericDAO\<T,K>])
    content((0,6), (4,8), text(fill: text-color)[+ 􀣘 add(T)
+ 􀈻 update(T)
+ 􀆜 delete(K)
+ 􀭥 getById(K): T])
    
    // DataPersistence接口
    rect((6,6), (10,9), stroke: border-color, fill: interface-fill, radius: 0.2)
    content((8,8.5),  text(fill: accent-color, weight: "bold")[DataPersistence])
    content((6,6), (10,8), text(fill: text-color)[+ 􀈅 saveToFile(String)
+ 􀫷 loadFromFile
+ 􀈨 importFromFile])
    
    // EmployeeDAO接口
    rect((3,2), (7,5), stroke: border-color, fill: interface-fill, radius: 0.2)
    content((5,4.5), text(fill: accent-color, weight: "bold")[EmployeeDAO])
    content((3,2), (7,4), text(fill: text-color)[+ findByDepartment()
+ findBySalaryRange()
+ getEmployeeCount()
+ getStats()])
    
    // EmployeeDAOImpl类
    rect((3,-1), (7,1), stroke: border-color, fill: class-fill, radius: 0.2)
    content((5,0.5),text(fill: accent-color, weight: "bold")[EmployeeDAOImpl])
    content((3,-1), (7,0), text(fill: text-color)[ Implementation])
    
    // 继承和实现关系
    line((2,6), (4,5), stroke: accent-color)
    line((8,6), (6,5), stroke: accent-color)
    line((5,2), (5,1), stroke: accent-color, arrow: "->")
    content((3,5.5), text(style: "italic", fill: accent-color)[extends])
    content((7,5.5), text(style: "italic", fill: accent-color)[extends])
    content((6,1.5), text(style: "italic", fill: accent-color)[implements])
  }),
  caption: "接口继承结构图"
)

== 系统架构图
图3展示了系统的整体架构。

#figure(
  cetz.canvas({
    import cetz.draw: *
    
    // 设置Apple风格的颜色
    let layer-fill = rgb(255, 255, 255)    // 纯白背景
    let border-color = rgb(200, 200, 200)  // 浅灰色边框
    let text-color = rgb(51, 51, 51)       // 深灰色文字
    let accent-color = rgb(0, 122, 255)    // Apple蓝
    
    // 视图层
    rect((-4,4), (4,6), stroke: border-color, fill: layer-fill, radius: 0.3)
    content((-2,4.7), (4,5.3), text(fill: text-color, weight: "bold")[􀾩 View Layer (MainFrame)])
  
    
    // 业务逻辑层
    rect((-4,1), (4,3), stroke: border-color, fill: layer-fill, radius: 0.3)
    content((0,2), text(fill: text-color, weight: "bold")[􁗢 Business Layer (EmployeeDAO)])

    
    // 数据访问层
    rect((-4,-2), (4,0), stroke: border-color, fill: layer-fill, radius: 0.3)
    content((0,-1), text(fill: text-color, weight: "bold")[􀩭 Data Access Layer (EmployeeDAOImpl)])

    
    // 数据存储
    rect((-3,-5), (3,-3), stroke: border-color, fill: layer-fill, radius: 0.3)
    content((0,-4), text(fill: text-color, weight: "bold")[􀫷 Data Storage (JSON Files)])

    
    // 连接线和箭头
    line((-2,4), (-2,3), stroke: accent-color, dash: "dotted", arrow: "->")
    line((2,3), (2,4), stroke: accent-color, dash: "dotted", arrow: "->")
    line((0,1), (0,0), stroke: accent-color, arrow: "->")
    line((0,-2), (0,-3), stroke: accent-color, arrow: "->")
    
    // 标注
    content((-3,3.5), text(fill: accent-color)[请求])
    content((3,3.5), text(fill: accent-color)[响应])
    content((0.5,0.5), text(fill: accent-color)[数据访问])
    content((0.5,-2.5), text(fill: accent-color)[持久化])
    }),
    caption: "系统架构图"
  )

== 数据流程图
图4展示了系统的主要数据流程。

#figure(
  cetz.canvas({
    import cetz.draw: *
    
    // Apple风格颜色定义
    let bg-color = rgb(255, 255, 255)     // 纯白背景
    let border-color = rgb(200, 200, 200) // 浅灰边框
    let text-color = rgb(51, 51, 51)      // 深灰文字
    let accent-color = rgb(0, 122, 255)   // Apple蓝
    
    // 用户操作
    circle((0,8), radius: 1, stroke: border-color, fill: bg-color)
    content((0,8), text(fill: text-color)[􀉪 用户操作])
    
    // 数据验证
    rect((-2,5), (2,6), stroke: border-color, fill: bg-color, radius: 0.3)
    content((0,5.5), text(fill: text-color)[􀤃 数据验证])
    
    // 业务处理
    rect((-2,2), (2,3), stroke: border-color, fill: bg-color, radius: 0.3)
    content((0,2.5), text(fill: text-color)[􁎕 业务处理])
    
    // 数据持久化
    rect((-2,-1), (2,0), stroke: border-color, fill: bg-color, radius: 0.3)
    content((0,-0.5), text(fill: text-color)[􁗫 数据持久化])
    
    // JSON文件
    rect((-1.5,-4), (1.5,-3), stroke: border-color, fill: bg-color, radius: 0.3)
    content((0,-3.5), text(fill: text-color)[􀉀 JSON文件])
    
    // 数据流向
    line((0,7), (0,6), stroke: accent-color, arrow: ">")
    line((0,5), (0,3), stroke: accent-color, arrow: ">")
    line((0,2), (0,0), stroke: accent-color, arrow: ">")
    line((0,-1), (0,-3), stroke: accent-color, arrow: ">")
    
    // 错误处理
    rect((3,2), (6,3), stroke: border-color, fill: bg-color, radius: 0.3)
    content((4.5,2.5), text(fill: text-color)[􁷧 异常处理])
    line((2,2.5), (3,2.5), stroke: accent-color, )
    line((4.5,3), (4.5,8), stroke: accent-color, arrow: ">")
    line((4.5,8), (1,8), stroke: accent-color, arrow: ">")
  }),
  caption: "数据流程图"
)
 
= 调试分析

== 主要问题及解决方案
在开发过程中遇到的主要问题和解决方案如表6所示。

表6 问题及解决方案
#figure(
  align(center)[#table(
    columns: (30%, 70%),
    align: (left,left),
    [*问题*], [*解决方案*],
    [数据持久化问题], [- 采用Jackson框架处理JSON序列化
- 实现自动保存机制
- 添加文件操作异常处理],
    [并发访问问题], [- 使用同步机制保护共享资源
- 实现线程安全的数据访问
- 优化锁的粒度],
    [内存性能问题], [- 使用HashMap优化查询性能
- 实现数据懒加载机制
- 及时释放无用对象],
    [用户体验问题], [- 添加友好的错误提示
- 实现实时数据更新
- 优化界面响应速度]
  )]
)

= 运行结果

== 基本功能演示
系统主要功能的运行效果如下：

1. 员工管理界面
插入运行截图

2. 数据统计分析
插入统计图表截图

3. 导入导出功能
插入操作截图

#strong[总结]

本项目开发的人事信息管理系统(HRMS)是一个功能完整、结构清晰的Java应用程序。在开发过程中，我们严格遵循了面向对象的设计原则，充分运用了Java语言的特性，实现了一个具有实用价值的管理系统。主要特点如下：

1. 架构设计
   - 采用MVC设计模式，实现了业务逻辑和界面显示的分离
   - 使用DAO模式和接口编程，提高了代码的可维护性和可扩展性
   - 实现了统一的异常处理机制，提高了系统的健壮性

2. 技术运用
   - 使用Java Swing开发直观的图形用户界面
   - 采用Jackson框架处理JSON数据序列化
   - 运用Stream API进行高效的数据处理和统计分析

3. 项目亮点
   - 完善的异常处理和错误提示机制
   - 灵活的数据导入导出功能
   - 强大的统计分析功能
   - 人性化的用户界面设计

4. 改进方向
   - 引入数据库支持更大规模的数据存储
   - 添加用户权限管理功能
   - 优化界面布局和交互体验
   - 增加数据备份和恢复功能

通过本项目的开发，不仅巩固了Java编程的基础知识，也深入理解了软件工程的设计思想和开发方法，为今后的学习和工作打下了良好的基础。

参考文献

[1] 耿祥义. Java 2实用教程(第5版)[M]. 清华大学出版社, 2017

[2] Bruce Eckel. Java编程思想(第4版)[M]. 机械工业出版社, 2007

[3] 夏成. Java Swing开发从入门到精通[M]. 清华大学出版社, 2019

[4] Oracle. Java™ Platform, Standard Edition 11 API Specification[EB/OL]. https://docs.oracle.com/en/java/javase/11/docs/api/

[5] Jackson Project. FasterXML/jackson Documentation[EB/OL]. https://github.com/FasterXML/jackson

#strong[总结]

×××××××××（小4号宋体，1.5倍行距）××××××××××××××××××××………

参考文献（小三黑体，另起一页）

在“大作业报告”的最后应附上所参考的相关文献。

参考文献格式如下：(\[1\]书籍 \[2\] 文章例)

\[1\] 耿祥义.Java 2实用教程(第5版)\[M\]. 清华大学出版社,2017

其他自己补充

注意，大作业报告中使用到的图、表必须有名字，有标号，居中。正文中表格与插图的字体一律用5号宋体。图名在图的下方，譬如：“程序运行结果如图1所示。”

图1 ×××××××××(宋体，五号)

表名在表的上方，譬如：“XXXX如表1所示。”

表1 ×××××××××(宋体，五号)

#figure(
  align(center)[#table(
    columns: (33.33%, 33.34%, 33.34%),
    align: (auto,auto,auto,),
    [], [], [],
    [], [], [],
    [], [], [],
  )]
  , kind: table
  )

提交内容：

#block[
#set enum(numbering: "1.", start: 1)
+ 大作业报告打印版一份（待定！）。

+ 电子版（学习通上传）：程序源代码，大作业报告、视频介绍。
]