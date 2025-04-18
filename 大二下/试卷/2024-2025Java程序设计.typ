#set document(title: "2024-2025年《JAVA程序设计》期末试题库")
#set page(
  numbering: "1",
  // foreground:
)


#set heading(numbering: "一、")
#set text(font: "pingfang sc",lang:"zh")
#let coder(code) = block(
  width: 100%,
  inset: 1em,
  fill: rgb("#F6F8FA"),
  radius: 8pt,
)[#v(-8pt)
  #text(size: 24pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
  #v(-5pt)
  #text(size: 12pt, font: "SF Mono")[#code]
]
#align(left)[#text(font: "Heiti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[$2024-2025$ 年《Java 程序设计》期末试题]])
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
    columns: (1fr,),
    gutter: 10pt, // Reduced gutter slightly
    [A. 如果类里定义了一个或多个构造方法, 那么 Java 编译器不提供默认的构造方法。],
    [B. 同一个类创建的不同对象具有不同的实体。],
    [C. 不可以用一个类的对象访问类变量, 只能用类名访问类变量。],
    [D. 一个类的实例方法可以调用类中的其他实例方法和类方法。],
  )

+ 下列叙述中正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 可以用 protected 修饰一个类。],
    [B. protected 的访问权限低于友好的访问权限。],
    [C. byte 是一个基本的数据类型, 而 Byte 是一个类。],
    [D. 对象数组中每个空间存储的是对象的实体。],
  )

+ Java 语言中关于使用接口以下哪个说法正确? ( )
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 一个类只能实现一个接口。],
    [B. 一个非抽象类实现一个接口必须实现接口的所有方法。],
    [C. 接口之间不能继承。],
    [D. 接口和抽象类是同一回事。],
  )

+ 对于如下类, 下列叙述中正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 编译错误。],
    [B. 类中有 2 个构造方法, 2 个重载方法。], // Note: The void Test() and int Test(int m) are methods, not constructors. The question likely refers to the constructors Test() and Test(int x), and perhaps considers the methods Test() and Test(int m) as overloaded. Let's keep the option as written.
    [C. 类中没有重载方法。],
    [D. 类中没有构造方法。],
  )
  #coder(```java
  public class Test {
      int x;
      Test() {}
      Test(int x) {}
      void Test() {}
      int Test(int m) {
          x = m;
          return x;
      }
  }
  ```)

+ 关于成员变量, 下列哪个叙述是正确的? ( )
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 成员变量的名字不可以和局部变量的名字相同。],
    [B. 方法的参数的名字可以和方法中声明的局部变量的名字相同。],
    [C. 成员变量没有默认值。],
    [D. 局部变量没有默认值。],
  )

+ 下列叙述中正确的选项是 ( )
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 创建一个子类对象时, 对应的父类对象也一并创建。],
    [B. 子类可以继承父类的构造方法。],
    [C. 子类继承的方法不可以操作子类新声明的变量。],
    [D. 子类新定义的方法没有办法操作子类隐藏的成员变量。],
  )

+ 以下哪个是正确的声明子类语句? ( )
  #grid(
    columns: 1, // Changed to 1 column based on layout in image
    gutter: 10pt,
    [A. `class Student extend People {…}` 。],
    [B. `class Student implements People {…}` 。],
    [C. `class Student extends People {…}` 。。], // Typo in original has two periods
    [D. `class Student implement People {…}` 。],
  )

+ 下列哪个叙述是错误? ( )
  #grid(
    columns: 1,
    gutter: 10pt,
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
    columns: (1fr,),
    gutter: 10pt,
    [A. 采用不同的参数列表。],
    [B. 返回值类型不同。],
    [C. 调用时用类名或对象名做前缀。],
    [D. 参数名不同。],
  )

+ 下列说法不正确的是 ( )。
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 一个 `.java` 源程序编译通过后, 得到的结果文件数也只有一个。],
    [B. 一个 `.java` 源程序编译通过后, 得到的文件的扩展名一定是 `.class`。], // Corrected OCR '.class'
    [C. 一个 `.java` 源程序只能有一个 public class 类定义, 且源文件的名字与 public class 的类名相同, 扩展名必须是 `.java`。],
    [D. 一个 `.java` 源程序可以包含多个 class 类。],
  )

+ 关于数组的叙述不正确的是 ( )。
  #grid(
    columns: 1,
    gutter: 10pt,
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

+ Java 经过编译产生的字节码是二进制代码, 可以直接在任何平台上识别和执行。#h(1fr) 【$space space$】

+ Java EE 主要用于嵌入式开发。#h(1fr) 【$space space$】
+ `byte x = (byte)(-129);` 该语句语法正确。#h(1fr) 【$space space$】
+ 类中方法体内声明的局部变量的有效范围为整个方法体内。#h(1fr) 【$space space$】
+ 若类 A 和 B 在不同包, 那么在类 B 中创建的类 A 对象不能访问类 A 的友好变量#h(1fr) 【$space space$】
+ 无包名的类可以使用有包名的类。#h(1fr) 【$space space$】// Placeholder - Check original paper if possible
+ `package` 语句可以写在 Java 源程序中的任何位置。#h(1fr) 【$space space$】
+ `this` 可以出现在实例方法和构造方法中, 有时可能出现在类方法中。#h(1fr) 【$space space$】
+ `super` 关键字可以出现在子类的构造方法中任意位置。#h(1fr) 【$space space$】
+ `StringTokenizer` 类和 String 类的 `split` 方法都可以实现字符序列的分解。#h(1fr) 【$space space$】
+ 子类对象的上转型对象不可以调用子类新增的方法。#h(1fr) 【$space space$】
+ `final` 修饰类, 表示该类不可以有子类。#h(1fr) 【$space space$】
+ Java 支持多重继承, 即一个类可以继承多个类。#h(1fr) 【$space space$】
+ 所有类的根类是 `Object` 类。#h(1fr) 【$space space$】
+ `3e3` 是 double 型常量。#h(1fr) 【$space space$】
+ `(byte)9 + 'c'` 的结果是 int 型数据。#h(1fr) 【$space space$】
+ 局部变量如果被 `final` 修饰就成为常量。#h(1fr) 【$space space$】 // Corrected OCR "常用" to "常量" based on context
+ `Random` 对象的 `nextInt(int n)` 方法随机返回 `[0, n)` 之间的一个整数。#h(1fr) 【$space space$】 // Corrected range notation based on standard Java behavior
+ `StringBuffer` 对象的字符序列是不可以被修改的。#h(1fr) 【$space space$】
+ `FileReader` 类可以实现以字节形式的文件的读取。#h(1fr) 【$space space$】

= 程序分析题 (共3题, 共20分)

#set enum(indent: 0.5cm, numbering: "1.")
+ (6分) 有以下源程序, 请写出【代码1】的输出结果和理由, 【代码2】和【代码3】的错误理由。

  *程序1:*
  #coder(```java
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
  ```)



  *程序2:*

  #coder(```java
  class E {
      int x; int n;
      n = 200; // 【代码2】
      public void f() {
          int m;
          int y = x + m; // 【代码3】
      }
  }
  ```)
  【代码1】结果及理由:

  #block(height: 2em)[ ] // Placeholder for answer

  【代码2】错误理由:

  #block(height: 2em)[ ] // Placeholder for answer

  【代码3】错误理由:

  #block(height: 2em)[ ] // Placeholder for answer

+ (6分) 有以下源程序, 请写出下列 Test 类中【代码1】、【代码2】和【代码3】的输出结果和理由。
  #coder(```java
  public class Test {
      public static void main(String args[]) {
          String s1 = "Java程序设计";
          String s2 = "Java" + "程序设计";
          System.out.println(s1 == s2); // 【代码1】

          String str = "Java";
          String s3 = str + "程序设计";
          System.out.println(s1 == s3); // 【代码2】

          String s4 = new String("Java程序设计");
          System.out.println(s3 == s4); // 【代码3】
      }
  }
  ```)
  【代码1】结果及理由:

  #block(height: 2em)[ ]

  【代码2】结果及理由:

  #block(height: 2em)[ ]

  【代码3】结果及理由:

  #block(height: 12em)[ ]

+ (8分) 有以下源程序, 请写出 4 处标记错误的理由:

  #coder(```java
  abstract class A {
      int x = 2;
      final abstract void method1(); // 【代码1】
      static int method2() {
          return x + 3; // 【代码2】
      }
  }

  interface B {
      public B() { // 【代码3】
      }
      public int method3(int a, int b) { // 【代码4】
          return a + b;
      }
  }

  ```)
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
+ (共6分) 编写一个类 `Sum`, 包含两个方法, 其中一个方法为静态方法 `getSum()`, 其功能是求出 $2+4+6+8+10$ 之和, 其值赋值给成员变量 `sum`; 另一个实例方法为 `getMax(int x, int y, int z)`, 其功能是求 x, y 和 z 的最大值, 其最大值赋值给成员变量 `max`。然后编写测试类 `Test`, 输出 `sum` 的值和最大值 `max`。

+ (共9分) 鸟类和昆虫类都具有飞行的功能, 要求利用接口完成以下功能:\
  (1) 定义一个接口 `Fly`, 接口体中有个描述飞行的抽象方法 `fly()`。\
  (2) 定义一个抽象父类 `Bird`, 父类中有个生蛋的抽象方法 `egg()`。\ // Corrected OCR 'cgg' to 'egg' based on context
  (3) 定义鸽子类 `Pigeon`, 继承抽象父类 `Bird`, 实现接口 `Fly`。\
  (4) 定义测试类 `Test`, 在主方法 `main` 中实例化 `Pigeon` 对象的上转型对象, 并使用多态的方法执行上转型对象的 `egg()` 方法。

//answer
#pagebreak()
#align(center)[参考答案]
#let answer-choice(num, answer, reasoning) = {
  text(weight: "bold")[#num. #sym.space #box([正确答案：#answer], stroke: 1pt, outset: 2.5pt)]
  linebreak()
  pad(left: 0em)[#reasoning]
}

#let answer-true-false( num, answer, reasoning) = {
  text(weight: "bold")[#num. #sym.space #box([正确答案：#answer], stroke: 1pt, outset: 2.5pt)]
  linebreak()
  [#reasoning]
}

#let answer-coding(question, solution) = {
  heading.where(level: 1)[编程题 - #question]
  text(weight: "bold")[解答：]
  [#solution]
}

#let answer-analysis(question, solution) = {
  heading.where(level: 1)[程序分析题 - #question]
  text(weight: "bold")[解答：]
  [#solution]
}

#let answer-short(question, solution) = {
  heading.where(level: 1)[简答题 - #question]
  text(weight: "bold")[解答：]
  [#solution]
}
#answer-choice(
  1,
  [A],
  [
    1. *A. `float f = 1;`*
      - 字面值`1`是整数（`int`类型）。在Java中，`int`可以隐式转换为`float`，因为`float`有更大的数值范围（尽管精度较低）。这是一个有效的声明。
      - *正确。*

    2. *B. `float f = 1.0;`*
      - 字面值`1.0`在Java中默认为`double`类型（所有没有后缀的浮点数字面值都是`double`）。将`double`赋值给`float`需要显式转换（如`float f = (float) 1.0;`或`float f = 1.0f;`）。没有`f`后缀或类型转换会导致编译错误。
      - *无效。*

    3. *C. `float f = 2e1;`*
      - 字面值`2e1`表示`2 * 10^1 = 20.0`，默认为`double`类型（科学计数法表示的数字除非加上`f`后缀，否则都是`double`）。和选项B一样，将`double`赋值给`float`需要类型转换或加`f`后缀（如`float f = 2e1f;`）。没有后缀时这是无效的。
      - *无效。*

    4. *D. `float f = 2.3d;`*
      - 字面值`2.3d`明确指定为`double`类型（`d`或`D`后缀表示`double`）。将`double`赋值给`float`在没有类型转换的情况下是不允许的，需要使用`f`后缀（如`float f = 2.3f;`）。这是无效的。
      - *无效。*
  ],
)

#answer-choice(
  2,
  [A],
  [
    1. *A. JRE、JVM*
      - JRE（Java Runtime Environment）是Java运行环境的缩写，包含JVM（Java Virtual Machine）和Java类库。JVM是执行Java字节码的虚拟机。这个选项是正确的。
      - *正确。*

    2. *B. JVM、JRE*
      - JVM是Java虚拟机，JRE是Java运行环境。这个选项的顺序是错误的。
      - *无效。*

    3. *C. JDK、JRE*
      - JDK（Java Development Kit）是Java开发工具包，包含JRE和开发工具。这个选项的顺序是错误的。
      - *无效。*

    4. *D. JRE、JDK*
      - JRE和JDK是不同的概念，JDK包含了JRE。这个选项的顺序是错误的。
      - *无效。*
  ],
)
#answer-choice(
  3,
  [C],
  [
    1. *A. 如果类里定义了一个或多个构造方法, 那么 Java 编译器不提供默认的构造方法。*
      - 这是正确的说法。如果类中定义了任何构造方法，Java编译器不会自动提供默认构造方法。
      - *正确。*

    2. *B. 同一个类创建的不同对象具有不同的实体。*
      - 这是正确的说法。同一个类创建的不同对象是不同的实体。
      - *正确。*

    3. *C. 不可以用一个类的对象访问类变量, 只能用类名访问类变量。*
      - 这是错误的说法。可以使用对象名或类名访问类变量（静态变量），但通常推荐使用类名来提高可读性。
      - *无效。*

    4. *D. 一个类的实例方法可以调用类中的其他实例方法和类方法。*
      - 这是正确的说法。实例方法可以调用同一类中的其他实例方法和静态方法。例如：
      #coder(```java
      public class Example {
          // 静态方法（类方法）
          public static void staticMethod() {
              System.out.println("静态方法");
          }

          // 实例方法
          public void instanceMethod1() {
              System.out.println("实例方法1");
          }

          // 另一个实例方法，可以调用实例方法和静态方法
          public void instanceMethod2() {
              instanceMethod1();    // 调用实例方法
              staticMethod();      // 调用静态方法
          }
      }
      ```)
      - *正确。*
  ],
)

#answer-choice(
  4,
  [C],
  [
    1. *A. 可以用 protected 修饰一个类。*
      在Java中，`protected`访问修饰符不能用于顶层类，原因如下：

      1. 包控制：顶层类应该要么是public（在任何地方可见），要么是包私有（仅在包内可见）。这种设计使包的组织简单明了。

      2. 继承目的：`protected`专门为继承场景设计 - 它允许子类和同一包内的访问。由于顶层类不存在"可从包外继承但其他情况下隐藏"的用例，所以在类级别使用`protected`没有意义。

      3. 封装性：Java设计者想要强制实施清晰的包边界。如果类只对子类可见但对其他类不可见，会使包模型变得复杂。

      4. 内部类例外：注意`protected`可以用于内部类，因为内部类是其封闭类的成员，在这种情况下成员的可见性是有意义的。

      这种设计使Java的访问控制模型简单明了，并与面向对象原则保持一致。
      - *无效。*

    2. *B. protected 的访问权限低于友好的访问权限。*
      - 这是错误的说法。`protected`的访问权限高于友好的访问权限（包内可见性）。`protected`允许子类和同一包中的其他类访问。
      - *无效。*

    3. *C. byte 是一个基本的数据类型, 而 Byte 是一个类。*
      - 这是正确的说法。`byte`是Java中的基本数据类型，而`Byte`是对应的包装类。
      - *正确。*

    4. *D. 对象数组中每个空间存储的是对象的实体。*
      - 这是错误的说法。在Java中，对象数组存储的是对象的引用(为了性能)，而不是对象的实体。
      - *无效。*
      #figure(
        table(
          columns: (auto, auto, auto, auto, auto),
          inset: 6pt,
          align: left,
          [修饰符], [同类中], [同包中], [子类中], [其他包],
          [private], [✅], [❌], [❌], [❌],
          [(default)], [✅], [✅], [❌], [❌],
          [protected], [✅], [✅], [✅], [❌ (但子类可以访问)],
          [public], [✅], [✅], [✅], [✅],
        ),
        caption: "Java访问控制修饰符的可见性",
      )
  ],
)
#answer-choice(
  5,
  [B],
  [
    1. *A. 一个类只能实现一个接口。*
      - 这是错误的说法。Java允许一个类实现多个接口。
      - *无效。*

    2. *B. 一个非抽象类实现一个接口必须实现接口的所有方法。*
      - 这是正确的说法。如果一个非抽象类实现了一个接口，它必须实现接口中定义的所有方法。
      - *正确。*

    3. *C. 接口之间不能继承。*
      - 这是错误的说法。接口可以继承其他接口。
      - *无效。*

    4. *D. 接口和抽象类是同一回事。*
      - 这是错误的说法。接口和抽象类在Java中是不同的概念，尽管它们都可以包含抽象方法：
      1. 抽象类可以有构造方法，接口不能
      2. 抽象类可以有非抽象方法，接口中的方法默认都是抽象的（Java 8之前）
      3. 抽象类可以有实例变量，接口只能有常量
      4. 一个类只能继承一个抽象类，但可以实现多个接口
      - *无效。*
  ],
)

#answer-choice(
  6,
  [B],
  [
    1. *A. 编译错误。*
      - 这是错误的说法。代码是有效的，编译器不会报错。
      - *无效。*

    2. *B. 类中有 2 个构造方法, 2 个重载方法。*
      - 这是正确的说法。类中有两个构造方法（`Test()`和`Test(int x)`）和两个重载方法（`void Test()`和`int Test(int m)`）。
      - *正确。*

    3. *C. 类中没有重载方法。*
      - 这是错误的说法。类中有两个重载方法（`void Test()`和`int Test(int m)`）。
      - *无效。*

    4. *D. 类中没有构造方法。*
      - 这是错误的说法。类中有两个构造方法（`Test()`和`Test(int x)`）。
      - *无效。*
      #coder(```java
      public class Test {
          int x;
          Test() {}
          Test(int x) {}
          void Test() {}
          int Test(int m) {
              x = m;
              return x;
          }
      }
      ```)
  ],
)
#answer-choice(
  7,
  [D],
  [
    1. *A. 成员变量的名字不可以和局部变量的名字相同。*
      - 这是错误的说法。成员变量和局部变量可以同名，但在方法中使用时，局部变量会覆盖成员变量。
      - *无效。*

    2. *B. 方法的参数的名字可以和方法中声明的局部变量的名字相同。*
      - 这是正确的说法。方法参数和局部变量可以同名，但在方法中使用时，局部变量会覆盖方法参数。
      - *正确。*

    3. *C. 成员变量没有默认值。*
      - 这是错误的说法。成员变量在类实例化时会被赋予默认值（如`int`类型默认为0）。
      - *无效。*

    4. *D. 局部变量没有默认值。*
      - 这是正确的说法。局部变量在使用前必须显式初始化，否则编译器会报错。
      - *正确。*
      #coder(```java
      public class Example {
          int memberVariable; // 成员变量

          public void method() {
              int localVariable; // 局部变量
              System.out.println(memberVariable); // 输出成员变量的默认值（0）
              // System.out.println(localVariable); // 编译错误：局部变量localVariable可能尚未初始化
          }
      }
      ```)
  ],
)
#answer-choice(
  8,
  [B],
  [
    1. *A. 创建一个子类对象时, 对应的父类对象也一并创建。*
      - 这是正确的说法。当创建子类对象时，父类对象会被隐式创建。
      - *正确。*

    2. *B. 子类可以继承父类的构造方法。*
      - 这是错误的说法。子类不能继承父类的构造方法，但可以*调用*父类的构造方法。
      - *无效。*

    3. *C. 子类继承的方法不可以操作子类新声明的变量。*
      - 这是错误的说法。子类可以在继承的方法中操作子类新声明的变量。
      - *无效。*

    4. *D. 子类新定义的方法没有办法操作子类隐藏的成员变量。*
      - 这是错误的说法。子类新定义的方法可以操作子类隐藏的成员变量。
      - *无效。*
    #figure(
      table(
        columns: (auto, auto),
        inset: 6pt,
        align: left,
        [概念], [说明],
        [构造方法继承], [子类不能继承父类构造方法，但可以通过super( ) 调用],
        [对象创建顺序], [创建子类对象时，先创建父类对象，再创建子类对象],
        [变量访问], [子类可以访问继承的变量和自己声明的变量],
        [变量隐藏], [子类可以声明与父类同名的变量，形成变量隐藏],
        [方法重写], [子类可以重写父类的方法，使用\@Override注解],
        [super关键字], [用于调用父类构造方法和访问父类成员],
      ),
      caption: "Java继承机制的核心概念",
    )

  ],
)
#answer-choice(
  9,
  [C],
  [
    1. *A. `class Student extend People {…}` 。*
      - 这是错误的说法。Java中使用`extends`关键字来继承类，而不是`extend`。
      - *无效。*

    2. *B. `class Student implements People {…}` 。*
      - 这是错误的说法。`implements`用于实现接口，而不是继承类。
      - *无效。*

    3. *C. `class Student extends People {…}` 。*
      - 这是正确的说法。Java中使用`extends`关键字来继承类。
      - *正确。*

    4. *D. `class Student implement People {…}` 。*
      - 这是错误的说法。在Java中，`implement`是错误的，应该是`implements`。
      - *无效。*

    #figure(
      table(
        columns: (auto, auto, auto),
        inset: 6pt,
        align: left,
        [关键字], [用途], [示例],
        [extends], [用于类继承], [`class Child extends Parent`],
        [implements], [用于实现接口], [`class Child implements Interface`],
        [extends + implements], [同时继承类和实现接口], [`class Child extends Parent implements Interface`],
        [多重实现], [实现多个接口], [`class Child implements Interface1, Interface2`],
        [单继承], [只能继承一个类], [Java不支持`class Child extends Parent1, Parent2`],
      ),
      caption: "Java类继承与接口实现的语法规则",
    )
  ],
)

#answer-choice(
  10,
  [C],
  [
    1. *A. `throws` 语句的作用是声明异常。*
      - 这应该是错误的说法。😥🥺(#underline([但是参考答案说是对的.大家以老师的答案为主]))`throws`用于声明方法可能抛出的异常，而不是声明异常本身。
      - *无效。*

    2. *B. 在编写程序时可以扩展 Exception 类定义自己的异常类。*
      - 这是正确的说法。Java允许用户定义自己的异常类，通常通过扩展`Exception`类或其子类。
      - *正确。*

    3. *C. `try-catch` 语句可设由多个 `catch` 组成, `catch` 子句的处理与排列顺序无关。*
      - 这是错误的说法。在Java中，`catch`子句的顺序是重要的，因为它们会根据异常类型进行匹配。
      - *无效。*

    4. *D. `finally` 语句块中的代码总是被执行。*
      - 这是正确的说法。无论是否发生异常，`finally`块中的代码都会被执行。
      - *正确。*
    #coder(```java
    public class Example {
        public static void main(String[] args) {
            try {
                // 可能抛出异常的代码
            } catch (Exception e) {
                // 异常处理代码
            } finally {
                // 无论如何都会执行的代码
            }
        }
    }
    ```)
  ],
)
#answer-choice(
  11,
  [C],
  [

    #figure(
      table(
        columns: (auto, auto),
        inset: 6pt,
        align: left,
        [变量名], [说明],
        [`3a`], [错误：变量名不能以数字开头],
        [`int name`], [错误：变量名不能是Java关键字],
        [`$number`], [正确：变量名可以以美元符号开头],
        [`field_name`], [正确：变量名可以包含下划线],
      ),
      caption: "Java变量命名规则",
    )
  ],
)
#answer-choice(
  12,
  [A],
  [
    1. *A. 采用不同的参数列表。*
      - 这是正确的说法。重载方法必须具有不同的参数列表（参数类型、数量或顺序）。
      - *正确。*

    2. *B. 返回值类型不同。*
      - 这是错误的说法。返回值类型不能用于区分重载方法。
      - *无效。*

    3. *C. 调用时用类名或对象名做前缀。*
      - 这是错误的说法。调用重载方法时，使用对象名或类名并不会影响方法的选择。
      - *无效。*

    4. *D. 参数名不同。*
      - 这是错误的说法。参数名不能用于区分重载方法，只有参数类型和数量可以。
      - *无效。*
    #coder(```java
    public class Example {
        public void method(int a) {}
        public void method(double b) {} // 重载：参数类型不同
        public void method(int a, double b) {} // 重载：参数数量不同
    }
    ```)
  ],
)
#answer-choice(
  13,
  [A],
  [
    1. *A. 一个 `.java` 源程序编译通过后, 得到的结果文件数也只有一个。*
      - 这是错误的说法。一个`.java`源程序可以包含多个类，每个类会生成一个`.class`文件。
      - *无效。*

    2. *B. 一个 `.java` 源程序编译通过后, 得到的文件的扩展名一定是 `.class`。*
      - 这应该也是错误的说法。虽然大多数情况下是这样，但如果使用了其他工具或编译器，可能会生成不同类型的文件。(#underline()[但是参考答案说是对的.大家以老师的答案为主])
      - *无效。*

    3. *C. 一个 `.java` 源程序只能有一个 public class 类定义, 且源文件的名字与 public class 的类名相同, 扩展名必须是 `.java`。*
      - 这是正确的说法。在Java中，一个`.java`文件只能有一个public类，并且文件名必须与该类名相同。
      - *正确。*

    4. *D. 一个 `.java` 源程序可以包含多个 class 类。*
      - 这是正确的说法。在Java中，一个`.java`文件可以包含多个非public类。
      - *正确。*
  ],
)

#answer-choice(
  14,
  [B],
  [
    1. *A. `"int[] a;"`声明了一个int型一维数组。*
      - 这是正确的声明方式。在Java中，可以使用`int[] a;`或`int a[];`声明一维数组。
      - *正确。*

    2. *B. `"int a[20];"` 是正确的数组声明。*
      - 这是错误的说法。在Java中不能在声明时指定数组大小。正确的方式应该是：
        - `int[] a = new int[20];` 或
        - `int a[] = new int[20];`
      - *无效。*

    3. *C. 数组是引用型数据类型。*
      - 这是正确的说法。在Java中，所有数组都是引用类型，即使是基本数据类型的数组。
      - *正确。*

    4. *D. 对于`"int a[][]=new int[2][9];"`，`a.length`的值是2。*
      - 这是正确的说法。对于二维数组：
        - `a.length`返回第一维的长度（2）
        - `a[0].length`返回第二维的长度（9）
      - *正确。*
    #coder(```java
    int[][] a = new int[2][9];
    System.out.println(a.length);     // 输出：2
    System.out.println(a[0].length);  // 输出：9
    ```)
  ],
)

#answer-choice(
  15,
  [C],
  [
    1. *A. `n % 10`*
      - `n % 10` 得到 9（取个位数）
      - *无效。*

    2. *B. `n / 10 % 10`*
      - `n / 10` 得到 678
      - `678 % 10` 得到 8（取十位数）
      - *无效。*

    3. *C. `n / 100 % 10`*
      - `n / 100` 得到 67
      - `67 % 10` 得到 7（取百位数）
      - *正确。*

    4. *D. `n / 1000 % 10`*
      - `n / 1000` 得到 6
      - `6 % 10` 得到 6（取千位数）
      - *无效。*
  ],
)

#line(length: 100%)
#line(length: 100%)
#let apple-table = figure(
  table(
    columns: 6,
    align: center,
    inset: 9pt,
    stroke: rgb("#E5E5E5"), 
    fill: (_, row) => if row == 0 { rgb("#F5F5F7") } else { none }, // Light header background
    [题号], [], [], [], [], [], // Header row
    [1-5], [❌], [❌], [✅], [✅], [✅],
    [6-10], [✅], [❌], [❌], [✅], [✅],
    [11-15], [✅], [✅], [❌], [✅], [✅],
    [16-20], [✅], [✅], [✅], [❌], [❌],
  ),
  caption: [判断题答案一览表],
  supplement: "Table"
)

#align(center, apple-table)
#answer-true-false(1, "❌", 
  [Java字节码（.class文件）是二进制文件，但不能直接在任何平台执行。它需要JVM（Java虚拟机）来解释执行。])

#answer-true-false(2, "❌",
  [Java EE（Enterprise Edition）主要用于企业级开发，而不是嵌入式开发。Java ME（Micro Edition）才是用于嵌入式开发。])

#answer-true-false(3, "❌",
  [虽然-129超出了byte类型的范围（-128到127），但是(byte)强制类型转换是合法的语法。转换结果会是127。
  #underline([但是参考答案说是错的])])

#answer-true-false(4, "✅",
  [局部变量的作用范围是从其声明位置开始到包含该声明的块结束，而不是整个方法体。但是参考答案说是对的.大家以老师的答案为主。
  如以下情况:
  ```java
  public class Example {
      public void method() {
          int x = 10; // 局部变量x的作用范围从这里开始
          if (x > 5) {
              int y = 20; // 局部变量y的作用范围仅在if块内
              System.out.println(x + y); // 可以访问x和y
          }
          // System.out.println(y); // 错误：y在这里不可见
      }
  }
  ```
  
  ])

#answer-true-false(5, "✅",
  [友好访问权限（默认访问权限）只允许同包内的类访问，不同包的类无法访问。])

#answer-true-false(6, "✅",
  [无包名的类（默认包）可以使用有包名的类，只要正确导入即可。])

#answer-true-false(7, "❌",
  [package语句必须是Java源文件中的第一条非注释性语句。])

#answer-true-false(8, "❌",
  [this只能在实例方法和构造方法中使用，不能在静态方法（类方法）中使用。])

#answer-true-false(9, "❌",
  [在构造方法中，super()调用必须是第一条语句。])

#answer-true-false(10, "✅",
  [StringTokenizer类和String类的split()方法都可以用来分割字符串。])

#answer-true-false(11, "✅",
  [上转型对象只能访问父类中定义的方法，不能直接调用子类新增的方法。])

#answer-true-false(12, "✅",
  [final修饰的类不能被继承，这是Java实现封装的一种方式。])

#answer-true-false(13, "❌",
  [Java不支持多重继承，一个类只能继承一个父类。但可以实现多个接口。])

#answer-true-false(14, "✅",
  [在Java中，所有类都直接或间接继承自Object类。])

#answer-true-false(15, "✅",
  [科学计数法表示的浮点数字面量默认为double类型。])

#answer-true-false(16, "✅",
  [当byte、short、char类型的数据参与运算时，会自动转换为int类型。])

#answer-true-false(17, "✅",
  [final修饰的局部变量一旦初始化后就不能再改变其值，成为常量。])

#answer-true-false(18, "✅",
  [nextInt(n)方法返回一个大于等于0且小于n的随机整数。])

#answer-true-false(19, "❌",
  [StringBuffer对象的字符序列是可以修改的，这是它与String类的主要区别。])

#answer-true-false(20, "❌",
  [FileReader是字符流，用于读取字符形式的文件，而不是字节形式。])

