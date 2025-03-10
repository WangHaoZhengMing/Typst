#set text(font: "pingfang sc")
#set heading(numbering: "1.")
#show heading: it => {
  set block(spacing: 0.65em)
  set text(weight: "bold")
  it
}
// #import "@preview/codly:1.2.0": *
// #import "@preview/codly-languages:0.1.1": *
// #show: codly-init.with()
 #import "@preview/zebraw:0.4.6": *
 #show: zebraw
#align(center)[
  #text(size: 1.2em)[#strong[河南工业大学 #underline[Java程序设计实验] 实验报告]]

  #v(0.5em)
  专业班级：#underline("计科 2301") 学号：#underline("231040100116") 姓名：#underline("王浩然") 指导老师： 评分：
]

#v(1em)
= 实验题目：实验（二）：Java基本语法

= 实验目的
1. 掌握Java的基本语法
2. 掌握Java的流程控制
3. 掌握数组的使用

= 实验要求
1. 每个题目，写出实验思路
2. 代码实现
3. 运行结果截图

= 实验内容

1. 编写一个Java应用程序，给出汉字'你'、'我'、'他'在Unicode表中的位置。

2. 编写一个Java应用程序，输出全部的希腊字母。

3. 编写一个Java应用程序，计算1！+2！+3！+…+10！。

4. 编写一个Java应用程序，计算1-50之间的所有素数的和。

5. 分别用do-while和for循环计算1+1/2!+1/3!+1/4!… … 的前20项和。

6. 一个数如果恰好等于它的因子之和，这个数就称为"完数"。例如6=1＋2＋3。编程求1000之内的所有完数。

7. 编写程序，求出几何形状（长方形、正方形、圆形）的周长和面积。

8. 编写一个Java应用程序，产生10个100之内的随机整数输出，并把这10个数从小到大的顺序输出。

9. 编写一个Java应用程序，产生20个50-100之内的整数，并输出这20个数并找出最大数及最小数输出。

10. 输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数。（可以使用Scanner对象的nextLine方法获取一个字符串，然后调用字符串的toCharArray方法将字符串转化为字符数组进行处理）

#box(width: 100%)[
  #set text(style: "italic")
  注：题目中可能需要用到有些类和方法，大家还没有学过，请查阅相关资料，作为自学部分，比如随机输出整数等。
]

= 实验执行

== 任务一：汉字在Unicode表中的位置

#strong[（1）思路]

通过将字符强制转换为int类型，可以获得汉字在Unicode表中的位置（十进制）。我们也可以使用Integer.toHexString()方法将十进制转换为十六进制显示。

#strong[（2）代码实现]
```java
public class ChineseUnicode {
    public static void main(String[] args) {
        char c1 = '你';
        char c2 = '我';
        char c3 = '他';

        System.out.println("汉字'你'的Unicode编码：" + (int)c1 + ", 十六进制：" + Integer.toHexString(c1));
        System.out.println("汉字'我'的Unicode编码：" + (int)c2 + ", 十六进制：" + Integer.toHexString(c2));
        System.out.println("汉字'他'的Unicode编码：" + (int)c3 + ", 十六进制：" + Integer.toHexString(c3));
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac ChineseUnicode.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java ChineseUnicode\
    汉字'你'的Unicode编码：20320, 十六进制：4f60\
    汉字'我'的Unicode编码：25105, 十六进制：6211\
    汉字'他'的Unicode编码：20182, 十六进制：4ed6\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务二：输出全部的希腊字母

#strong[（1）思路]

希腊字母在Unicode表中占据了一定的范围，大写字母从Α(U+0391) 到Ω(U+03A9) ，小写字母从α(U+03B1) 到 $ω(U+ 0 3 C 9)$。我们可以通过遍历这个范围并使用(char)将编码转换为字符来输出所有希腊字母。

#strong[（2）代码实现]
```java
public class GreekAlphabet {
    public static void main(String[] args) {
        System.out.println("大写希腊字母：");
        for (int i = 0x0391; i <= 0x03A9; i++) {
            System.out.print((char)i + " ");
        }

        System.out.println("\n小写希腊字母：");
        for (int i = 0x03B1; i <= 0x03C9; i++) {
            System.out.print((char)i + " ");
        }
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac GreekAlphabet.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java GreekAlphabet\
    大写希腊字母：\
    Α Β Γ Δ Ε Ζ Η Θ Ι Κ Λ Μ Ν Ξ Ο Π Ρ Σ Τ Υ Φ Χ Ψ Ω\
    小写希腊字母：\
    α β γ δ ε ζ η θ ι κ λ μ ν ξ ο π ρ ς σ τ υ φ χ ψ ω\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务三：计算1!+2!+3!+...+10!

#strong[（1）思路]

使用两个循环来解决此问题：外层循环从1到10，计算每个阶乘；内层循环计算当前数字的阶乘。将每个阶乘的结果累加到总和中。

#strong[（2）代码实现]
```java
public class FactorialSum {
    public static void main(String[] args) {
        long sum = 0;

        for (int i = 1; i <= 10; i++) {
            long factorial = 1;
            for (int j = 1; j <= i; j++) {
                factorial *= j;
            }
            sum += factorial;
            System.out.println(i + "! = " + factorial);
        }

        System.out.println("1! + 2! + 3! + ... + 10! = " + sum);
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac FactorialSum.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java FactorialSum\
    1! = 1\
    2! = 2\
    3! = 6\
    4! = 24\
    5! = 120\
    6! = 720\
    7! = 5040\
    8! = 40320\
    9! = 362880\
    10! = 3628800
    1! + 2! + 3! + ... + 10! = 4037913
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务四：计算1-50之间的所有素数的和

#strong[（1）思路]

通过编写一个辅助函数来判断一个数是否为素数，然后遍历1到50之间的每个数，将素数加到总和中。

#strong[（2）代码实现]
```java
public class PrimeSum {
    public static void main(String[] args) {
        int sum = 0;
        System.out.print("1-50之间的素数有：");

        for (int i = 2; i <= 50; i++) {
            if (isPrime(i)) {
                System.out.print(i + " ");
                sum += i;
            }
        }

        System.out.println("\n1-50之间的素数和为：" + sum);
    }

    // 判断一个数是否为素数
    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }

        for (int i = 2; i <= Math.sqrt(n); i++) {
            if (n % i == 0) {
                return false;
            }
        }

        return true;
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac PrimeSum.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java PrimeSum\
    1-50之间的素数有：2 3 5 7 11 13 17 19 23 29 31 37 41 43 47\
    1-50之间的素数和为：328\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务五：计算级数和（$1+1/2!+1/3!+...）$的前20项和



#strong[（2）代码实现]
```java
public class SeriesSum {
    public static void main(String[] args) {
        // 使用for循环
        double sumFor = 0;
        double factorial = 1;

        for (int i = 1; i <= 20; i++) {
            if (i > 1) {
                factorial *= (i - 1);
            }
            sumFor += 1.0 / factorial;
        }

        // 使用do-while循环
        double sumDoWhile = 0;
        factorial = 1;
        int i = 1;

        do {
            if (i > 1) {
                factorial *= (i - 1);
            }
            sumDoWhile += 1.0 / factorial;
            i++;
        } while (i <= 20);

        System.out.println("使用for循环计算得到的前20项和: " + sumFor);
        System.out.println("使用do-while循环计算得到的前20项和: " + sumDoWhile);
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac SeriesSum.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java SeriesSum\

    使用for循环计算得到的前20项和: 2.7182818284590455\
    使用do-while循环计算得到的前20项和: 2.7182818284590455\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务六：求1000之内的所有完数

#strong[（1）思路]

遍历1到1000的每个数，对每个数计算其所有因子（除了数本身）的和，如果这个和等于数本身，则该数是完数。

#strong[（2）代码实现]
```java
public class PerfectNumber {
    public static void main(String[] args) {
        System.out.println("1000以内的完数有：");

        for (int num = 1; num <= 1000; num++) {
            int sum = 0;

            // 寻找因子并求和
            for (int i = 1; i < num; i++) {
                if (num % i == 0) {
                    sum += i;
                }
            }

            // 判断是否是完数
            if (sum == num) {
                System.out.print(num + " = 1");
                for (int i = 2; i < num; i++) {
                    if (num % i == 0) {
                        System.out.print(" + " + i);
                    }
                }
                System.out.println();
            }
        }
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac PerfectNumber.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java PerfectNumber\
    1000以内的完数有：\
    6 = 1 + 2 + 3\
    28 = 1 + 2 + 4 + 7 + 14\
    496 = 1 + 2 + 4 + 8 + 16 + 31 + 62 + 124 + 248\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务七：几何形状的周长和面积

#strong[（1）思路]

创建一个简单的几何形状类体系，包括抽象的Shape类和三个具体的子类：Rectangle（长方形）、Square（正方形）和Circle（圆形）。每个类实现计算周长和面积的方法。

#strong[（2）代码实现]
```java
public class ShapeCalculator {
    public static void main(String[] args) {
        Rectangle rectangle = new Rectangle(5, 4);
        Square square = new Square(5);
        Circle circle = new Circle(3);

        System.out.println("长方形 (长=5, 宽=4):");
        System.out.println("周长: " + rectangle.getPerimeter());
        System.out.println("面积: " + rectangle.getArea());

        System.out.println("\n正方形 (边长=5):");
        System.out.println("周长: " + square.getPerimeter());
        System.out.println("面积: " + square.getArea());

        System.out.println("\n圆形 (半径=3):");
        System.out.println("周长: " + circle.getPerimeter());
        System.out.println("面积: " + circle.getArea());
    }
}

abstract class Shape {
    public abstract double getPerimeter();
    public abstract double getArea();
}

class Rectangle extends Shape {
    private double length;
    private double width;

    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public double getPerimeter() {
        return 2 * (length + width);
    }

    @Override
    public double getArea() {
        return length * width;
    }
}

class Square extends Shape {
    private double side;

    public Square(double side) {
        this.side = side;
    }

    @Override
    public double getPerimeter() {
        return 4 * side;
    }

    @Override
    public double getArea() {
        return side * side;
    }
}

class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    public double getPerimeter() {
        return 2 * Math.PI * radius;
    }

    @Override
    public double getArea() {
        return Math.PI * radius * radius;
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac ShapeCalculator.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java ShapeCalculator\
    长方形 (长=5, 宽=4):\
    周长: 18.0
    面积: 20.0

    正方形 (边长=5):\
    周长: 20.0
    面积: 25.0

    圆形 (半径=3):\
    周长: 18.84955592153876
    面积: 28.274333882308138\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务八：产生10个100之内的随机整数并排序

#strong[（1）思路]

使用Random类生成10个100以内的随机整数，然后使用Arrays.sort()方法将它们按从小到大的顺序排序。

#strong[（2）代码实现]
```java
import java.util.Arrays;
import java.util.Random;

public class RandomNumberSort {
    public static void main(String[] args) {
        Random random = new Random();
        int[] numbers = new int[10];

        System.out.println("生成的10个随机数：");
        for (int i = 0; i < 10; i++) {
            numbers[i] = random.nextInt(100); // 生成0-99的随机数
            System.out.print(numbers[i] + " ");
        }

        Arrays.sort(numbers);

        System.out.println("\n排序后：");
        for (int number : numbers) {
            System.out.print(number + " ");
        }
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac RandomNumberSort.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java RandomNumberSort\
    生成的10个随机数：\
    76 14 32 98 53 7 61 29 84 42\
    排序后：\
    7 14 29 32 42 53 61 76 84 98\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务九：产生20个50-100之内的整数并找出最大值和最小值

#strong[（1）思路]

使用Random类生成20个50-100之间的随机整数，然后在生成过程中同时找出最大值和最小值。

#strong[（2）代码实现]
```java
import java.util.Random;

public class RandomMinMax {
    public static void main(String[] args) {
        Random random = new Random();
        int[] numbers = new int[20];

        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;

        System.out.println("生成的20个随机数（50-100之间）：");
        for (int i = 0; i < 20; i++) {
            numbers[i] = random.nextInt(51) + 50; // 生成50-100的随机数
            System.out.print(numbers[i] + " ");

            if (numbers[i] > max) {
                max = numbers[i];
            }
            if (numbers[i] < min) {
                min = numbers[i];
            }
        }

        System.out.println("\n最大值: " + max);
        System.out.println("最小值: " + min);
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac RandomMinMax.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java RandomMinMax\
    生成的20个随机数（50-100之间）：
    67 92 81 53 74 99 55 60 78 64 83 57 96 72 88 51 76 62 71 89\
    最大值: 99
    最小值: 51\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

== 任务十：统计字符种类

#strong[（1）思路]

使用Scanner类获取用户输入的一行字符，然后将字符串转换为字符数组，遍历字符数组，使用Character类的相关方法判断每个字符的类型。

#strong[（2）代码实现]
```java
import java.util.Scanner;

public class CharCounter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入一行字符：");
        String input = scanner.nextLine();

        int letterCount = 0;
        int digitCount = 0;
        int spaceCount = 0;
        int otherCount = 0;

        char[] chars = input.toCharArray();

        for (char c : chars) {
            if (Character.isLetter(c)) {
                letterCount++;
            } else if (Character.isDigit(c)) {
                digitCount++;
            } else if (Character.isWhitespace(c)) {
                spaceCount++;
            } else {
                otherCount++;
            }
        }

        System.out.println("英文字母数量: " + letterCount);
        System.out.println("数字数量: " + digitCount);
        System.out.println("空格数量: " + spaceCount);
        System.out.println("其他字符数量: " + otherCount);

        scanner.close();
    }
}
```

#strong[（3）运行结果截图]

#block(width: 100%, inset: 8pt,clip: true, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % javac CharCounter.java\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects % java CharCounter\
    请输入一行字符：\
    Hello World 2025! Java编程很有趣.\
    英文字母数量: 16\
    数字数量: 4\
    空格数量: 4\
    其他字符数量: 8\
    (base) haominghan\@MacBook-Air-2 \~/JavaProjects %
  ]
]

= 实验测试中遇到的问题和自己的解决方案

1. *Unicode编码问题*：在第一个任务中，遇到了汉字的Unicode编码问题。通过查阅资料了解到可以使用(int)强制转换获取字符的Unicode码点，以及使用Integer.toHexString()方法获取十六进制表示。

2. *随机数生成问题*：使用Random类生成随机数时，最初没有正确理解nextInt(n)的参数含义。通过查阅Java API文档，了解到nextInt(n)生成的是0到n-1之间的随机数，所以需要通过加法运算调整范围。

3. *阶乘计算溢出*：在计算阶乘时，使用int类型会导致结果溢出。通过使用long类型来存储阶乘，提高了计算准确性，但计算较大的阶乘时仍可能溢出。

4. *浮点数精度问题*：在计算级数和时，发现浮点数计算可能存在精度误差。通过使用double类型并适当控制计算精度，减少了这种误差的影响。
