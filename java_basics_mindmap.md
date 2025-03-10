# Java 基础知识思维导图java
// powered by whr
## 第2章 基本数据类型与数组
1. **标识符与关键字**
   1. 标识符
   2. Unicode字符集
   3. 关键字
   > **实例**: 
   > - 有效的标识符: `userName`, `_count`, `$price`, `年龄`
   > - 无效的标识符: `2names`, `class`, `for-each`
   > - 常见关键字: `class`, `public`, `static`, `void`, `int`

2. **基本数据类型**
   1. 逻辑类型
   2. 整数类型
   3. 字符类型
   4. 浮点类型
   > **实例**:
   > - 逻辑类型: `boolean isActive = true;`
   > - 整数类型: `byte b = 100;`, `short s = 1000;`, `int i = 100000;`, `long l = 1000000000L;`
   > - 字符类型: `char c = 'A';`, `char unicode = '\u0041';`
   > - 浮点类型: `float f = 3.14f;`, `double d = 3.14159;`

3. **类型转换运算**
   > **实例**:
   > - 自动类型转换: `int i = 100; long l = i;`
   > - 强制类型转换: `double d = 3.14; int i = (int)d;` // 结果是3

4. **输入与输出数据**
   1. 输入基本型数据
   2. 输出基本型数据
   > **实例**:
   > ```java
   > // 输入数据
   > import java.util.Scanner;
   > Scanner scanner = new Scanner(System.in);
   > int age = scanner.nextInt();
   > 
   > // 输出数据
   > System.out.println("年龄: " + age);
   > ```

5. **数组**
   1. 声明数组
   2. 为数组分配元素
   3. 数组元素的使用
   4. length的使用
   5. 数组的初始化
   6. 数组的引用
   > **实例**:
   > ```java
   > // 声明并初始化数组
   > int[] numbers = new int[5];
   > numbers[0] = 10;
   > 
   > // 简化初始化
   > int[] scores = {95, 85, 75, 65, 55};
   > 
   > // 遍历数组
   > for (int i = 0; i < scores.length; i++) {
   >     System.out.println(scores[i]);
   > }
   > ```

6. **应用举例**
7. **小结**
8. **课外读物**

## 第3章 运算符、表达式和语句
1. **运算符与表达式**
   1. 算术运算符与算术表达式
   2. 自增、自减运算符
   3. 算术混合运算的精度
   4. 关系运算符与关系表达式
   5. 逻辑运算符与逻辑表达式
   6. 赋值运算符与赋值表达式
   7. 位运算符
   8. instanceof运算符
   9. 运算符综述
   > **实例**:
   > - 算术运算: `int result = 10 + 5 * 2;` // 结果是20
   > - 自增运算: `int i = 5; i++; int j = ++i;` // j的值是7
   > - 关系运算: `boolean isEqual = (5 == 5);` // true
   > - 逻辑运算: `boolean result = (5 > 3) && (2 < 4);` // true
   > - 位运算: `int result = 5 & 3;` // 结果是1 (二进制: 101 & 011 = 001)

2. **流程控制语句**
   1. 顺序结构
   2. 分支结构
      1. if语句
      2. if-else语句
      3. if-else if-else语句
      4. switch-case语句
   3. 循环结构
      1. while循环
      2. do-while循环
      3. for循环
      4. 增强型for循环
   4. 跳转语句
      1. break语句
      2. continue语句
      3. return语句
   > **实例**:
   > ```java
   > // if-else语句
   > int score = 85;
   > if (score >= 90) {
   >     System.out.println("优秀");
   > } else if (score >= 60) {
   >     System.out.println("及格");
   > } else {
   >     System.out.println("不及格");
   > }
   > 
   > // switch语句
   > int day = 3;
   > switch (day) {
   >     case 1: System.out.println("星期一"); break;
   >     case 2: System.out.println("星期二"); break;
   >     case 3: System.out.println("星期三"); break;
   >     default: System.out.println("其他日期");
   > }
   > 
   > // for循环
   > for (int i = 0; i < 5; i++) {
   >     System.out.println(i);
   > }
   > ```

3. **表达式语句与复合语句**
4. **Java注释**
5. **小结**

## 第4章 类与对象
1. **面向对象概述**
   1. 类与对象的关系
   2. 面向对象的三大特性
      1. 封装
      2. 继承
      3. 多态
   > **实例**: 
   > - 类与对象的关系: 类似于蛋糕模具与蛋糕的关系，类是模板，对象是具体实例

2. **类的定义**
   1. 成员变量
   2. 成员方法
   3. 构造方法
   4. 访问修饰符
   > **实例**:
   > ```java
   > public class Student {
   >     // 成员变量
   >     private String name;
   >     private int age;
   >     
   >     // 构造方法
   >     public Student(String name, int age) {
   >         this.name = name;
   >         this.age = age;
   >     }
   >     
   >     // 成员方法
   >     public void study() {
   >         System.out.println(name + "正在学习");
   >     }
   > }
   > ```

3. **对象的创建与使用**
   1. 创建对象
   2. 访问对象的属性和方法
   3. 对象的引用
   > **实例**:
   > ```java
   > // 创建对象
   > Student student1 = new Student("张三", 18);
   > 
   > // 调用方法
   > student1.study();
   > ```

4. **this关键字**
   > **实例**:
   > ```java
   > public class Person {
   >     private String name;
   >     
   >     public void setName(String name) {
   >         this.name = name;  // this引用当前对象的name属性
   >     }
   > }
   > ```

5. **static关键字**
   1. 静态变量
   2. 静态方法
   3. 静态代码块
   > **实例**:
   > ```java
   > public class MathUtil {
   >     // 静态变量
   >     public static final double PI = 3.14159;
   >     
   >     // 静态方法
   >     public static int add(int a, int b) {
   >         return a + b;
   >     }
   >     
   >     // 静态代码块
   >     static {
   >         System.out.println("MathUtil类被加载");
   >     }
   > }
   > ```

6. **包与导入**
   1. 包的定义
   2. 导入包
   > **实例**:
   > ```java
   > // 定义包
   > package com.example.util;
   > 
   > // 导入包
   > import java.util.ArrayList;
   > import java.util.List;
   > ```

7. **小结**