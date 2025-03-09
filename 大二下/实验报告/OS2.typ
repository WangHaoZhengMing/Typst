#set text(font: "PingFang SC")
#align(
  center,
  text(size: 18pt, weight: "bold")[
    实验二 进程的创建
  ],
)
#set par(justify: true)
#set heading(numbering: "一、")

#heading(level: 1)[实验目的]
+ 掌握进程的概念，明确进程的含义
+ 认识并了解并发执行的实质

#heading(level: 1)[实验内容]
+ 编写一段程序，使用系统调用fork( )创建两个子进程。当此程序运行时，在系统中有一个父进程和两个子进程活动。让每一个进程在屏幕上显示一个字符：父进程显示'a'，子进程分别显示字符'b'和字符'c'。试观察记录屏幕上的显示结果，并分析原因。
+ 修改上述程序，每一个进程循环显示一句话。子进程显示'daughter …'及'son ……'，父进程显示 'parent ……'，观察结果，分析原因。

#heading(level: 1)[实验准备]

#text(weight: "bold")[(1) 阅读Linux的fork.c源码文件，分析进程的创建过程。]

#text(weight: "bold")[(2) 阅读Linux文献，了解gcc命令编译Linux线程程序的方法。]

#heading(level: 1)[实验实现]

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[实验环境]：macOS Ventura 13.5, clang 14.0.3
]

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[实验代码1]：创建两个子进程显示不同字符
]

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid1, pid2;

    pid1 = fork();
    if (pid1 < 0) {
        // Fork failed
        fprintf(stderr, "Fork failed\n");
        return 1;
    } else if (pid1 == 0) {
        // Child process 1
        printf("b");
    } else {
        // Parent process, create another child
        pid2 = fork();
        if (pid2 < 0) {
            fprintf(stderr, "Fork failed\n");
            return 1;
        } else if (pid2 == 0) {
            // Child process 2
            printf("c");
        } else {
            // Parent process
            printf("a");
        }
    }

    return 0;
}
```

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[编译与执行]：
]

```bash
$ clang -o fork_test1 fork_test1.c
$ ./fork_test1
```

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[执行结果]：
]

```
acb
```

#block(inset: (left: 1em))[
  注：每次执行结果可能不同，如abc、acb、cab等，因为三个进程的执行顺序是由操作系统调度的。
]

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[实验代码2]：每个进程循环显示一句话
]

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t pid1, pid2;
    int i;

    pid1 = fork();
    if (pid1 < 0) {
        // Fork failed
        fprintf(stderr, "Fork failed\n");
        return 1;
    } else if (pid1 == 0) {
        // Child process 1
        for (i = 0; i < 5; i++) {
            printf("daughter...\n");
            sleep(1);
        }
    } else {
        // Parent process, create another child
        pid2 = fork();
        if (pid2 < 0) {
            fprintf(stderr, "Fork failed\n");
            return 1;
        } else if (pid2 == 0) {
            // Child process 2
            for (i = 0; i < 5; i++) {
                printf("son...\n");
                sleep(1);
            }
        } else {
            // Parent process
            for (i = 0; i < 5; i++) {
                printf("parent...\n");
                sleep(1);
            }
        }
    }

    return 0;
}
```

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[编译与执行]：
]

```bash
$ clang -o fork_test2 fork_test2.c
$ ./fork_test2
```

#block(inset: (left: 1em))[
  #text(style: "italic", weight: "bold")[执行结果]：
]

```
parent...
daughter...
son...
parent...
daughter...
son...
parent...
daughter...
son...
parent...
daughter...
son...
parent...
daughter...
son...
```

#heading(level: 1)[结果分析]

1. #text(style: "italic", weight: "bold")[第一个实验] 使用fork()创建了两个子进程，输出结果会有不同的组合（如acb、abc、cab等）。这是因为：
  - fork()创建子进程后，父进程和子进程并发执行，执行顺序由操作系统的进程调度器决定
  - 父进程和子进程都从fork()的返回处继续执行
  - 进程调度是非确定性的，取决于当前系统负载和调度算法
  - 没有使用同步机制，所以每次运行的输出顺序可能不同

2. #text(style: "italic", weight: "bold")[第二个实验] 在每个进程中加入循环和sleep()：
  - 每个进程都会循环输出5次
  - sleep(1)使进程休眠1秒，让每个进程有更均匀的执行机会
  - 输出结果更有规律，因为sleep()给了操作系统足够的时间来调度其他进程
  - 输出的交错模式更清晰地展示了进程的并发执行特性

#heading(level: 1)[实验总结]

通过本次实验，我们：
1. 理解了fork()系统调用创建子进程的基本原理
2. 观察到了进程并发执行的不确定性特征
3. 了解了子进程如何继承父进程的数据和代码，同时有独立的执行路径
4. 体验了进程调度对程序执行顺序的影响

#heading(level: 1)[思考题解答]

#text(weight: "bold")[系统是怎样创建进程的？]

在类UNIX系统（如macOS、Linux）中，进程创建主要通过fork()系统调用完成：

1. #text(style: "italic", weight: "bold")[fork()系统调用]：当程序执行fork()时，操作系统会：
  - 为新进程分配唯一的进程ID（PID）
  - 复制父进程的内存空间、寄存器状态和资源（如文件描述符）
  - 将新进程加入到调度队列中

2. #text(style: "italic", weight: "bold")[写时复制（Copy-on-Write）]：
  - 为了提高效率，现代系统使用写时复制技术
  - 父子进程最初共享相同的内存页
  - 只有当其中一个进程尝试修改内存时，才会创建该页的副本

3. #text(style: "italic", weight: "bold")[子进程的状态]：
  - 子进程从fork()返回处开始执行
  - 子进程几乎是父进程的完全复制，但有独立的地址空间
  - 在子进程中，fork()返回0，而在父进程中返回子进程的PID

4. #text(style: "italic", weight: "bold")[进程替换]：
  - 创建进程后，通常使用exec()系列系统调用加载新程序
  - 这将擦除当前进程的内存空间并用新程序替换

通过fork()和exec()的组合，系统能够灵活地创建和管理进程，这是UNIX/Linux操作系统设计的核心特性之一。

