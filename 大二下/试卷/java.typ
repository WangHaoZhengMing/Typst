
#set document(title: "2024-2025年《JAVA程序设计》期末试题库")
#set heading(numbering: "一、")
#set text(font: "PingFang SC")

//这个是选择题要用的横线 (Prompt example, not used in this specific paper's format)
// #let uline(answer: "", width: 4em) = {
//  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
// } 
// Code block styling
// #show raw: code => {
//   block(
//     width: 100%,
//     inset: 1em, // Reduced inset slightly
//     fill: rgb("#F6F8FA"),
//     radius: 4pt, // Reduced radius slightly
//   )[
//     #box(height: 1.2em, { // Use a box for alignment
//       text(size: 10pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
//       text(size: 10pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
//       text(size: 10pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
//     })
//     #text(size: 9pt, font: "SF Mono")[#code] // Slightly smaller code font
//   ]
// }


#align(left)[#text(font: "Heiti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[$2024-2025$ 年《Java 程序设计》期末试题库]])
// Removed the probability title, using the one from the paper
// #align(center)[#text(size: 1.8em, font: "Heiti SC")[概率论与数理统计]]
#v(1em) // Add some space

#text(font:"Heiti SC")[注意事项]：
#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答题卡上所粘贴的条形码上的姓名、准考证号与您本人是否相符。 // Corrected typo "答上" to "答题卡上" based on context
#v(1em)

= 选择题 (共15题, 每题1分, 共15分)

#set enum(indent: 0.5cm, numbering: "1.")

+ 下列选项中, ( ) 是正确的 float 变量的声明。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. `float f = 1;`], [B. `float f = 1.0;`], [C. `float f = 2e1;`], [D. `float f = 2.3d;`],
  )

+ 兼容性是 Java 语言的优势, 能做到这点是因为 Java 在操作系统的基础上提供了一个 Java 运行环境 ( ), 该环境由 Java 虚拟机 ( )、类库以及一些核心文件组成。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. JRE、JVM], [B. JVM、JRE], [C. JDK、JRE], [D. JRE、JDK],
  )

+ 下列叙述中不正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 5pt, // Reduced gutter slightly
    [A. 如果类里定义了一个或多个构造方法, 那么 Java 编译器不提供默认的构造方法。],
    [B. 同一个类创建的不同对象具有不同的实体。],
    [C. 不可以用一个类的对象访问类变量, 只能用类名访问类变量。],
    [D. 一个类的实例方法可以调用类中的其他实例方法和类方法。],
  )

+ 下列叙述中正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 可以用 protected 修饰一个类。],
    [B. protected 的访问权限低于友好的访问权限。],
    [C. byte 是一个基本的数据类型, 而 Byte 是一个类。],
    [D. 对象数组中每个空间存储的是对象的实体。],
  )

+ Java 语言中关于使用接口以下哪个说法正确? ( )
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 一个类只能实现一个接口。],
    [B. 一个非抽象类实现一个接口必须实现接口的所有方法。],
    [C. 接口之间不能继承。],
    [D. 接口和抽象类是同一回事。],
  )

+ 对于如下类, 下列叙述中正确的选项是 ( )
  ```java
  public class Test {
      int x;
      Test() {
      }
      Test(int x) {
      }
      void Test() {
      }
      int Test(int m) {
          x = m;
          return x;
      }
  }
  ```
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 编译错误。],
    [B. 类中有 2 个构造方法, 2 个重载方法。], // Note: The void Test() and int Test(int m) are methods, not constructors. The question likely refers to the constructors Test() and Test(int x), and perhaps considers the methods Test() and Test(int m) as overloaded. Let's keep the option as written.
    [C. 类中没有重载方法。],
    [D. 类中没有构造方法。],
  )

+ 关于成员变量, 下列哪个叙述是正确的? ( )
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 成员变量的名字不可以和局部变量的名字相同。],
    [B. 方法的参数的名字可以和方法中声明的局部变量的名字相同。],
    [C. 成员变量没有默认值。],
    [D. 局部变量没有默认值。],
  )

+ 下列叙述中正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 创建一个子类对象时, 对应的父类对象也一并创建。],
    [B. 子类可以继承父类的构造方法。],
    [C. 子类继承的方法不可以操作子类新声明的变量。],
    [D. 子类新定义的方法没有办法操作子类隐藏的成员变量。],
  )

+ 以下哪个是正确的声明子类语句? ( )
  #grid(
    columns: 1, // Changed to 1 column based on layout in image
    gutter: 5pt,
    [A. `class Student extend People {…}` 。],
    [B. `class Student implements People {…}` 。],
    [C. `class Student extends People {…}` 。。], // Typo in original has two periods
    [D. `class Student implement People {…}` 。],
  )

+ 下列哪个叙述是错误? ( )
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. `throws` 语句的作用是声明异常。],
    [B. 在编写程序时可以扩展 Exception 类定义自己的异常类。],
    [C. `try-catch` 语句可设由多个 `catch` 组成, `catch` 子句的处理与排列顺序无关。], // Corrected OCR 'infch' to 'catch' and '可设山八个' to '可设由多个' based on context
    [D. `finally` 语句块中的代码总是被执行。], // Corrected OCR '谓句块' to '语句块'
  )

+ 下列变量定义中, 符合 Java 命名规范的是 ( )
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. `3a`], [B. `int name`], [C. `$number`], [D. `field_name`], // Adjusted D based on typical Java style convention, original OCR `field name` is ambiguous
  )

+ 为了区分重载多态中同名的不同方法, 要求 ( )
  #grid(
    columns: 1, // Changed to 1 column based on layout
    gutter: 5pt,
    [A. 采用不同的参数列表。],
    [B. 返回值类型不同。],
    [C. 调用时用类名或对象名做前缀。],
    [D. 参数名不同。],
  )

+ 下列说法不正确的是 ( )。
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. 一个 `.java` 源程序编译通过后, 得到的结果文件数也只有一个。],
    [B. 一个 `.java` 源程序编译通过后, 得到的文件的扩展名一定是 `.class`。], // Corrected OCR '.class'
    [C. 一个 `.java` 源程序只能有一个 public class 类定义, 且源文件的名字与 public class 的类名相同, 扩展名必须是 `.java`。],
    [D. 一个 `.java` 源程序可以包含多个 class 类。],
  )

+ 关于数组的叙述不正确的是 ( )。
  #grid(
    columns: 1,
    gutter: 5pt,
    [A. `"int[] a;"` 声明了一个 int 型一维数组。],
    [B. `"int a[20];"` 是正确的数组声明。], // This is C/C++ style, not typical Java declaration. In Java it should be `int[] a = new int[20];` or `int a[] = new int[20];`. The option itself might be testing this.
    [C. 数组是引用型数据类型。],
    [D. 对于 `"int a[][]=new int[2][9];"`, `a.length` 的值是 2。],
  )

+ 对于 `"int n=6789;"`, 表达式的值为 7 的是 ( )。
  #grid(
    columns: 4,
    gutter: 1fr,
    [A. `n % 10`], [B. `n / 10 % 10`], [C. `n / 100 % 10`], [D. `n / 1000 % 10`],
  )

= 判断题 (共20题, 每题1分, 共20分)

#set enum(indent: 0.5cm, numbering: "1.")
+ Java 程序经过编译后产生的字节码是一种二进制代码, 可以直接在任何平台上识别和执行。( )
+ Java EE 主要用于嵌入式开发。( )
+ `byte x = (byte)(-129);` 该语句语法正确。( )
+ 类中方法体内声明的局部变量的有效范围为整个方法体内。( )
+ 如果两个类 A 和 B 在不同的包, 那么在类 B 中创建的类 A 对象不能访问类 A 的友好变量。( )
+ (Question 6 seems missing in OCR) // Placeholder - Check original paper if possible
+ `package` 语句可以写在 Java 源程序中的任何位置。( )
+ `this` 可以出现在实例方法和构造方法中, 有时可能出现在类方法中。( )
+ `super` 关键字可以出现在子类的构造方法中任意位置。( )
+ `StringTokenizer` 类和 String 类的 `split` 方法都可以实现字符序列的分解。( )
+ 子类对象的上转型对象不可以调用子类新增的方法。( )
+ `final` 修饰类, 表示该类不可以有子类。( )
+ Java 支持多重继承, 即一个类可以继承多个类。( )
+ 所有类的根类是 `Object` 类。( )
+ `3e3` 是 double 型常量。( )
+ `(byte)9 + 'c'` 的结果是 int 型数据。( )
+ 局部变量如果被 `final` 修饰就成为常量。( ) // Corrected OCR "常用" to "常量" based on context
+ `Random` 对象的 `nextInt(int n)` 方法随机返回 `[0, n)` 之间的一个整数。( ) // Corrected range notation based on standard Java behavior
+ `StringBuffer` 对象的字符序列是不可以被修改的。( )
+ `FileReader` 类可以实现以字节形式的文件的读取。( )

= 程序分析题 (共3题, 共20分)

#set enum(indent: 0.5cm, numbering: "1.")
+ (6分) 有以下源程序, 请写出【代码1】的输出结果和理由, 【代码2】和【代码3】的错误理由。
  *程序1:*
  ```java
  class Father {
      int print(int x) {
          return x;
      }
  }

  class Son extends Father {
      int print(int x) {
          return x + 1;
      }
  }

  public class Test {
      public static void main(String args[]) {
          Father father = new Son();
          System.out.printf("%d", father.print(5)); // 【代码1】
      }
  }
  ```
  *程序2:*
  ```java
  class E {
      int x;
      int n;
      n = 200; // 【代码2】
      public void f() { // Assumed method name 'f' based on partial OCR
          int m;
          int y = x + m; // 【代码3】
      }
  }
  ```
  【代码1】结果及理由:

  #block(height: 2em)[ ] // Placeholder for answer

  【代码2】错误理由:

  #block(height: 2em)[ ] // Placeholder for answer

  【代码3】错误理由:

  #block(height: 2em)[ ] // Placeholder for answer

+ (6分) 有以下源程序, 请写出下列 Test 类中【代码1】、【代码2】和【代码3】的输出结果和理由。
  ```java
  public class Test {
      public static void main(String args[]) {
          String s1 = "Java程序设计";
          String s2 = "Java" + "程序设计";
          System.out.println(s1 == s2); // 【代码1】

          String str = "Java";
          String s3 = str + "程序设计";
          System.out.println(s1 == s3); // 【代码2】

          String s4 = new String("Java程序设计");
          System.out.println(s3 == s4); // 【代码3】 // Assuming s3 comparison based on pattern
      }
  }
  ```
  【代码1】结果及理由:

  #block(height: 2em)[ ]

  【代码2】结果及理由:

  #block(height: 2em)[ ]

  【代码3】结果及理由:

  #block(height: 2em)[ ]

+ (8分) 有以下源程序, 请写出 4 处标记错误的理由:
  ```java
  abstract class A {
      int x = -2; // Corrected OCR '=2;' to '= -2;' based on context
      final abstract void method1(); // 【代码1】
      static int method2() {
          return x + 3; // 【代码2】
      }
  }

  interface B {
      public B() { // 【代码3】
      }
      public int method3(int a, int b) { // 【代码4】 // Missing return type in OCR, assumed int based on body
          return a + b;
      }
  }

  ```
  【代码1】错误理由:

  #block(height: 1.5em)[ ]

  【代码2】错误理由:

  #block(height: 1.5em)[ ]

  【代码3】错误理由:

  #block(height: 1.5em)[ ]

  【代码4】错误理由:

  #block(height: 1.5em)[ ]

= 简答题 (共5题, 共30分)

#set enum(indent: 0.5cm, numbering: "1.")
+ (6分) 简述访问权限中私有权限、公共权限、友好权限和受保护权限的特点。
+ (6分) 简述对象组合及其优势。
+ (6分) 简述面向抽象的编程方式。
+ (6分) 列举 `super` 的两种常用场景。
+ (6分) 分别简述什么是上转型变量、什么是接口回调。

= 编程题 (共2题, 共15分)

#set enum(indent: 0.5cm, numbering: "1.")
+ (共6分) 编写一个类 `Sum`, 包含两个方法, 其中一个方法为静态方法 `getSum()`, 其功能是求出 2+4+6+8+10 之和, 其值赋值给成员变量 `sum`; 另一个实例方法为 `getMax(int x, int y, int z)`, 其功能是求 x, y 和 z 的最大值, 其最大值赋值给成员变量 `max`。然后编写测试类 `Test`, 输出 `sum` 的值和最大值 `max`。
+ (共9分) 鸟类和昆虫类都具有飞行的功能, 要求利用接口完成以下功能:
  (1) 定义一个接口 `Fly`, 接口体中有个描述飞行的抽象方法 `fly()`。
  (2) 定义一个抽象父类 `Bird`, 父类中有个生蛋的抽象方法 `egg()`。 // Corrected OCR 'cgg' to 'egg' based on context
  (3) 定义鸽子类 `Pigeon`, 继承抽象父类 `Bird`, 实现接口 `Fly`。
  (4) 定义测试类 `Test`, 在主方法 `main` 中实例化 `Pigeon` 对象的上转型对象, 并使用多态的方法执行上转型对象的 `egg()` 方法。

