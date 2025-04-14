// #box(image("haut.jpg", height: 0.54167in, width: 2.74375in))
// #set text(font:"Songti SC")

// #strong[大 作 业]

// #strong[课 程 名 称：] #underline[Java程序设计实验]

// #strong[专 业 班 级 ：];#underline[计算机科学与技术2301班]

// #strong[学 生 姓 名 ：王浩然]

// #strong[学 号 ：231040100116]

// #strong[指 导 教 师 ：赵晨阳]


= 
#set heading(numbering: "1.")
#set text(size: 10.5pt)
#set par(leading: 1.5em)

#heading(level: 1)[需求分析]

本次大作业要求设计并实现一个"企业人事信息管理系统"，该系统旨在帮助企业高效管理员工信息、部门结构、薪资考核等相关数据。系统需要满足以下功能需求：

1. 员工信息管理：支持员工信息的添加、删除、修改和查询功能，包括员工的基本信息（如姓名、性别、年龄、联系方式等）和工作信息（如职位、部门、入职日期等）。

2. 部门信息管理：提供部门信息的增删改查功能，包括部门名称、部门经理、部门职责等信息的管理。

3. 薪资管理：记录并计算员工薪资，包括基本工资、奖金、加班工资、考勤等信息。

4. 用户界面设计：设计友好的图形用户界面，提供直观的操作方式。

从面向对象的程序设计角度，系统需要实现类的封装性、继承性和多态性，并综合运用抽象类、接口、异常处理、IO流等Java技术。同时，系统还需要具备数据持久化功能，支持将员工和部门信息保存至文件并能够从文件中加载数据。

#heading(level: 1)[概要设计]

根据需求分析，"企业人事信息管理系统"的概要设计如下：

== 系统架构

系统采用三层架构设计：
1. 表示层：负责用户界面的显示和交互，包括主界面、员工管理界面、部门管理界面和薪资管理界面等。
2. 业务逻辑层：处理系统的核心业务逻辑，如员工信息处理、部门信息处理、薪资计算等。
3. 数据访问层：负责数据的读写操作，包括文件读写操作。

== 类设计

系统的核心类设计如图1所示：

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [系统核心类结构图（示意）]
  )],
  caption: [系统核心类结构图],
  kind: table,
  supplement: "表"
) <class-diagram>

核心类说明：

1. `Person`抽象类：定义人员的基本属性和方法，如姓名、性别、年龄等。
2. `Employee`类：继承自`Person`类，增加员工特有属性，如工号、职位、基本工资等。
3. `Manager`类：继承自`Employee`类，增加管理者特有属性，如管理部门、管理职责等。
4. `Department`类：部门类，包含部门编号、名称、描述等属性，以及与员工的关联关系。
5. `Salary`接口：定义薪资计算的方法。
6. `RegularSalary`类和`ManagerSalary`类：实现`Salary`接口，分别计算普通员工和管理者的薪资。
7. `FileOperation`类：负责文件读写操作，实现数据持久化。
8. `HRSystemGUI`类：系统的图形用户界面类，负责界面展示和用户交互。

#heading(level: 1)[运行环境（软、硬件环境）]

== 硬件环境

- 处理器：Intel Core i5 或 AMD Ryzen 5 及以上
- 内存：8GB 及以上
- 硬盘空间：至少 1GB 可用空间
- 显示器：分辨率 1366 × 768 或更高

== 软件环境

- 操作系统：Windows 10/11、macOS 11.0 或更高版本、Linux (Ubuntu 20.04 或更高版本)
- Java 运行环境：JDK 17 或更高版本
- 其他依赖：无需额外依赖库，使用Java标准库

#heading(level: 1)[开发工具和编程语言]

== 编程语言
- Java SE 17

== 开发工具
- 集成开发环境：IntelliJ IDEA 2023.1 社区版
- 版本控制：Git 2.40.0
- 文档工具：Microsoft Office 2021 / WPS Office 2023

== 开发框架与库
- Java Swing：用于构建图形用户界面
- Java AWT：提供基础图形组件
- Java I/O：实现文件读写功能
- Java Collection Framework：用于数据结构的管理和操作
- Java Exception Handling：实现异常处理机制

#heading(level: 1)[详细设计]

== 核心类实现

=== Person 抽象类

```java
public abstract class Person {
    private String id;        // 唯一标识符
    private String name;      // 姓名
    private String gender;    // 性别
    private int age;          // 年龄
    private String phone;     // 电话
    private String email;     // 邮箱
    
    // 构造方法、getter和setter方法
    
    // 抽象方法，子类必须实现
    public abstract String getType();
    
    // toString方法用于信息展示
    @Override
    public String toString() {
        return "ID: " + id + ", 姓名: " + name + ", 性别: " + gender + 
               ", 年龄: " + age + ", 联系电话: " + phone + ", 邮箱: " + email;
    }
}
```

=== Employee 类
```java
public class Employee extends Person {
    private String employeeId;  // 工号
    private String position;    // 职位
    private String department;  // 所属部门
    private Date hireDate;      // 入职日期
    private double baseSalary;  // 基本工资
    
    // 构造方法、getter和setter方法
    
    @Override
    public String getType() {
        return "员工";
    }
    
    // 计算工龄
    public int calculateYearsOfService() {
        // 实现工龄计算逻辑
    }
}
```

== 异常处理设计

系统使用自定义异常类处理业务异常：

```java
public class EmployeeNotFoundException extends Exception {
    public EmployeeNotFoundException(String message) {
        super(message);
    }
}

public class DepartmentNotFoundException extends Exception {
    public DepartmentNotFoundException(String message) {
        super(message);
    }
}

public class InvalidDataException extends Exception {
    public InvalidDataException(String message) {
        super(message);
    }
}
```

== 文件操作设计

系统使用序列化机制将对象数据保存到文件中，并在需要时加载：

```java
public class FileOperation {
    // 保存员工数据
    public static void saveEmployees(List<Employee> employees, String fileName) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(
                new FileOutputStream(fileName))) {
            oos.writeObject(employees);
        }
    }
    
    // 加载员工数据
    @SuppressWarnings("unchecked")
    public static List<Employee> loadEmployees(String fileName) throws IOException, ClassNotFoundException {
        try (ObjectInputStream ois = new ObjectInputStream(
                new FileInputStream(fileName))) {
            return (List<Employee>) ois.readObject();
        }
    }
    
    // 类似方法用于部门数据的保存与加载
}
```

== 用户界面设计

系统使用Java Swing框架实现图形用户界面，主界面结构如图2所示：

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [系统主界面布局图（示意）]
  )],
  caption: [系统主界面布局图],
  kind: table,
  supplement: "表"
) <main-interface>

界面主要包括以下组件：
- 菜单栏：提供系统各功能入口
- 工具栏：快捷操作按钮
- 信息展示面板：以表格形式展示员工或部门信息
- 状态栏：显示系统状态和操作提示

#heading(level: 1)[调试分析]

== 遇到的主要问题及解决方案

=== 1. 文件读写异常

在实现数据持久化功能时，遇到了文件读写异常问题。

**问题描述**：当系统尝试将员工信息写入文件时，出现了`FileNotFoundException`和`IOException`异常，导致数据无法正常保存。

**解决方法**：
- 使用`try-with-resources`语句确保流对象正确关闭
- 在文件操作前检查文件路径是否存在，若不存在则创建对应目录
- 增加文件访问权限检查，确保应用程序有足够权限
- 优化异常处理流程，添加详细的错误信息记录

```java
try {
    File directory = new File("data");
    if (!directory.exists()) {
        directory.mkdirs();
    }
    
    try (ObjectOutputStream oos = new ObjectOutputStream(
            new FileOutputStream("data/employees.dat"))) {
        oos.writeObject(employees);
    }
} catch (IOException e) {
    logger.severe("保存员工数据失败: " + e.getMessage());
    JOptionPane.showMessageDialog(null, "无法保存数据：" + e.getMessage(), 
                                 "错误", JOptionPane.ERROR_MESSAGE);
}
```

=== 2. UI事件处理线程安全问题

**问题描述**：在多线程环境下，UI更新操作导致了`ConcurrentModificationException`异常，界面出现闪烁和无响应情况。

**解决方法**：
- 使用`SwingUtilities.invokeLater()`方法确保UI更新操作在EDT(Event Dispatch Thread)线程上执行
- 实现数据模型与视图分离，采用MVC设计模式
- 使用线程安全集合类，如`CopyOnWriteArrayList`存储员工信息

```java
public void refreshEmployeeTable() {
    SwingUtilities.invokeLater(() -> {
        tableModel.setRowCount(0);
        for (Employee emp : employees) {
            tableModel.addRow(new Object[]{
                emp.getEmployeeId(), 
                emp.getName(),
                emp.getPosition(),
                emp.getDepartment(),
                emp.getBaseSalary()
            });
        }
    });
}
```

=== 3. 数据验证与异常处理

**问题描述**：用户输入的员工信息可能包含无效数据，如空字段、格式错误的电子邮件或电话号码，导致系统异常。

**解决方法**：
- 实现输入验证机制，检查必填字段和数据格式
- 设计自定义异常类处理业务逻辑异常
- 使用正则表达式验证输入格式
- 添加友好的错误提示，引导用户正确输入

== 系统改进设想

1. **性能优化**：对大量数据处理时的性能进行优化，引入数据分页加载机制。
2. **数据库集成**：将文件存储替换为关系型数据库存储，提高数据的安全性和可靠性。
3. **高级搜索功能**：实现高级搜索和筛选功能，支持多条件组合查询。
4. **权限管理**：增加用户角色和权限管理，适应不同级别用户的需求。
5. **报表导出**：添加报表生成和导出功能，支持PDF、Excel等格式。
6. **国际化支持**：添加多语言支持，使系统适应国际化需求。

#heading(level: 1)[运行结果]

系统主要功能的运行结果如下：

=== 1. 系统登录界面

系统启动后首先展示登录界面，用户需要输入用户名和密码进行验证，如图3所示。

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [系统登录界面截图位置]
  )],
  caption: [系统登录界面],
  kind: table,
  supplement: "表"
) <login-interface>

=== 2. 系统主界面

登录成功后进入系统主界面，左侧为功能导航菜单，右侧为信息展示区域，如图4所示。

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [系统主界面截图位置]
  )],
  caption: [系统主界面],
  kind: table,
  supplement: "表"
) <main-screen>

=== 3. 员工信息管理

员工信息管理界面提供员工信息的增删改查功能，如图5所示。

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [员工信息管理界面截图位置]
  )],
  caption: [员工信息管理界面],
  kind: table,
  supplement: "表"
) <employee-management>

=== 4. 部门信息管理

部门信息管理界面提供部门信息的增删改查功能，如图6所示。

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [部门信息管理界面截图位置]
  )],
  caption: [部门信息管理界面],
  kind: table,
  supplement: "表"
) <department-management>

=== 5. 薪资管理

薪资管理界面提供员工薪资的计算和查询功能，如图7所示。

#figure(
  align(center)[#table(
    columns: (auto,),
    align: (center,),
    [薪资管理界面截图位置]
  )],
  caption: [薪资管理界面],
  kind: table,
  supplement: "表"
) <salary-management>

#pagebreak()
#strong[总结]

本次Java程序设计实验大作业，我完成了一个功能完善的"企业人事信息管理系统"。通过这个项目，我深入学习和实践了Java面向对象编程的核心概念和技术，包括类的继承与多态、抽象类和接口的使用、异常处理机制、Java IO操作以及Swing图形界面设计。

在系统设计和实现过程中，我特别注重以下几个方面：

1. **面向对象设计**：系统采用了合理的类层次结构，通过继承实现代码复用，通过多态实现灵活的业务处理。`Person`抽象类作为基类，派生出`Employee`、`Manager`等子类，体现了IS-A关系；同时使用组合关系表示部门与员工的关联，体现了HAS-A关系。

2. **接口与抽象**：使用接口定义行为契约，如`Salary`接口定义了薪资计算行为；使用抽象类提供基础实现，如`Person`抽象类提供了人员基本信息的处理逻辑。这种设计提高了代码的可扩展性和可维护性。

3. **异常处理**：通过自定义异常类和完善的异常处理机制，确保系统在各种异常情况下能够优雅地处理和恢复，提高了系统的健壮性。

4. **文件操作**：实现了基于Java IO的数据持久化功能，使系统能够保存和加载数据，满足数据持久化需求。

5. **图形界面设计**：使用Java Swing框架设计了直观、友好的用户界面，提供了良好的用户体验。

通过这次大作业，我不仅巩固了课堂上学习的Java编程知识，还提升了独立分析问题、解决问题的能力。在实现过程中，我遇到并克服了多种技术难题，如线程安全问题、文件操作异常处理、UI设计优化等，这些经验对我今后的学习和实践都有很大帮助。

未来，我希望能够继续深入学习Java高级特性和企业级开发技术，如并发编程、网络编程、数据库访问等，为构建更加复杂和高效的应用系统打下基础。

#pagebreak()
#heading(level: 1, numbering: none)[参考文献]

\[1\] 耿祥义.Java 2实用教程(第5版)\[M\]. 清华大学出版社,2017

\[2\] Bruce Eckel. Thinking in Java (4th Edition)\[M\]. Prentice Hall, 2006

\[3\] Joshua Bloch. Effective Java (3rd Edition)\[M\]. Addison-Wesley Professional, 2018

\[4\] Herbert Schildt. Java: The Complete Reference (11th Edition)\[M\]. McGraw-Hill Education, 2019

\[5\] Craig Larman. Applying UML and Patterns: An Introduction to Object-Oriented Analysis and Design and Iterative Development (3rd Edition)\[M\]. Prentice Hall, 2004

\[6\] Java Swing Tutorial - JavaTpoint\[EB/OL\]. https://www.javatpoint.com/java-swing, 2023-09-15

\[7\] Oracle. Java Documentation - Serializable Objects\[EB/OL\]. https://docs.oracle.com/javase/8/docs/platform/serialization/spec/serial-arch.html, 2023-10-10

\[8\] Oracle. Java SE Tutorial - The Java Collections Framework\[EB/OL\]. https://docs.oracle.com/javase/tutorial/collections/index.html, 2023-09-20