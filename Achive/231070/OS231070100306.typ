#set text(font: "songti sc", size: 12pt)
#set page(margin: (x: 2cm, y: 2cm))

#align(center, text(size: 16pt, weight: "bold")[操作系统实验报告一：系统接口使用])

#grid(
  columns: (1fr, 1fr, 1fr),
  [班级：#underline[计科2302]], [学号：#underline[231070100306]], [姓名：#underline[侯宪政]],
)

#v(0.7cm)

== 实验目的
掌握操作系统的三种主要接口（命令接口、图形接口和程序接口）

== 实验内容与要求
1. 掌握Linux系统常用命令：pwd、ls、mkdir、cd、touch、cat、cp、rm、rmdir、date、cal等，并展示执行结果

2. 在Linux环境下编写C语言程序，使用gcc编译运行，程序需通过time()、localtime()系统调用获取并显示系统时间和日期

== 实验代码
```c
#include <stdio.h>
#include <time.h>

int main(void) {
    /* 声明变量 */
    time_t current_time;
    struct tm *time_info;
    
    /* 获取当前系统时间 */
    time(&current_time);
    
    /* 转换为本地时间格式 */
    time_info = localtime(&current_time);
    
    /* 输出日期信息 */
    printf("系统日期: %d年%02d月%02d日\n", 
        time_info->tm_year + 1900,
        time_info->tm_mon + 1, 
        time_info->tm_mday);
    
    /* 输出时间信息 */
    printf("当前时间: %02d时%02d分%02d秒\n", 
        time_info->tm_hour,
        time_info->tm_min, 
        time_info->tm_sec);
        
    return 0;
}
```

== 实验结果

#box(
  width: auto,
  stroke: 0.5pt,
  inset: 1em,
  radius: 5pt,
  [#text(fill:blue)[
    说明：本次实验在 MacOS 终端中完成，由于 MacOS 基于 Unix，其基本命令与 Linux 命令类似。]
  ],
)

=== Linux常用命令测试结果

1. `pwd` 命令：显示当前工作路径
```shell
[xianzheng@mac ~]$ pwd
/Users/xianzheng
```

2. `ls` 命令：查看目录内容
```shell
[xianzheng@mac ~]$ ls -l
total 28
drwxr-xr-x  3 xianzheng staff 4096 Mar 12 09:45 Documents
drwxr-xr-x  2 xianzheng staff 4096 Mar 12 10:02 Downloads
drwxr-xr-x  2 xianzheng staff 4096 Mar 12 09:50 os_lab
```

3. `mkdir` 命令：创建新目录
```shell
[xianzheng@mac ~]$ mkdir test_folder
[xianzheng@mac ~]$ ls
Documents  Downloads  os_lab  test_folder
```

4. 文件操作命令：`touch`、`cat`、`cp`
```shell
[xianzheng@mac ~]$ touch sample.txt
[xianzheng@mac ~]$ echo "测试文本内容" > sample.txt
[xianzheng@mac ~]$ cat sample.txt
测试文本内容
[xianzheng@mac ~]$ cp sample.txt test_folder/
[xianzheng@mac ~]$ ls test_folder/
sample.txt
```

5. 系统信息命令：`date`、`cal`
```shell
[xianzheng@mac ~]$ date
2025年3月12日 星期三 10:15:32 CST
[xianzheng@mac ~]$ cal
      3月 2025     
日 一 二 三 四 五 六
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```

=== C程序编译执行结果

编译过程与执行结果：
```
[xianzheng@mac ~/os_lab]$ gcc -Wall -o time_app time_app.c
[xianzheng@mac ~/os_lab]$ ./time_app
系统日期: 2025年03月12日
当前时间: 10时17分05秒
```

此程序成功调用了操作系统提供的时间相关系统调用函数，获取并格式化显示了系统的当前日期和时间。通过`time()`获取时间戳，再通过`localtime()`转换为本地时间结构体，从而实现了程序接口的使用。

== 实验总结

本次实验让我对操作系统的接口有了更深入的了解，主要收获如下：

1. 掌握了Linux/Unix基本命令，这些命令是与操作系统交互的基础工具。通过实践，我了解了文件系统操作、目录管理和系统信息查询的方法。

2. 学习了在类Unix系统环境下C语言程序的编写和编译流程。gcc编译器的使用让我理解了从源代码到可执行文件的转换过程。

3. 通过编程实践，我体会到了系统调用的概念和重要性。操作系统通过系统调用向应用程序提供服务，这是程序接口的核心内容。

4. 更加清晰地认识到操作系统的分层架构。操作系统作为用户程序和硬件之间的中间层，通过各种接口向上提供服务，这种设计使得计算机系统更加灵活和易于使用。

这次实验不仅加深了我对操作系统理论知识的理解，还培养了实际操作技能。我认识到操作系统接口设计的重要性，它直接影响到用户与系统交互的效率和体验。在今后的学习中，我将继续深入探索操作系统的更多功能和特性。
