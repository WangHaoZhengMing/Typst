#set text(
  font: "PingFang SC",
  size: 11pt,
)
#show raw: code => {
  block(
    width: 100%,
    inset: 2em,
    fill: rgb("#F6F8FA"),
    radius: 8pt,
  )[#v(-4pt)
    #text(size: 25pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
    #text(size: 25pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
    #text(size: 25pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
    #v(-5pt)
    #text(size: 12pt, font: "SF Mono")[#code]
  ]
}
#set page(margin: (x: 1cm, y: 2cm))
#align(center)[
  #text(size: 1.2em)[#strong[河南工业大学 #underline[Java程序设计实验] 实验报告]]

  #v(0.5em)
  专业班级：#underline("计科 2301") 学号：#underline("231040100116") 姓名：#underline("王浩然") 指导老师： 评分：
]

+ #strong[实验题目];：实验（5）：接口、内部类、匿名类和异常类

+ #strong[实验目的];：1. 熟悉Java 中的接口；2.理解内部类；3.
  理解匿名类；4.理解异常类。

+ #strong[实验要求：1. 每个题目，写出实验思路；2. 代码实现；3.
    运行结果截图。]

+ #strong[实验内容];：

  1. 编写应用程序，从命令行输入两个数据，求它们的商。要求程序能够捕获NumberFormatException异常和ArithmeticException异常。

  2. 设计一个训练场，这个训练场专门训练海豚，使它们能够跳舞dance（）和发出“呼呼”的声音cry（），要求用内部类实现该训练场。

  3. 创建一个名称为Vehicle的接口，在接口中添加两个方法start()和stop()；创建Bike和Bus两个类，它们实现Vehicle接口；最后，创建一个名称为InterfaceDemo的测试类，在该类的main()方法中创建Bike和Bus对象，并调用start()和stop()方法，要求运用接口回调。

  4. 假设Computable是一个接口，该接口含有一个compute()方法，参数自定义。然后，编写一个用于计算的测试类，该程序有一个方法ToCompute（Computable
  c）方法，可以计算加法和乘法，要求测试类中运用匿名类实现功能。

  5. 模拟火车站安检，编写java程序，要求如下：

    (1)编写一个异常类goodsException，该类包括toPrint（）方法，输出“该物品是违禁品”；

    (2)编写一个检测工具类Tool，该类中有checkGoods（Goods
    g）方法，当参数g是违禁品时，将抛出goodsException对象；

    (3)编写一个Goods类，该类中包含如下方法：设置物品是否是违禁品的方法setIsDanger（boolean
    b）（默认否），判定物品是否是违禁品的方法isDanger（），如果是违禁品，返回ture，否则false；设置物品的名字的方法setName（String
    n）；返回物品名字的方法getName（）；

    (4)编写测试类，创建一个Goods类对象“explosive”，并设置该物品是违禁品，然后模拟检测到该物品是违禁品。

#block[
  #set enum(numbering: "1.", start: 5)
  + #strong[实验执行：]
]

1. 编写应用程序，从命令行输入两个数据，求它们的商。要求程序能够捕获NumberFormatException异常和ArithmeticException异常。

  （1）思路

  从命令行读取两个字符串参数，并将其转换为数字。程序需要处理两种异常：当输入的不是有效数字时抛出的NumberFormatException，以及当除数为0时抛出的ArithmeticException。使用try-catch块来捕获并处理这些异常，并给用户提供相应的错误信息。

  （2）代码实现

  ```java
  public class DivideNumbers {
      public static void main(String[] args) {
          if (args.length < 2) {
              System.out.println("请提供两个数字作为参数");
              return;
          }

          try {
              double numerator = Double.parseDouble(args[0]);
              double denominator = Double.parseDouble(args[1]);

              if (denominator == 0) {
                  throw new ArithmeticException("除数不能为0");
              }

              double result = numerator / denominator;
              System.out.println(args[0] + " / " + args[1] + " = " + result);
          } catch (NumberFormatException e) {
              System.out.println("输入的参数不是有效的数字: " + e.getMessage());
          } catch (ArithmeticException e) {
              System.out.println("算术错误: " + e.getMessage());
          }
      }
  }
  ```

  （3）运行结果截图

  #block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
    #text(font: "SF Mono", size: 10pt, fill: white)[
      (base) user\@MacBook \~/JavaProjects % javac DivideNumbers.java\
      (base) user\@MacBook \~/JavaProjects % java DivideNumbers 10 2\
      10 / 2 = 5.0\
      (base) user\@MacBook \~/JavaProjects % java DivideNumbers 10 0\
      算术错误: 除数不能为0\
      (base) user\@MacBook \~/JavaProjects % java DivideNumbers 10 abc\
      输入的参数不是有效的数字: For input string: "abc"\
    ]
  ]

2. 设计一个训练场，这个训练场专门训练海豚，使它们能够跳舞dance（）和发出"呼呼"的声音cry（），要求用内部类实现该训练场。

  （1）思路

  创建一个训练场类（TrainingGround），其中包含一个内部类海豚（Dolphin）。内部类实现dance()和cry()方法，展示海豚的训练能力。训练场可以创建海豚并指导它们表演。

  （2）代码实现

  ```java
  public class TrainingGround {
      private String name;

      public TrainingGround(String name) {
          this.name = name;
      }

      // 海豚内部类
      class Dolphin {
          private String dolphinName;

          public Dolphin(String dolphinName) {
              this.dolphinName = dolphinName;
          }

          public void dance() {
              System.out.println(dolphinName + "在" + name + "训练场优雅地跳舞");
          }

          public void cry() {
              System.out.println(dolphinName + "发出"呼呼"的声音");
          }
      }

      public void trainDolphin(String dolphinName) {
          Dolphin dolphin = new Dolphin(dolphinName);
          System.out.println("开始训练海豚" + dolphinName);
          dolphin.dance();
          dolphin.cry();
          System.out.println("训练结束");
      }

      public static void main(String[] args) {
          TrainingGround ground = new TrainingGround("海洋世界");
          ground.trainDolphin("小白");
          ground.trainDolphin("海海");
      }
  }
  ```

  （3）运行结果截图

  #block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
    #text(font: "SF Mono", size: 10pt, fill: white)[
      (base) user\@MacBook \~/JavaProjects % javac TrainingGround.java\
      (base) user\@MacBook \~/JavaProjects % java TrainingGround\
      开始训练海豚小白\
      小白在海洋世界训练场优雅地跳舞\
      小白发出"呼呼"的声音\
      训练结束\
      开始训练海豚海海\
      海海在海洋世界训练场优雅地跳舞\
      海海发出"呼呼"的声音\
      训练结束\
    ]
  ]

3. 创建一个名称为Vehicle的接口，在接口中添加两个方法start()和stop()；创建Bike和Bus两个类，它们实现Vehicle接口；最后，创建一个名称为InterfaceDemo的测试类，在该类的main()方法中创建Bike和Bus对象，并调用start()和stop()方法，要求运用接口回调。

  （1）思路

  首先定义Vehicle接口，包含start()和stop()方法。然后创建Bike和Bus类实现该接口。最后，创建一个测试类InterfaceDemo，使用接口回调的方式调用这些方法，即通过Vehicle接口引用指向具体实现类的对象。

  （2）代码实现

  ```java
  // Vehicle接口
  interface Vehicle {
      void start();
      void stop();
  }

  // Bike类实现Vehicle接口
  class Bike implements Vehicle {
      @Override
      public void start() {
          System.out.println("自行车开始骑行");
      }

      @Override
      public void stop() {
          System.out.println("自行车停止骑行");
      }
  }

  // Bus类实现Vehicle接口
  class Bus implements Vehicle {
      @Override
      public void start() {
          System.out.println("公共汽车启动");
      }

      @Override
      public void stop() {
          System.out.println("公共汽车停车");
      }
  }

  // 测试类
  public class InterfaceDemo {
      // 接口回调方法
      public static void testVehicle(Vehicle v) {
          v.start();
          v.stop();
      }

      public static void main(String[] args) {
          Vehicle bike = new Bike();
          Vehicle bus = new Bus();

          System.out.println("测试自行车:");
          testVehicle(bike);

          System.out.println("\n测试公共汽车:");
          testVehicle(bus);
      }
  }
  ```

  （3）运行结果截图

  #block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
    #text(font: "SF Mono", size: 10pt, fill: white)[
      (base) user\@MacBook \~/JavaProjects % javac InterfaceDemo.java\
      (base) user\@MacBook \~/JavaProjects % java InterfaceDemo\
      测试自行车:\
      自行车开始骑行\
      自行车停止骑行\
      \
      测试公共汽车:\
      公共汽车启动\
      公共汽车停车\
    ]
  ]

4. 假设Computable是一个接口，该接口含有一个compute()方法，参数自定义。然后，编写一个用于计算的测试类，该程序有一个方法ToCompute（Computable c）方法，可以计算加法和乘法，要求测试类中运用匿名类实现功能。

  （1）思路

  首先定义Computable接口，包含compute()方法。然后创建一个CalculationTest测试类，其中包含ToCompute()方法接收Computable接口类型的参数。在main方法中使用匿名类实现加法和乘法的计算功能。

  （2）代码实现

  ```java
  // Computable接口
  interface Computable {
      double compute(double a, double b);
  }

  // 测试类
  public class CalculationTest {
      // 计算方法，接收Computable对象作为参数
      public static void ToCompute(Computable c, double x, double y) {
          double result = c.compute(x, y);
          System.out.println("计算结果: " + result);
      }

      public static void main(String[] args) {
          double a = 10, b = 5;

          System.out.println("使用匿名类实现加法:");
          // 使用匿名类实现加法
          ToCompute(new Computable() {
              @Override
              public double compute(double a, double b) {
                  System.out.println("执行加法: " + a + " + " + b);
                  return a + b;
              }
          }, a, b);

          System.out.println("\n使用匿名类实现乘法:");
          // 使用匿名类实现乘法
          ToCompute(new Computable() {
              @Override
              public double compute(double a, double b) {
                  System.out.println("执行乘法: " + a + " × " + b);
                  return a * b;
              }
          }, a, b);
      }
  }
  //为什么要这样的 complex ?
  ```

  ```swift
  // 简单的计算函数
  func calculate(_ a: Double, _ b: Double, operation: (Double, Double) -> Double) {
    let result = operation(a, b)
    print("结果: \(result)")
  }

  func main() {
      let a = 10.0
      let b = 5.0

      print("加法:")
      calculate(a, b) { (x, y) in
          print("\(x) + \(y) = \(x + y)")
          return x + y
      }

      print("\n乘法:")
      calculate(a, b) { (x, y) in
          print("\(x) × \(y) = \(x * y)")
          return x * y
      }
  }

  main()

  ```
  （3）运行结果截图

  #block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
    #text(font: "SF Mono", size: 10pt, fill: white)[
      (base) user\@MacBook \~/JavaProjects % javac CalculationTest.java\
      (base) user\@MacBook \~/JavaProjects % java CalculationTest\
      使用匿名类实现加法:\
      执行加法: 10.0 + 5.0\
      计算结果: 15.0\
      \
      使用匿名类实现乘法:\
      执行乘法: 10.0 × 5.0\
      计算结果: 50.0\
    ]
  ]

5. 模拟火车站安检，编写java程序，要求如下：

  （1）思路

  按照题目要求，创建三个类：
  - goodsException异常类，包含toPrint()方法
  - Tool检测工具类，包含checkGoods()方法
  - Goods物品类，包含相关方法
  最后创建测试类模拟安检过程。

  （2）代码实现

  ```java
  // 自定义异常类
  class goodsException extends Exception {
      public void toPrint() {
          System.out.println("该物品是违禁品");
      }
  }

  // 物品类
  class Goods {
      private String name;
      private boolean isDanger = false;

      public void setIsDanger(boolean b) {
          this.isDanger = b;
      }

      public boolean isDanger() {
          return isDanger;
      }

      public void setName(String n) {
          this.name = n;
      }

      public String getName() {
          return name;
      }
  }

  // 检测工具类
  class Tool {
      public void checkGoods(Goods g) throws goodsException {
          System.out.println("正在检查物品: " + g.getName());
          if (g.isDanger()) {
              throw new goodsException();
          } else {
              System.out.println("该物品不是违禁品，可以通过");
          }
      }
  }

  // 测试类
  public class SecurityCheckDemo {
      public static void main(String[] args) {
          // 创建一个违禁品"爆炸物"
          Goods explosive = new Goods();
          explosive.setName("爆炸物");
          explosive.setIsDanger(true);

          // 创建一个正常物品"书籍"
          Goods book = new Goods();
          book.setName("书籍");
          book.setIsDanger(false);

          // 创建检测工具
          Tool securityTool = new Tool();

          // 检查物品
          try {
              securityTool.checkGoods(book);
              System.out.println("-------------");
              securityTool.checkGoods(explosive);
          } catch (goodsException e) {
              System.out.println("检测到违禁品！");
              e.toPrint();
          }
      }
  }
  ```

  （3）运行结果截图

  #block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
    #text(font: "SF Mono", size: 10pt, fill: white)[
      (base) user\@MacBook \~/JavaProjects % javac SecurityCheckDemo.java\
      (base) user\@MacBook \~/JavaProjects % java SecurityCheckDemo\
      正在检查物品: 书籍\
      该物品不是违禁品，可以通过\
      -------------\
      正在检查物品: 爆炸物\
      检测到违禁品！\
      该物品是违禁品\
    ]
  ]

#block[
  #set enum(numbering: "1.", start: 6)
  + #strong[实验测试中遇到的问题和自己的解决方案]
]


1. *命令行参数的处理问题*：在第一个程序中，最初没有对命令行参数的数量进行检查，导致当用户没有提供足够参数时出现数组越界异常。解决方案是在程序开始时检查args数组的长度，确保有足够的参数。

2. *异常处理的顺序问题*：在异常处理时，最初将ArithmeticException放在NumberFormatException之前捕获，但发现当输入非数字时，代码无法正确识别异常类型。解决方案是调整异常捕获的顺序，确保特定的异常在更一般的异常之前被捕获。

3. *内部类访问外部类成员*：在第二个训练场程序中，内部类Dolphin需要访问外部类的name属性。学习到内部类可以直接访问外部类的所有成员（包括私有成员），不需要特殊处理。

4. *接口回调理解问题*：最初对接口回调的概念理解不清楚。通过学习，明白了接口回调是指通过接口类型的引用变量来调用不同实现类中的方法，实现了多态性。

5. *匿名类语法问题*：在使用匿名类实现Computable接口时，忘记了在方法调用结束后加分号，导致编译错误。通过仔细学习匿名类的语法结构解决了这个问题.
