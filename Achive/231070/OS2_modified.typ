#set text(font: "PingFang SC")
#align(
  center,
  text(size: 18pt, weight: "bold")[
    实验二 进程的创建
  ],
)
#grid(
  columns: (1fr, 1fr, 1fr),
  [班级：#underline[计科2302]], [学号：#underline[231070100306]], [姓名：#underline[侯宪政]],
)

#set par(justify: true)
#set heading(numbering: "1.")

#heading(level: 1)[实验目标]
- 理解进程概念与运行特性
- 掌握进程并发执行的基本原理
- 学习运用fork()系统调用生成新进程

#heading(level: 1)[实验任务]
- 编写程序利用fork()系统调用创建两个子进程，让三个进程（父进程和两个子进程）分别在屏幕上显示不同字符：父进程显示'a'，一个子进程显示'b'，另一个子进程显示'c'。观察并分析显示结果。
- 对程序进行修改，使每个进程循环显示一句话：父进程显示"parent..."，子进程分别显示"daughter..."和"son..."。记录输出并分析结果。

#heading(level: 1)[预备知识]

#text(weight: "bold")[(1) fork()系统调用的工作原理]
系统调用fork()是Unix/Linux中创建新进程的主要方法。调用fork()后，系统会创建一个与原进程几乎完全相同的新进程。对于父进程，fork()返回子进程ID；对于子进程，fork()返回0。

#text(weight: "bold")[(2) 进程的并发执行特性]
多个进程可以同时存在于系统中，它们的执行顺序由操作系统的调度器决定，具有一定的不确定性。

#heading(level: 1)[实验过程]

#block(inset: (left: 1em))[
  #text(style: "italic")[环境说明]：macOS Ventura 13.5, clang 14.0.3
]

#heading(level: 2)[任务一：创建进程显示字符]

#block(inset: (left: 1em))[
  #text(style: "italic")[源代码]：
]

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t child1, child2;

    // 创建第一个子进程
    child1 = fork();
    
    if (child1 < 0) {
        // 创建失败
        fprintf(stderr, "Failed to create first child\n");
        return -1;
    } else if (child1 == 0) {
        // 第一个子进程执行区域
        printf("b");
        return 0;
    } 
    
    // 父进程继续执行，创建第二个子进程
    child2 = fork();
    
    if (child2 < 0) {
        // 创建失败
        fprintf(stderr, "Failed to create second child\n");
        return -1;
    } else if (child2 == 0) {
        // 第二个子进程执行区域
        printf("c");
        return 0;
    } else {
        // 父进程执行区域
        printf("a");
        return 0;
    }
}
```

#block(inset: (left: 1em))[
  #text(style: "italic")[编译命令]：
]

```bash
$ clang -Wall -o process_char process_char.c
$ ./process_char
```

#block(inset: (left: 1em))[
  #text(style: "italic")[运行结果]：多次运行得到不同结果
]

```
abc
```
```
bac
```
```
acb
```

#heading(level: 2)[任务二：进程循环输出]

#block(inset: (left: 1em))[
  #text(style: "italic")[源代码]：
]

```c
#include <stdio.h>
#include <unistd.h>

int main() {
    pid_t child1, child2;
    int count;

    // 创建第一个子进程
    child1 = fork();
    
    if (child1 < 0) {
        // 创建失败
        fprintf(stderr, "Failed to create first child\n");
        return -1;
    } else if (child1 == 0) {
        // 第一个子进程代码块
        for (count = 0; count < 5; count++) {
            printf("daughter...\n");
            fflush(stdout); // 确保立即输出
            sleep(1);  // 暂停1秒
        }
        return 0;
    }
    
    // 父进程创建第二个子进程
    child2 = fork();
    
    if (child2 < 0) {
        // 创建失败
        fprintf(stderr, "Failed to create second child\n");
        return -1;
    } else if (child2 == 0) {
        // 第二个子进程代码块
        for (count = 0; count < 5; count++) {
            printf("son...\n");
            fflush(stdout); // 确保立即输出
            sleep(1);  // 暂停1秒
        }
        return 0;
    } else {
        // 父进程代码块
        for (count = 0; count < 5; count++) {
            printf("parent...\n");
            fflush(stdout); // 确保立即输出
            sleep(1);  // 暂停1秒
        }
        return 0;
    }
}
```

#block(inset: (left: 1em))[
  #text(style: "italic")[编译命令]：
]

```bash
$ clang -Wall -o process_loop process_loop.c
$ ./process_loop
```

#block(inset: (left: 1em))[
  #text(style: "italic")[典型输出]：（输出顺序基本固定，但可能有轻微差异）
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

#heading(level: 1)[实验分析]

#heading(level: 2)[实验一分析]
在第一个实验中，输出字符的顺序不固定，表现出进程执行的不确定性。这是由以下原因造成的：

- 操作系统调度器决定进程执行顺序
- 三个进程几乎同时竞争CPU资源
- 没有使用同步机制控制输出顺序
- 进程的创建和调度受系统当前负载影响

在多次运行中可以看到"abc"、"acb"、"bac"等不同的输出组合，充分说明了进程执行的并发性和调度的随机性。

#heading(level: 2)[实验二分析]
在第二个实验中，通过引入循环和sleep()函数，我们可以观察到：

- 三个进程交替执行的模式更加明显
- sleep()调用使每个进程主动让出CPU，给其他进程执行机会
- 输出的相对顺序更稳定，通常是"parent → daughter → son"的循环模式
- 进程之间的并发执行更加有规律，便于观察

通过加入sleep()，我们模拟了真实环境中进程执行时的时间片轮转特性，展示了进程调度的基本机制。

#heading(level: 1)[进程创建机制探究]

操作系统创建进程主要通过以下步骤：

1. #text(weight: "bold")[资源分配]：
   - 为新进程分配唯一的进程标识符(PID)
   - 分配内存空间用于保存进程控制块(PCB)
   - 为进程分配初始资源（内存、文件句柄等）
