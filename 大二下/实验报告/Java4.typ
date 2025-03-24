#set text(
  font: ( "PingFang SC"),
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

#strong[实验四：Java中的类继承机制]
#v(15pt)

== 实验目的
1. 理解子类和父类的概念及关系
2. 掌握Java类继承机制
3. 理解并运用多态特性

== 实验要求
1. 每个题目需要详细说明实验思路
2. 提供完整的源代码（不允许使用代码截图）
3. 提供程序运行结果截图

== 实验内容
#v(10pt)

=== 题目一
声明一个父类Person类和子类Student类：
- Person类包含：
  - 属性：name (String), age (int), gender (char)
  - 构造方法实现属性初始化
  - show方法返回格式化信息
- Student类继承Person类：
  - 新增属性：id (int)
  - 使用super调用父类构造方法
  - 重写show方法

=== 题目二
声明一个Shape抽象类，其中有计算面积（area）、周长（perimeter）的方法，有以下几个子类实现：Circle(圆)，Rectangle(矩形)，Triangle(三角形)，重写计算面积、周长的方法。请编写程序并测试，以多态的方式表示出来。

=== 题目三
设计一个动物声音“模拟器”，希望模拟器可以模拟许多动物的叫声。要求如下：

- 编写抽象类Animal
  - Animal抽象类有2个抽象方法cry()和getAnimaName()，即要求各种具体的动物给出自己的叫声和种类名称。

- 编写模拟器类Simulator
  - 该类有一个playSound(Animal animal)方法，该方法的参数是Animal类型。即参数animal可以调用Animal的子类重写的cry()方法播放具体动物的声音、调用子类重写的getAnimalName()方法显示动物种类的名称。

- 编写Animal类的子类：Dog，Cat类
  - 图是Simulator、Animal、Dog、Cat的UML图。
//   #image("image.png")

- 编写主类Application（用户程序），要求实现多态，并测试上述功能。

=== 题目四
编写一个Java程序：
- 设计一个abstract类Employee，其中有一个abstract方法earnings()；
- 设计Employee的二个子类YearWorker和MonthWorker，分别对应按年领取薪水（年薪为100000元）、按月领取薪水（月薪为5000元），子类必须重写父类的earnings()方法；
- 设计一个Company类，该类用Employee对象数组作为成员，Employee对象数组中的元素可以是YearWorker对象或MonthWorker对象的上转型对象；
- 编写一个测试类，假设某公司共有10名员工，两种类型的员工各为5人（其中数组下标为奇数的员工为MonthWorker，其他为YearWorker），计算并输出该公司一年需要支付的薪水总额。
=== 题目五
假定根据学生的3门学位课程的分数决定是否可以拿到学位，对于本科生，如果3门课程的平均分数超过60分即表示通过，而对于研究生，则需要平均超过80分才能通过。请完成以下java类的设计：
- 设计一个抽象类student，描述学生的共同特征；
- 设计一个描述本科生的类Undergraduate，该类继承并扩展Student类；
- 设计一个描述研究生的类Graduate，该类继承并扩展Student类；
- 设计一个测试类StudentDemo，分别创建本科生和研究生这两个对象，要求实现多态，并输出相关信息。

=== 题目六
定义一个复数类Complex，要求：
- 显示该复数；
- 求两个复数的和，返回复数类对象；
- 求两个复数的差，返回复数类对象；
- 求两个复数的乘积，返回复数类对象；
- 判断两个复数是否相等，返回布尔类型。
#line(length: 100%,stroke: blue)
#line(length: 100%,stroke: blue)
== 实验过程
=== 题目一实现
*实验思路*
#v(5pt)


*代码实现*
#v(5pt)
```java
// Person.java
public class Person {
    private String name;
    private int age;
    private char gender;

    public Person(String name, int age, char gender) {
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    public String show() {
        return "Person[name=" + name + ", age=" + age + ", gender=" + gender + "]";
    }
}
// Student.java
public class Student extends Person {
    private int id;

    public Student(String name, int age, char gender, int id) {
        super(name, age, gender);
        this.id = id;
    }

    @Override
    public String show() {
        return super.show().replace("Person", "Student") + "[id=" + id + "]";
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[Person[name=John, age=35, gender=M]
Student[name=Alice, age=20, gender=F][id=10001]
  ]
]

=== 题目二实现
*实验思路*
#v(5pt)
1. 创建抽象类Shape，定义计算面积和周长的抽象方法
2. 创建三个具体的子类实现Shape类
3. 在主类中使用多态方式测试各种形状

*代码实现*
#v(5pt)
```java
// Shape.java
public abstract class Shape {
    public abstract double area();
    public abstract double perimeter();
}

// Circle.java
public class Circle extends Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
    
    @Override
    public double perimeter() {
        return 2 * Math.PI * radius;
    }
}

// Rectangle.java
public class Rectangle extends Shape {
    private double width, height;
    
    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }
    
    @Override
    public double area() {
        return width * height;
    }
    
    @Override
    public double perimeter() {
        return 2 * (width + height);
    }
}

// Triangle.java
public class Triangle extends Shape {
    private double a, b, c;
    
    public Triangle(double a, double b, double c) {
        if (!isValid(a, b, c)) {
            throw new IllegalArgumentException("Invalid triangle sides");
        }
        this.a = a;
        this.b = b;
        this.c = c;
    }
    
    private boolean isValid(double a, double b, double c) {
        return a + b > c && b + c > a && a + c > b;
    }
    
    @Override
    public double area() {
        double s = (a + b + c) / 2;
        return Math.sqrt(s * (s - a) * (s - b) * (s - c));
    }
    
    @Override
    public double perimeter() {
        return a + b + c;
    }
}

// ShapeTest.java
public class ShapeTest {
    public static void main(String[] args) {
        Shape[] shapes = {
            new Circle(5),
            new Rectangle(4, 6),
            new Triangle(3, 4, 5)
        };
        
        for (Shape shape : shapes) {
            System.out.println(shape.getClass().getSimpleName() + ":");
            System.out.println("Area: " + shape.area());
            System.out.println("Perimeter: " + shape.perimeter() + "\n");
        }
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[Circle:
Area: 78.53981633974483
Perimeter: 31.41592653589793

Rectangle:
Area: 24.0
Perimeter: 20.0

Triangle:
Area: 6.0
Perimeter: 12.0]
]

*运行结果*
#v(5pt)
[在此插入题目二运行结果截图]

=== 题目三实现
*实验思路*
#v(5pt)
[在此描述实验思路]

*代码实现*
#v(5pt)
```java
// Animal.java
public abstract class Animal {
    public abstract String cry();
    public abstract String getAnimalName();
}

// Dog.java
public class Dog extends Animal {
    @Override
    public String cry() {
        return "Woof! Woof!";
    }

    @Override
    public String getAnimalName() {
        return "Dog";
    }
}

// Cat.java
public class Cat extends Animal {
    @Override
    public String cry() {
        return "Meow! Meow!";
    }

    @Override
    public String getAnimalName() {
        return "Cat";
    }
}
```

```java
//main function
// Simulator.java
public class Simulator {
    public void playSound(Animal animal) {
        System.out.println("This is a " + animal.getAnimalName());
        System.out.println("It makes this sound: " + animal.cry());
    }
}
//test
// Application.java
public class Application {
    public static void main(String[] args) {
        // Create the simulator
        Simulator simulator = new Simulator();
        
        // Create different animals
        Animal dog = new Dog();
        Animal cat = new Cat();
        
        // Test the simulator with different animals
        simulator.playSound(dog);
        System.out.println(); // Empty line for better readability
        simulator.playSound(cat);
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[This is a Dog
It makes this sound: Woof! Woof!

This is a Cat
It makes this sound: Meow! Meow!
  ]
]

*运行结果*
#v(5pt)
[在此插入题目三运行结果截图]

=== 题目四实现
*实验思路*
#v(5pt)
1. 创建抽象类Employee及其子类
2. 实现Company类管理员工
3. 使用数组存储不同类型员工并计算薪资总额

*代码实现*
#v(5pt)
```java
// Abstract Employee class and its subclasses
public abstract class Employee {
    public abstract double earnings();
}

public class YearWorker extends Employee {
    @Override
    public double earnings() {
        return 100000;
    }
}

public class MonthWorker extends Employee {
    @Override
    public double earnings() {
        return 5000 * 12;
    }
}

public class Company {
    private Employee[] employees = new Employee[10];
    
    public void createEmployees() {
        for (int i = 0; i < 10; i++) {
            employees[i] = (i % 2 == 0) ? new YearWorker() : new MonthWorker();
        }
    }
    
    public double getTotalSalary() {
        double total = 0;
        for (Employee e : employees) {
            total += e.earnings();
        }
        return total;
    }
}

// Test class
public class CompanyTest {
    public static void main(String[] args) {
        Company company = new Company();
        company.createEmployees();
        System.out.println("Total yearly salary: " + company.getTotalSalary());
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[Total yearly salary: 800000.0
  ]
]

*运行结果*
#v(5pt)
[在此插入题目四运行结果截图]

=== 题目五实现
*实验思路*
#v(5pt)
1. 创建抽象类Student定义通用特征
2. 实现本科生和研究生子类
3. 使用多态测试不同类型学生

*代码实现*
#v(5pt)
```java
public abstract class Student {
    protected String name;
    protected double[] scores = new double[3];
    
    public Student(String name, double[] scores) {
        this.name = name;
        this.scores = scores;
    }
    
    public abstract boolean canGraduate();
    protected double getAverage() {
        return Arrays.stream(scores).average().orElse(0);
    }
}

public class Undergraduate extends Student {
    public Undergraduate(String name, double[] scores) {
        super(name, scores);
    }
    
    @Override
    public boolean canGraduate() {
        return getAverage() >= 60;
    }
}

public class Graduate extends Student {
    public Graduate(String name, double[] scores) {
        super(name, scores);
    }
    
    @Override
    public boolean canGraduate() {
        return getAverage() >= 80;
    }
}

public class StudentDemo {
    public static void main(String[] args) {
        Student[] students = {
            new Undergraduate("Tom", new double[]{70, 80, 65}),
            new Graduate("Jerry", new double[]{85, 90, 82})
        };
        
        for (Student s : students) {
            System.out.println(s.getClass().getSimpleName() + 
                " can graduate: " + s.canGraduate());
        }
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[Undergraduate can graduate: true
Graduate can graduate: true
  ]
]

*运行结果*
#v(5pt)
[在此插入题目五运行结果截图]
*代码实现*
#v(5pt)
```java
public class Complex {
    private double real, imag;
    
    public Complex(double real, double imag) {
        this.real = real;
        this.imag = imag;
    }
    
    @Override
    public String toString() {
        return real + (imag >= 0 ? "+" : "") + imag + "i";
    }
    
    public Complex add(Complex other) {
        return new Complex(real + other.real, imag + other.imag);
    }
    
    public Complex subtract(Complex other) {
        return new Complex(real - other.real, imag - other.imag);
    }
    
    public Complex multiply(Complex other) {
        return new Complex(
            real * other.real - imag * other.imag,
            real * other.imag + imag * other.real
        );
    }
    
    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof Complex)) return false;
        Complex other = (Complex) obj;
        return real == other.real && imag == other.imag;
    }
    
    public static void main(String[] args) {
        Complex c1 = new Complex(3, 2);
        Complex c2 = new Complex(1, 4);
        System.out.println("c1 = " + c1);
        System.out.println("c2 = " + c2);
        System.out.println("Sum: " + c1.add(c2));
        System.out.println("Difference: " + c1.subtract(c2));
        System.out.println("Product: " + c1.multiply(c2));
        System.out.println("Equal: " + c1.equals(c2));
    }
}
```

*运行结果*
#v(5pt)
#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 6pt)[
  #text(font: ("SF Mono", "pingfang sc"), size: 10pt, fill: white)[c1 = 3.0+2.0i
c2 = 1.0+4.0i
Sum: 4.0+6.0i
Difference: 2.0-2.0i
Product: -5.0+14.0i
Equal: false
  ]
]

*运行结果*
#v(5pt)
[在此插入运行结果截图]

== 实验总结
=== 遇到的问题及解决方案
[在实验过程中，我遇到了一些问题。例如，在题目二中，最初尝试使用Swift语言编写代码，但后来意识到应该使用Java，因此我将代码改写为Java。此外，在题目四中，我最初没有考虑到如何使用数组存储不同类型的员工对象，经过查阅资料和思考，我使用了Employee对象的上转型对象来解决这个问题。]

=== 心得体会
[通过本次实验，我对Java中的类继承机制有了更深入的理解。我掌握了如何创建父类和子类，如何在子类中使用super关键字调用父类的构造方法，以及如何重写父类的方法。此外，我还学会了如何使用多态特性来编写更加灵活和可扩展的代码。本次实验也让我体会到了理论知识与实践相结合的重要性，只有通过实践才能真正掌握知识。]
