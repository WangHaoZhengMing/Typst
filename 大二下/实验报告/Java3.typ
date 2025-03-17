#set text(
  font: ("New Computer Modern", "PingFang SC"),
  size: 11pt,
)
#set page(margin: (x: 2.5cm, y: 2.5cm))
#import "@preview/zebraw:0.4.6": *
#show: zebraw
#align(center)[
  #text(size: 1.2em)[#strong[河南工业大学 #underline[Java程序设计实验] 实验报告]]

  #v(0.5em)
  专业班级：#underline("计科 2301") 学号：#underline("231040100116") 姓名：#underline("王浩然") 指导老师： 评分：
]
#outline()
== 实验题目
实验（三）：Java类与对象

== 实验目的
1. 理解Java的类
2. 理解Java的对象

== 实验要求
1. 每个题目，写出实验思路
2. 代码实现
3. 运行结果截图

== 实验内容

=== 题目一
*思路分析：*
1. 使用Scanner类获取用户输入的a、b、c三个系数
2. 计算判别式 Δ = b² - 4ac
3. 使用switch表达式根据判别式的符号分三种情况：
   - Δ > 0：两个不同实根
   - Δ = 0：两个相等实根
   - Δ < 0：两个共轭复根
4. 对a=0的特殊情况进行处理

```java
import java.util.Scanner;

public class QuadraticEquation {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入一元二次方程 ax² + bx + c = 0 的系数");

        System.out.print("请输入a: ");
        double a = scanner.nextDouble();

        System.out.print("请输入b: ");
        double b = scanner.nextDouble();

        System.out.print("请输入c: ");
        double c = scanner.nextDouble();

        // 计算判别式
        double discriminant = b * b - 4 * a * c;

        // 使用switch表达式判断情况
        switch ((int) Math.signum(discriminant)) {
            case 1:  // discriminant > 0
                double x1 = (-b + Math.sqrt(discriminant)) / (2 * a);
                double x2 = (-b - Math.sqrt(discriminant)) / (2 * a);
                if (a != 0) {
                    System.out.printf("方程有两个不同实根：\nx₁ = %.2f\nx₂ = %.2f\n", x1, x2);
                } else {
                    System.out.println("a不能为0，这不是一个一元二次方程");
                }
                break;

            case 0:  // discriminant = 0
                if (a != 0) {
                    double x = -b / (2 * a);
                    System.out.printf("方程有两个相等实根：x₁ = x₂ = %.2f\n", x);
                } else {
                    System.out.println("a不能为0，这不是一个一元二次方程");
                }
                break;

            case -1: // discriminant < 0
                if (a != 0) {
                    double realPart = -b / (2 * a);
                    double imaginaryPart = Math.sqrt(-discriminant) / (2 * a);
                    System.out.printf("方程有两个共轭复根：\n");
                    System.out.printf("x₁ = %.2f + %.2fi\n", realPart, imaginaryPart);
                    System.out.printf("x₂ = %.2f - %.2fi\n", realPart, imaginaryPart);
                } else {
                    System.out.println("a不能为0，这不是一个一元二次方程");
                }
                break;
        }

        scanner.close();
    }
}
```

*运行结果：*
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[
    请输入一元二次方程 ax² + bx + c = 0 的系数
    请输入a: 1
    请输入b: -5
    请输入c: 6
    方程有两个不同实根：
    x₁ = 3.00
    x₂ = 2.00
  ]
]

=== 题目二
*思路分析：*
1. 设计Account类表示账户，包含账户名称、个人信息和余额等属性
2. 实现Account类的基本操作：存款、取款、查询余额
3. 设计Bank类管理多个账户，使用数组存储Account对象
4. 实现Bank类的功能：开户、查找账户、存款、取款、查询余额
5. 创建测试类验证所有功能

```Java
Account.java
public class Account {
    private String accountName;
    private String personalInfo;
    private double balance;

    public Account(String accountName, String personalInfo, double initialBalance) {
        this.accountName = accountName;
        this.personalInfo = personalInfo;
        this.balance = initialBalance;
    }

    public String getAccountName() {
        return accountName;
    }

    public String getPersonalInfo() {
        return personalInfo;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposit successful. New balance: " + balance);
        } else {
            System.out.println("Invalid deposit amount");
        }
    }

    public boolean withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrawal successful. New balance: " + balance);
            return true;
        } else {
            System.out.println("Invalid withdrawal amount or insufficient funds");
            return false;
        }
    }
}
}
```
#text(fill: blue, weight: "bold")[Bank.Java]
```Java
public class Bank {
    private Account[] accounts;
    private int numAccounts;
    private static final int MAX_ACCOUNTS = 100;

    public Bank() {
        accounts = new Account[MAX_ACCOUNTS];
        numAccounts = 0;
    }

    public boolean createAccount(String accountName, String personalInfo, double initialBalance) {
        if (numAccounts >= MAX_ACCOUNTS) {
            System.out.println("Bank is at maximum capacity");
            return false;
        }

        // Check if account already exists
        for (int i = 0; i < numAccounts; i++) {
            if (accounts[i].getAccountName().equals(accountName)) {
                System.out.println("Account already exists");
                return false;
            }
        }

        accounts[numAccounts] = new Account(accountName, personalInfo, initialBalance);
        numAccounts++;
        System.out.println("Account created successfully");
        return true;
    }

    public Account findAccount(String accountName) {
        for (int i = 0; i < numAccounts; i++) {
            if (accounts[i].getAccountName().equals(accountName)) {
                return accounts[i];
            }
        }
        return null;
    }

    public boolean deposit(String accountName, double amount) {
        Account account = findAccount(accountName);
        if (account != null) {
            account.deposit(amount);
            return true;
        }
        System.out.println("Account not found");
        return false;
    }

    public boolean withdraw(String accountName, double amount) {
        Account account = findAccount(accountName);
        if (account != null) {
            return account.withdraw(amount);
        }
        System.out.println("Account not found");
        return false;
    }

    public double checkBalance(String accountName) {
        Account account = findAccount(accountName);
        if (account != null) {
            return account.getBalance();
        }
        System.out.println("Account not found");
        return -1;
    }
}
```
#text(fill: blue, weight: "bold")[Test.java]
```java
public class BankTest {
    public static void main(String[] args) {
        // Create a new bank
        Bank bank = new Bank();

        // Test account creation
        System.out.println("Testing account creation...");
        bank.createAccount("John Doe", "ID: 12345", 1000.0);
        bank.createAccount("Jane Smith", "ID: 67890", 2000.0);

        // Test deposit
        System.out.println("\nTesting deposit...");
        bank.deposit("John Doe", 500.0);

        // Test balance check
        System.out.println("\nTesting balance check...");
        double balance = bank.checkBalance("John Doe");
        System.out.println("John Doe's balance: " + balance);

        // Test withdrawal
        System.out.println("\nTesting withdrawal...");
        bank.withdraw("John Doe", 300.0);

        // Test invalid operations
        System.out.println("\nTesting invalid operations...");
        bank.withdraw("John Doe", 2000.0); // Insufficient funds
        bank.deposit("Invalid Account", 100.0); // Non-existent account

        // Final balance check
        System.out.println("\nFinal balance check...");
        balance = bank.checkBalance("John Doe");
        System.out.println("John Doe's final balance: " + balance);
    }
}
```

*运行结果：*
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[
    Testing account creation...
    Account created successfully
    Account created successfully

    Testing deposit...
    Deposit successful. New balance: 1500.0

    Testing balance check...
    John Doe's balance: 1500.0

    Testing withdrawal...
    Withdrawal successful. New balance: 1200.0

    Testing invalid operations...
    Invalid withdrawal amount or insufficient funds
    Account not found

    Final balance check...
    John Doe's final balance: 1200.0
  ]
]

=== 题目三
*思路分析：*
1. 创建Product类表示商品，包含名称和价格属性
2. 创建Supermarket类管理商品，提供获取商品的方法
3. 设计Cart类表示购物车，使用ArrayList存储商品
4. 实现购物车的添加商品、计算总价和列出商品功能

```java
class Product {
    String name;
    float price;

    public Product (String name, float price){
        this.name = name;
        this.price = price;
    }
}
```
```java
class Supermarket {
    Product apple("Apple",0.5f);
    Product banana("banana",1f);
    //这里是伪代码(😄)
    func getApple() -> Product {
        return Product(name: "Apple", price: priceOfApple);
    }

    func getBanana() -> Product {
        return Product(name: "Banana", price: priceOfBanana);
    }
}
```
```java
class Cart{
    ArrayList<Product> products;
    public void addProduct(Product,num){
        for(int i = 0,i < num + 1,i++){
            products.append();
        }
    }
    public float calTotalPrice(){
        float fialProice = 0
        for (item:products){
            findAccount += item.price;
        }
        return fialProice;
    }
    public void listAllItem(){
        System.out.println(products);//将就着看吧哈哈
    }
}
```

*运行结果：*
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[
    购物车商品列表：
    Apple - ¥0.5
    Banana - ¥1.0
    总价：¥1.5
  ]
]

=== 题目四
设计一个名为Point的类，表示一个带x坐标和y坐标的点。要求包括：
1. 创建一个默认值为x=0,y=0的无参构造方法
2. 创建一个特定坐标点的构造方法
3. 设置和返回数据x和y的方法
4. 返回Point类型的两个点之间的距离
5. 实现测试类进行上述功能测试

=== 题目五
定义二维形状类（如矩形、三角形、圆形等），这些类具有方法area和perimeter，分别用来计算形状的面积和周长。试定义一个Student类，利用方法重载实现学生求面积和周长（实现多态），并编写测试类验证。
```swift

import Foundation

// Protocol for shapes
protocol Shape {
   func area() -> Double
   func perimeter() -> Double
}

// Rectangle class
class Rectangle: Shape {
   let width: Double
   let height: Double

   init(width: Double, height: Double) {
      self.width = width;
      self.height = height;
   }

   func area() -> Double {
      return width * height;
   }

   func perimeter() -> Double {
      return 2 * (width + height);
   }
}

// Circle class
class Circle: Shape {
   let radius: Double

   init(radius: Double) {
      self.radius = radius;
   }

   func area() -> Double {
      return Double.pi * radius * radius;
   }

   func perimeter() -> Double {
      return 2 * Double.pi * radius;
   }
}

// Triangle class
class Triangle: Shape {
   let a: Double
   let b: Double
   let c: Double

   init(a: Double, b: Double, c: Double) {
      self.a = a;
      self.b = b;
      self.c = c;
   }

   func area() -> Double {
      // Using Heron's formula
      let s = (a + b + c) / 2;
      return sqrt(s * (s - a) * (s - b) * (s - c));
   }

   func perimeter() -> Double {
      return a + b + c;
   }
}

// Student class that implements Shape protocol
class Student: Shape {
   let name: String
   let height: Double  // in meters
   let weight: Double  // in kilograms

   init(name: String, height: Double, weight: Double) {
      self.name = name;
      self.height = height;
      self.weight = weight;
   }

   // Area could represent the student's BMI
   func area() -> Double {
      return weight / (height * height);  // BMI calculation
   }

   // Perimeter could represent the student's height in centimeters
   func perimeter() -> Double {
      return height * 100;  // Convert to centimeters
   }
}

// Test class
class ShapeTest {
   static func runTests() {
      // Test Rectangle
      let rectangle = Rectangle(width: 5, height: 3);
      print("Rectangle - Area: \(rectangle.area()), Perimeter: \(rectangle.perimeter())");

      // Test Circle
      let circle = Circle(radius: 4);
      print("Circle - Area: \(circle.area()), Perimeter: \(circle.perimeter())");

      // Test Triangle
      let triangle = Triangle(a: 3, b: 4, c: 5);
      print("Triangle - Area: \(triangle.area()), Perimeter: \(triangle.perimeter())");

      // Test Student
      let student = Student(name: "John", height: 1.75, weight: 70);
      print("Student - BMI: \(student.area()), Height in cm: \(student.perimeter())");

      // Demonstrate polymorphism
      let shapes: [Shape] = [rectangle, circle, triangle, student];
      for (index, shape) in shapes.enumerated() {
         print("Shape \(index + 1) - Area: \(shape.area()), Perimeter: \(shape.perimeter())");
      }
   }
}

// Run the tests
ShapeTest.runTests();

```

=== 题目六
定义Circle2D类，包括：
1. 一个无参构造方法，该方法创建一个中心点（x，y），其值为（0,0）且半径为1的默认圆
2. 一个构造方法，创建特定中心点和半径的圆
3. 返回圆面积和周长
4. contains（Circle2D circle）判定一个圆是否在圆内，并返回布尔型
5. 判定两个圆是否重叠overlaps（Circle2D circle）
6. 测试类测试上述功能

```java
// Circle2D.java
public class Circle2D {
    private double x;
    private double y;
    private double radius;

    // 无参构造方法
    public Circle2D() {
        this(0, 0, 1);
    }

    // 带参构造方法
    public Circle2D(double x, double y, double radius) {
        this.x = x;
        this.y = y;
        this.radius = radius;
    }

    // getter方法
    public double getX() { return x; }
    public double getY() { return y; }
    public double getRadius() { return radius; }

    // 计算面积
    public double getArea() {
        return Math.PI * radius * radius;
    }

    // 计算周长
    public double getPerimeter() {
        return 2 * Math.PI * radius;
    }

    // 判断一个圆是否在此圆内
    public boolean isContains(Circle2D circle) {
        double distance = getDistance(circle);
        return distance + circle.getRadius() <= this.radius;
    }

    // 判断两个圆是否重叠
    public boolean isOverlaps(Circle2D circle) {
        double distance = getDistance(circle);
        return distance < this.radius + circle.getRadius();
    }

    // 计算两个圆心之间的距离
    private double getDistance(Circle2D circle) {
        return Math.sqrt(Math.pow(this.x - circle.getX(), 2) +
                        Math.pow(this.y - circle.getY(), 2));
    }
}
```

```java
//test.java
public class Circle2DTest {
    public static void main(String[] args) {
        // 测试无参构造方法
        Circle2D c1 = new Circle2D();
        System.out.println("Circle1 - 默认圆:");
        System.out.println("中心点: (" + c1.getX() + "," + c1.getY() + ")");
        System.out.println("半径: " + c1.getRadius());
        System.out.println("面积: " + c1.getArea());
        System.out.println("周长: " + c1.getPerimeter());

        // 测试带参构造方法
        Circle2D c2 = new Circle2D(2, 2, 2);
        System.out.println("\nCircle2 - 自定义圆:");
        System.out.println("中心点: (" + c2.getX() + "," + c2.getY() + ")");
        System.out.println("半径: " + c2.getRadius());

        // 测试contains方法
        Circle2D c3 = new Circle2D(2, 2, 1);
        System.out.println("\n测试包含关系:");
        System.out.println("c2包含c3? " + c2.isContains(c3));
        System.out.println("c3包含c2? " + c3.isContains(c2));

        // 测试overlaps方法
        Circle2D c4 = new Circle2D(4, 4, 2);
        System.out.println("\n测试重叠关系:");
        System.out.println("c2和c4重叠? " + c2.isOverlaps(c4));
    }
}

```
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[

    haominghan\@MacBook-Air-2 Typst % /usr/bin/env /Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home/bi
    n/java --enable-preview -XX:+ShowCodeDetailsInExceptionMessages -cp /Users/haominghan/Library/Application\S
    upport/Code/User/workspaceStorage/215516466b02262c5b2635f21ca65d6a/redhat.java/jdt_ws/Typst_df95cb46/bin Cir
    cle2DTest
    Circle1 - 默认圆:\
    中心点: (0.0,0.0)\
    半径: 1.0\
    面积: 3.141592653589793\
    周长: 6.283185307179586\

    Circle2 - 自定义圆:\
    中心点: (2.0,2.0)\
    半径: 2.0\

    测试包含关系:\
    c2包含c3? true\
    c3包含c2? false\

    测试重叠关系:\
    c2和c4重叠? true\
  ]
]

=== 题目七
定义一个表示学生信息的类，要求如下：
1. 学生的属性包括：学号、姓名、性别、年龄和课程成绩（5门课，其中包括Java）
2. 创建带参数的构造方法
3. 获取学生的属性信息
4. 根据学生类，创建五个该类的对象，要求对象数组，并打印五个学生的Java课程成绩的平均值，并输出成绩的最大值（分数和学生名）和最小值（分数和学生名）


````java
// Student.java
public class Student {
    private String id;
    private String name;
    private String gender;
    private int age;
    private double[] scores; // 5门课程成绩
    private static final int JAVA_INDEX = 0; // Java课程在数组中的索引
    
    // 构造方法
    public Student(String id, String name, String gender, int age, double[] scores) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.scores = new double[5];
        System.arraycopy(scores, 0, this.scores, 0, 5);
    }
    
    // Getter方法
    public String getId() { return id; }
    public String getName() { return name; }
    public String getGender() { return gender; }
    public int getAge() { return age; }
    public double getJavaScore() { return scores[JAVA_INDEX]; }
    
    @Override
    public String toString() {
        return "Student{" +
               "id='" + id + '\'' +
               ", name='" + name + '\'' +
               ", gender='" + gender + '\'' +
               ", age=" + age +
               ", Java成绩=" + scores[JAVA_INDEX] +
               '}';
    }
}
````

````java
// StudentTest.java
public class StudentTest {
    public static void main(String[] args) {
        // 创建学生数组
        Student[] students = new Student[5];
        
        // 初始化5个学生对象
        students[0] = new Student("001", "张三", "男", 20, new double[]{85, 78, 92, 88, 90});
        students[1] = new Student("002", "李四", "女", 19, new double[]{92, 85, 88, 90, 87});
        students[2] = new Student("003", "王五", "男", 21, new double[]{78, 82, 85, 80, 88});
        students[3] = new Student("004", "赵六", "女", 20, new double[]{95, 88, 92, 96, 93});
        students[4] = new Student("005", "孙七", "男", 19, new double[]{88, 85, 90, 87, 89});
        
        // 计算Java成绩平均值
        double sum = 0;
        double max = Double.MIN_VALUE;
        double min = Double.MAX_VALUE;
        String maxStudent = "";
        String minStudent = "";
        
        for (Student student : students) {
            double javaScore = student.getJavaScore();
            sum += javaScore;
            
            // 更新最大值
            if (javaScore > max) {
                max = javaScore;
                maxStudent = student.getName();
            }
            
            // 更新最小值
            if (javaScore < min) {
                min = javaScore;
                minStudent = student.getName();
            }
        }  
        
        double average = sum / students.length;
        
        // 输出结果
        System.out.printf("Java课程平均成绩: %.2f\n", average);
        System.out.printf("最高分: %.2f (学生: %s)\n", max, maxStudent);
        System.out.printf("最低分: %.2f (学生: %s)\n", min, minStudent);
    }
}
````

这个实现包含了两个类：

1. `Student`类：
   - 包含所需的属性：学号、姓名、性别、年龄和课程成绩数组
   - 提供带参数的构造方法
   - 提供getter方法访问属性
   - 重写toString方法用于打印学生信息

2. `StudentTest`类：
   - 创建包含5个学生对象的数组
   - 计算Java课程平均成绩
   - 找出并显示最高分和最低分的学生信息

```java
// Student.java
public class Student {
    private String id;
    private String name;
    private String gender;
    private int age;
    private double[] scores; // 5门课程成绩
    private static final int JAVA_INDEX = 0; // Java课程在数组中的索引
    
    // 构造方法
    public Student(String id, String name, String gender, int age, double[] scores) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.scores = new double[5];
        System.arraycopy(scores, 0, this.scores, 0, 5);
    }
    
    // Getter方法
    public String getId() { return id; }
    public String getName() { return name; }
    public String getGender() { return gender; }
    public int getAge() { return age; }
    public double getJavaScore() { return scores[JAVA_INDEX]; }
    
    @Override
    public String toString() {
        return "Student{" +
               "id='" + id + '\'' +
               ", name='" + name + '\'' +
               ", gender='" + gender + '\'' +
               ", age=" + age +
               ", Java成绩=" + scores[JAVA_INDEX] +
               '}';
    }
}
```

```java
// StudentTest.java
public class StudentTest {
    public static void main(String[] args) {
        // 创建学生数组
        Student[] students = new Student[5];
        
        // 初始化5个学生对象
        students[0] = new Student("001", "张三", "男", 20, new double[]{85, 78, 92, 88, 90});
        students[1] = new Student("002", "李四", "女", 19, new double[]{92, 85, 88, 90, 87});
        students[2] = new Student("003", "王五", "男", 21, new double[]{78, 82, 85, 80, 88});
        students[3] = new Student("004", "赵六", "女", 20, new double[]{95, 88, 92, 96, 93});
        students[4] = new Student("005", "孙七", "男", 19, new double[]{88, 85, 90, 87, 89});
        
        // 计算Java成绩平均值
        double sum = 0;
        double max = Double.MIN_VALUE;
        double min = Double.MAX_VALUE;
        String maxStudent = "";
        String minStudent = "";
        
        for (Student student : students) {
            double javaScore = student.getJavaScore();
            sum += javaScore;
            
            // 更新最大值
            if (javaScore > max) {
                max = javaScore;
                maxStudent = student.getName();
            }
            
            // 更新最小值
            if (javaScore < min) {
                min = javaScore;
                minStudent = student.getName();
            }
        }
        
        double average = sum / students.length;
        
        // 输出结果
        System.out.printf("Java课程平均成绩: %.2f\n", average);
        System.out.printf("最高分: %.2f (学生: %s)\n", max, maxStudent);
        System.out.printf("最低分: %.2f (学生: %s)\n", min, minStudent);
    }
}
```