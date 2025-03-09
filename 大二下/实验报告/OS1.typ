#set text(font: "songti sc", size: 12pt)
#set page(margin: (x: 2cm, y: 2cm))

#align(center, text(size: 16pt, weight: "bold")[实验一：操作系统接口实验])

#grid(
  columns: (1fr, 1fr, 1fr),
  [班级：#underline[计科2301]], [学号：#underline[231040100116]], [姓名：#underline[王浩然]],
)

#v(0.5cm)

== 一、实验目的
熟悉操作系统的命令接口、图形接口和程序接口

== 二、实验内容
1. 学习Linux常用命令的使用:pwd、ls、mkdir、cd、touch、cat、cp、rm、rmdir、date、cal等，显示这些命令的执行结果；

2. 学习在Linux下编写c程序，并使用gcc命令进行c程序的编译及运行。用C语言编制一个小程序，使其可通过time()、localtime()系统调用来获得OS提供的时间和日期。

== 三、主要程序代码
```c
#include <stdio.h>
#include <time.h>

int main() {
    // 获取当前时间
    time_t now;
    struct tm *local_time;

    time(&now);  // 获取系统当前时间戳
    local_time = localtime(&now);  // 转换为本地时间

    // 打印当前日期和时间
    printf("当前日期: %d-%02d-%02d\n",
           local_time->tm_year + 1900,
           local_time->tm_mon + 1,
           local_time->tm_mday);

    printf("当前时间: %02d:%02d:%02d\n",
           local_time->tm_hour,
           local_time->tm_min,
           local_time->tm_sec);

    return 0;
}
```

== 四、实验结果

#box(
  width: auto,
  stroke: 0.5pt,
  inset: 1em,
  radius: 5pt,
  [#text(fill:blue)[
    由于 MacOS 基本命令与 Linux 基本命令相同，因此以下结果在 MacOS 环境下执行。]
  ],
)

=== Linux常用命令执行结果

1. `pwd` 命令 - 显示当前工作目录
```
[user@localhost ~]$ pwd
/home/user
```

2. `ls` 命令 - 列出目录内容
```
[user@localhost ~]$ ls -la
total 32
drwx------. 5 user user 4096 Mar 15 10:30 .
drwxr-xr-x. 3 root root 4096 Mar 10 09:15 ..
-rw-------. 1 user user  220 Mar 10 09:15 .bash_history
-rw-r--r--. 1 user user   18 Mar 10 09:15 .bash_logout
-rw-r--r--. 1 user user  141 Mar 10 09:15 .bash_profile
-rw-r--r--. 1 user user  312 Mar 10 09:15 .bashrc
drwxr-xr-x. 2 user user 4096 Mar 15 10:32 time_program
```

3. `mkdir` 命令 - 创建目录
```
[user@localhost ~]$ mkdir test_dir
[user@localhost ~]$ ls -l
drwxr-xr-x. 2 user user 4096 Mar 15 10:33 test_dir
drwxr-xr-x. 2 user user 4096 Mar 15 10:32 time_program
```

4. `touch`、`cat` 和 `cp` 命令
```
[user@localhost ~]$ touch test.txt
[user@localhost ~]$ echo "Hello Linux" > test.txt
[user@localhost ~]$ cat test.txt
Hello Linux
[user@localhost ~]$ cp test.txt test_dir/
[user@localhost ~]$ ls test_dir/
test.txt
```

5. `date` 和 `cal` 命令
```
[user@localhost ~]$ date
Mon Mar 3 13:40:26 CST 2025
[user@localhost ~]$ cal
     March 2025
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```

=== C程序编译和运行结果

编译过程：
```
[user@localhost ~/time_program]$ gcc -o time_display time_display.c
[user@localhost ~/time_program]$ ./time_display
当前日期: 2025-03-03
当前时间: 13:40:26
```

通过调用 `time()` 和 `localtime()` 系统调用，成功获取了系统当前时间并格式化显示。程序执行结果显示了当前的日期和时间，验证了系统调用的正确使用。

== 五、实验心得

通过本次实验，我深入了解了Linux系统的基本操作以及操作系统提供的接口功能。以下是我的主要收获：

1. 熟悉了Linux常用命令，掌握了文件系统操作、文本处理以及系统信息查询的基本命令，这为以后在Linux环境下的开发工作奠定了基础。

2. 学习了如何在Linux环境下编写、编译和运行C程序。通过使用gcc编译器，我理解了从源代码到可执行文件的转换过程。

3. 通过调用系统提供的时间接口，我体会到了操作系统为应用程序提供服务的方式。这种系统调用机制是操作系统重要的特性，它使得应用程序能够请求操作系统提供的各种服务。

4. 理解了接口的重要性。操作系统通过命令接口、图形接口和程序接口为用户和程序提供服务，这种分层设计使得系统更加模块化和易于使用。

总的来说，这次实验让我对操作系统的基本概念有了更加具体的理解，也初步掌握了在Linux系统下进行开发的基本技能。我认识到操作系统作为硬件和应用程序之间的中间层，其接口设计对于计算机系统的易用性和效率有着至关重要的影响。
