#set document(title: "2023-2024 年《JAVA 程序设计》期末试题")
#set heading(numbering: "一、")
#set text(font: "PingFang SC")

//这个是选择题要用的横线
#let uline(answer: "", width: 4em) = {
  box(width: width, stroke: (bottom: 0.5pt), outset: (bottom: 4pt))[#answer]
}
//代码块要用这个函数, 如
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
#align(left)[#text(font: "songti SC")[绝密★启用前]]
#align(center, text(15pt)[#text(font: "Songti SC")[2024-2025 年 《Java 程序设计》期末试题]])
#align(center)[#text(size: 1.8em, font: "songti SC")[]]
#text(font:"Heiti SC")[注意事项]：
#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答题卡上所粘贴的条形码上的姓名、准考证号与您本人是否相符。
= 选择题
+ 下列使用工具的命令中属于 Java 编译器的是( #uline() )
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. javac.exe], [B. javadoc.exe], [C. java.exe], [D. javaw.exe],
  )


+ 定义一个普通类需要使用到的关键字是( #uline() )
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. interface], [B. final], [C. abstract], [D. class],
  )


+ `StringBuilder str = new StringBuilder()`, 则依次经过 `str.append("Hello")`, `str.append(true)`, `str.append((double)3/2)`, `str.insert(4,"World")` 运算后, `str.toString()` 的值是( #uline() ) // Corrected method calls based on standard StringBuilder usage
  #grid(
    columns: 2, // Options are long
    gutter: 10pt,
    column-gutter: 1fr,
    [A. HellWorldotrue3/2], // 3/2 is 1, (double)3/2 is 1.5. insert at index 4. Hello -> HellWorldo. append(true) -> HellWorldotrue. append(1.5) -> HellWorldotrue1.5
    [B. HelloWorldtrue1.0], // Incorrect double division or insertion point?
    [C. HelloWorldtrue1], // Incorrect division (integer)
    [D. HellWorldotrue1.5], // This seems the most likely intended correct answer based on steps. Let's assume B, C are typo variants.
  )
// Based on calculation: str="Hello" -> "Hellotrue" -> "Hellotrue1.5". insert(4,"World") -> "HellWorldotrue1.5"

+ 通过控制台进行输入时, 需要构造一个与“标准输入流” `System.in` 关联的对象是( #uline() )
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. String 对象], [B. Scanner 对象], [C. Writer 对象], [D. Reader 对象],
  )


+ 在 Java 语言中, 下列针对某一行的注释是( #uline() )
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. `/** String str = "abc";*/`], // JavaDoc comment
    [B. `//double a = 3;`], // Single-line comment (Corrected syntax)
    [C. `% int b=0;`], // Not a Java comment
    [D. `/* double i=3.0:*/`], // Multi-line comment
  )


+ 已知存在一个 Employee 类, 现需定义一个 Manager 类, 二者属于继承关系, 则下列说法正确的是()
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. Manager 类是超类],
    [B. Manager 类是父类],
    [C. Employee 类是子类],
    [D. Manager 类是派生类], // Assuming Manager extends Employee
  )
// If Manager extends Employee, Manager is the derived/subclass. If Employee extends Manager, then A/B correct for Manager, C correct for Employee. Question wording "define a Manager class, the two belong to inheritance" usually implies Manager inherits from Employee.

+ 下列语句, 书写不正确的是()
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. `BigInteger a = BigInteger.valueOf(8)+BigInteger.valueOf("7");`], // Cannot use + operator for BigInteger
    [B. `BigInteger a = BigInteger.valueOf(8);`],
    [C. `BigInteger a = BigInteger.valueOf(Long.parseLong("7"));`], // valueOf doesn't directly take string for number, need parsing or use constructor new BigInteger("7")
    [D. `BigInteger a = BigInteger.valueOf(8).add(new BigInteger("7"));`], // Correct way to add BigIntegers
  )
// BigInteger requires .add() method for addition. Also C is slightly incorrect as valueOf takes long, not string directly. A is definitively wrong due to operator.

+ 已知`"public class Manager extends Employee {....}"`, 在 Employee 类中有一个`"public double getSalary(){....}"`方法, 在 Manager 类中也有一个`"public double getSalary(){....}"`方法, 则`"double s = new Employee(“张三”,40000).getSalary();"` 调用的 `getSalary` 方法是哪个类的方法( #uline() )
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. Manager类],
    [B. Manager 类或 Employee 类],
    [C. Manager 类和 Employee 类], // Call depends on object type
    [D. Employee类],
  )
// The object created is `new Employee(...)`, so the Employee class's getSalary method is called.

+ 下列关于数组的语句正确的是()
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. `double[]m =new double[-4];`], // Negative array size
    [B. `String[7] m =new String[];`], // Incorrect syntax for declaration and initialization
    [C. `boolean m[]= new boolean[6];`], // Correct syntax
    [D. `int m; m=new double[3];`], // Type mismatch: int variable assigned double array
  )


+ 下列 Java 语言中用于字符串的正确表示形式是
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 'abc'], // char literal uses single quotes, only for single characters
    [B. `{'a','b', 'c'}`], // char array initializer
    [C. "abc"], // String literal uses double quotes
    [D. `{"abe", "abc", "abe"}`], // String array initializer
  )


+ 在 Java 的基本数据类型中有 2 种浮点型, 下列占用内存存储空间最大的浮点型是()
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. byte], [B. float], [C. long], [D. double],
  )
// double (64 bits) > float (32 bits). byte and long are integer types.

+ 在构造对象的过程中, 程序初始化时执行的过程是()
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. “静态属性-->构造方法-->非静态属性”],
    [B. “非静态属性-->构造方法-->静态属性”],
    [C. “静态属性-->非静态属性-->构造方法”], // Static init -> Instance init -> Constructor body
    [D. “非静态属性-->静态属性-->构造方法”],
  )
// Order: Static initializers/blocks (once per class) -> Instance initializers/blocks & field initializations (per object) -> Constructor body (per object).

+ 下列语句执行后, x 的值为()
  #coder(```java
  int a = 4, b = 5, x = 3;
  if (a == --b)
      x = x * b;
  ```)
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 12], [B. 20], [C. 3], [D. 15],
  )


+ Java 异常处理机制中, `finally` 块中语句不执行的唯一情况是() // Note: This question is tricky, usually finally *always* executes unless JVM exits.
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. 异常处理代码无异常发生], // Finally executes
    [B. 异常处理代码中执行了 `System.exit(1)` 语句], // JVM exits, finally does not execute
    [C. 异常处理代码中执行了 `continue` 语句], // Finally executes before continue transfers control
    [D. 异常处理代码中执行了 `break` 语句], // Finally executes before break transfers control
  )
// System.exit() terminates the JVM, bypassing the normal execution flow including finally block execution.

+ 下列情况不属于异常的是()
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 用户输入错误], // Can lead to exceptions (e.g., InputMismatchException)
    [B. 设备错误], // Can lead to exceptions (e.g., IOException)
    [C. 代码错误], // Syntax errors caught at compile time, runtime errors are exceptions, logical errors are not exceptions. Ambiguous term.
    [D. 数据类型自动转换], // This is a language feature, not an error or exception.
  )
// Automatic type conversion (widening) is a standard operation. Code errors could mean syntax (compile-time) or logic (runtime without exception) or runtime exceptions. A & B often cause exceptions. D is definitely not an exception.

+ 假设要在 ”haut.oop.base” 包中定义一个 Employee 类, 该类中的 public 修饰的成员变量和成员方法只能被同一个包中的类(含当前类)所访问和使用, 下列符合需求的定义是() // Question contradicts itself: public allows access from anywhere, restricted access means default/protected/private. Assuming it means members *without* public modifier should be package-private.
  #grid(
    columns: 1,
    gutter: 10pt,
    [A. `package haut.oop.base; public class Employee { }`], // Public class, accessible everywhere. Default members are package-private.
    [B. `package haut.oop.base; class Employee{ }`], // Default (package-private) class, only accessible within haut.oop.base. All members also restricted to package access by default. This fits the restriction best.
    [C. `public class Employee{ }`], // No package declaration, belongs to default package. Public class.
    [D. `class Employee { }`], // No package declaration, default package. Default class access.
  )
// If the *class itself* and its members need to be restricted to the package, making the class default access (no `public` keyword) achieves this. Public members inside a default class are still only accessible within the package because the class itself isn't visible outside.

+ 假设 x 的初始值为 3, 则经过 `x = x += x -= x *= x` 运算后, 的值为()
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 1], [B. 0], [C. -3], [D. 3],
  )
// Evaluated right-to-left:
// x = 3
// x *= x  => x = 3 * 3 = 9
// x -= 9  => x = x - 9 => x = 3 - 9 = -6 (Original x value is used on RHS)
// x += -6 => x = x + (-6) => x = 3 + (-6) = -3 (Original x value is used on RHS)
// x = -3  => x = -3 (Final assignment)

+ 下列程序的输出是()
  #coder(```java
  public static void main(String[] args){
      int[] arr = new int[]{25, 28, 31, 30, 29};
      Arrays.sort(arr);
      System.out.println(Arrays.toString(arr));
  }
  ```)
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. `[25, 28, 29, 30, 31]`], // Correct output after sorting
    [B. `[25, 28, 29, 30, 31 ]`], // Extra space before last bracket
    [C. `[31, 30, 29, 28, 25]`], // Descending sort?
    [D. `(31, 30, 29, 28, 25)`], // Incorrect format
  )


+ 通过控制台进行输入时, 需要构造一个与“标准输入流” `System.in` 关联的对象是() // Duplicate of Q4? Assuming it might be intended differently, but the answer is the same.
  #grid(
    columns: 4,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. Scanner 对象], [B. Reader 对象], [C. String 对象], [D. Writer 对象],
  )


+ 已知 `"public class Manager extends Employee {....}"`, 在 Employee 中有一个 `"public double getSalary(){...}"` 方法, Manager 也有一个 `"public double getSalary(){...}"` 方法, 则这种现象叫做()
  #grid(
    columns: 2,
    gutter: 10pt,
    column-gutter: 1fr,
    [A. 方法的定义或实现],
    [B. 方法的覆盖或重写], // Subclass provides specific implementation for inherited method
    [C. 方法的重构或实现], // Refactoring is code restructuring, not this
    [D. 方法的继承或派生], // Inheritance allows this, but the phenomenon itself is overriding
  )



= 判断题


+ 类是相同行为和状态的诸多对象的统称。

+ 在对一个 long 型变量进行赋值时, 数字后面要加 L 或 l。
// Required if the number literal itself would exceed the int range, good practice otherwise.
+ 如果类中没有任何构造方法, 系统会自动创建一个不带参数的构造方法。

+ BigInteger 类可以实现任意精度的整数运算。

+ 运算符 && 和 & 是没有区别的。
// && is short-circuit AND, & is logical AND (always evaluates both sides). & is also bitwise AND.
+ 无参数构造器创建的对象, 对象的状态被为适当的默认值。
// Fields get default values (0, 0.0, false, null).
+ 通配符的限定若用 `<? extends Manager>` 来表示, 其含义这个通配符限制为 Manager 类及该类的所有父类型。
// `? extends Manager` means Manager or any *subclass* of Manager (Upper Bounded Wildcard).
+ `import static` 语句可以导入静态方法和静态字段。

+ 在 Java 语言中是不支持单重继承的, 但是可以使用接口机制来实现多重继承的功能。
// Java supports single *class* inheritance but multiple *interface* implementation, effectively achieving a form of multiple inheritance for type. The statement says Java doesn't support single inheritance which is false.
+ 在语句块内部可以访问之前在外部声明的变量。
// Inner blocks can access variables from enclosing blocks (scope rules).
+ 静态成员属于类, 不属于任何单个的对象。

+ 若循环体含有多条语句, 则必须置于一对花括号中, 否则视为语法错误。

+ Collections 是一个接口类, 进一步提供一系列的静态方法, 实现对集合的排序、替换、交换、搜索、拷贝等操作。
// `Collections` is a utility *class* (not interface) providing static methods for operating on collections. `Collection` is the root interface.
+ 子类对父类进行方法覆盖时, 需要返回值类型、函数名和参数列表都一模一样。
// (With allowance for covariant return types since Java 5).
+ 继承 `java.lang.Thread` 类和实现 `java.lang.Runnable` 接口是 Java 中实现多线程的两种方式。

+ 用链接存储结构存储的线性表称为链表。

+ 可以在变量声明的同时对其初始化。

+ 希望把异常向上交给调用这个方法的方法来处理, 可以通过 `throw` 语句来实现。
// `throw` is used to explicitly throw an exception instance. Declaring an exception with `throws` in the method signature indicates it might throw that exception, passing responsibility up.
+ 大数类中静态的 `valueOf` 可实现普通数值向大数的转化。
// `BigInteger.valueOf(long val)` and `BigDecimal.valueOf(double val)` exist.
+ 包的名字放在类文件的开头, 否则为无名包。

= 程序阅读题


+ 写出下列程序的输出
  #coder(```java
  int[] arr = {2, 3, 1, 5, 4, 6};
  Arrays.sort(arr);
  int index = Arrays.binarySearch(arr, 3);
  System.out.println(index);
  ```)


+ 阅读下面程序写出执行结果
  #coder(```java
  int k;
  for(k=1; k<=5; k++){
      if(k>4) break;
      System.out.println("k="+k);
  }
  ```)
  答案:
  ```
  k=1
  k=2
  k=3
  k=4
  ``` // Loop prints for k=1,2,3,4. When k=5, k>4 is true, break executes before println.

+ 数组是表示一个具有相同数据类型的数据元素的集合。在 Java 语言中, 数组被定义为一个对象, 每个元素相当于该对象的数据成员变量, 数组中的元素可以任何数据类型。请结合下面的程序回答后面的问题。
  #coder(```java
  public static void main(String[] args){
      int[][] a = {{1, 2}, {3, 4, 5, 6}, {7, 8, 9}, {}}; // Jagged array
      int len = a.length;
      int col1 = a[0].length;
      int col2 = a[1].length;
      int col3 = a[2].length;
      int col4 = a[3].length;

  }
  ```)
  (1) 上述程序中变量 `len`、`col1`、`col2`、`col3`、`col4` 的值依次是多少?\
  (2) 上述程序中 `a[1][1]`、`a[1][2]`、`a[1][3]` 的值依次是多少?\
  (3) 使用 for 循环语句编写一个程序片段实现对数组 a 中的所有元素进行求和。
#v(13cm)
+ 反转排序是以相反的顺序把原有数组的内容重新排序, 其基本思想是把数组最后一个元素与第一个元素替换, 倒数第二个元素与第二个元素替换, 依此类推, 直到把所有数组元素反转替换。请结合下面的反转排序的程序回答后面的问题。
  #coder(```java
  public class Sorter {
      public static void main(String[] args) {
          int[] arr = {10, 20, 30, 40, 50, 60};
          Sorter sorter = new Sorter();
          sorter.sort(arr);
          System.out.println(Arrays.toString(arr));
      }

      public void sort(int[] p) {
          int temp;
          int len = p.length;
          for (int i = 0; i < len / 2; i++) {
              temp = p[i];        // Line 1
              p[i] = p[len - 1 - i]; // Line 2
              p[len - 1 - i] = temp; // Line 3
          }
      }
  }
  ```)
  (1) 上述 for 循环语句中需填入 3 行代码, 该部分是反转排序的关键步骤, 请完善程序\
  (2) 上述程序执行后, 最终程序的输出是?
#v(10cm)

+ 已知一个类的定义如下, 请根据该类的定义回答后面的问题。
  #coder(```java
  import java.util.*;

  public class Pair<T extends AbstractList<Integer> & List<Integer> & RandomAccess, U> { nteger->Integer
      private T first;
      private U second;

      public Pair(T first, U second) { // Constructor
          this.first = first;
          this.second = second;
      }

      public T getFirst() {
          return first;
      }

      public U getSecond() {
          return second;
      }

      public void setFirst(T newValue) { // Corrected assignment
          first = newValue;
      }

      public void setSecond(U newValue) {
          second = newValue;
      }
  }
  ```)
  (1) 该类用到了 Java 中的什么机制?\
  (2) 在类中 `"T extends AbstractList<Integer> & List<Integer> & RandomAccess"` 和 `"U"` 表示含义分别是什么?\
  (3) 在类的定义中有 `AbstractList<Integer>`、`List<Integer>`、`RandomAccess` 三个类型限定, 这三个限定是 T 必须满足的要求。哪些可以满足? 哪些不可以?\
  (4) 按下列方式使用该类创建对象是否合法:
  ```java
  (a) Pair<ArrayList<Integer>, Double> t = new Pair<ArrayList<Integer>, Double>();
  (b) Pair<ArrayList<String>, Integer> t = new Pair<ArrayList<String>,Integer>();
  (c) Pair<ArrayList<Integer>, Float> t = new Pair<ArrayList<Integer>, Float>();
  ```

#v(7cm)


= 程序设计题
+ 请设计并编写一个同时满足下列所有需求的抽象类:
  #set enum(numbering: "(1)")
  + 该类是抽象类, 类名为 `Shapes`, 其所在的包名为 `oop.core.base`, 该类可以通过 `import` 语句被其他包中的类所访问到;
  + 该类中有两个 `int` 类型的成员变量, 变量名分别为 `width` 和 `height`, 这两个变量可以被同一个包中的类以及该类的所有子类访问到;
  + 该类含有一个构造方法, 该构造方法需传进去两个 `int` 类型的参数, 参数名称分别为 `width`, `height`, 该构造方法使用 `this` 关键字实现了对其成员变量 `width` 和 `height` 的初始化;
  + 该类中含有一个方法名为 `getArea` 的抽象方法, 该方法无输入参数且其返回值为 `double` 类型;
  + 该类中含有一个方法名为 `getPerimeter` 的抽象方法, 该方法无输入参数且其返回值为 `double` 类型。
  #v(6cm)

+ 请设计并编写一个同时满足下列所有需求的类。
  #set enum(numbering: "(1)")
  + 该类的类名为 `Square`, 其包名为 `oop.core`, 该类可以通过 `import` 语句被其他包中的类所访问到, 该类继承了第 1 题中的抽象类 `Shapes`;
  + 该类有一个构造方法, 该构造方法含有两个 `int` 型输入参数, 参数名称分别为 `width`, `height`, 该构造方法通过 `super` 关键字实现了对其父类成员变量的初始化;
  + 该类对其父类的 `getArea` 方法进行了实现, 要求返回面积, 即计算 `width * height` 的值;
  + 该类对其父类的 `getPerimeter` 方法进行了实现, 要求返回周长, 即 `2 * (width + height)` 的值。

#v(6cm)
+ 请设计并编写一个满足下列需求的接口。 // Re-interpreting the request based on common patterns
  (1) 定义一个接口 `Shapes`, 其所在的包名为 `oop.core.base`;
  (2) 定义返回值为 `double` 类型并且无输入参数的 public 抽象方法, 其中方法名为 `getArea`;
  (3) 定义返回值为 `double` 类型并且无输入参数的 public 抽象方法, 其中方法名为 `getPerimeter`。

+ 请设计并编写一个同时满足下列所有需求的类。
  (1) 定义一个 public 类 `Square`, 其包名为 `oop.core`, 且该类实现了第 1 题中的接口 `Shapes`; // Assuming this refers to the interface described above now
  (2) 在类 `Square` 中定义两个 `double` 类型的 public 成员变量, 其中成员变量名为: `width`, `height`;
  (3) 用带有两个形式参数的 public 构造方法对 `Square` 类中的成员变量进行初始化, 其中形式参数名为: `width`, `height`;
  (4) 在 `Square` 类中对 `getArea` 方法进行实现, 返回面积, 即 `width * height`;
  (5) 在 `Square` 类中对 `getPerimeter` 方法进行实现, 返回周长, 即 `2 * (width + height)`。

+ 在第 1 题和第 2 题的基础之上, 仔细阅读程序, 写出下列程序的输出结果。

