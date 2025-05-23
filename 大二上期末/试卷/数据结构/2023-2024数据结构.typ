#set text(font: "Heiti SC")
#align(left)[绝密★启用前]

#set text(font: "songti SC")
#align(center)[#text(size: 1.4em)[2023-2024年河南工业大学期末考试]]

#set text(font: "Heiti SC",weight: "bold")
#align(center)[#text(size: 2em)[数据结构]]

#text(weight: "bold")[注意事项]：
#set text(font: "Songti SC")
#set enum(indent: 0.5cm, numbering: "1.")
+ 答卷前，考生务必将自己的姓名和准考证号填写在答题卡上。
+ 回答选择题时，选出每小题答案后，用铅笔把答题卡对应题目的答案标号涂黑。如需改动，用橡皮擦干净后，再选涂其它答案标号。回答非选择题时，将答案写在答题卡上。写在本试卷上无效。
+ 考试结束后，将本试卷和答题卡一并交回。请认真核对监考员在答上所粘贴的条形码上的姓名、准考证号与您本人是否相符。
#set text(font: "Heiti SC")
== 选择题：本大题共 $20$ 小题，每小题 $1$ 分，共 $20$ 分。在每小题给出的四个选项中，只有一项是符合题目要求的。
#set text(font: ("Songti SC","times new roman"), size: 10.5pt)
#let tasks(items) = {
  grid(
    columns: (4) ,gutter: 1fr,
    ..items
  )
}
#set enum(numbering: "1.")
+ 在数据结构中，从逻辑上可以把数据结构分成线性结构和非线性结构。下列哪种结构属于非线性结构 【 $B$ 】
    #tasks(($A. "线性表"$,$B. "二叉树"$,$C. "队列"$,$D. "树"$))

+ 计算机算法指的是 【 $B$ 】
    #tasks(($A. "可执行文件"$,$B. "求解步骤的描述"$,$C. "程序"$,$D. "源代码"$))

+ 带头结点的单链表 $"head"$ 为空的判定条件是 
  #grid(
    columns:(1),gutter: 9pt,
    [$A.$ $"head == NULL"$],
    [$B.$ $"head->next == NULL"$],
    [$C.$ $"head->next == head"$],
    [$D.$ $"head != NULL"$]
    )

+ 下面关于线性表的叙述中，错误的是哪一个
    #grid(
    columns:(1),gutter: 9pt,
    [$A.$ 线性表采用顺序存储时，必须占用一片连续的存储单元],
    [$B.$ 线性表采用顺序存储时，便于进行插入和删除操作],
    [$C.$ 线性表采用链式存储时，不必占用一片连续的存储单元],
    [$D.$ 线性表采用链式存储时，便于进行插入和删除操作"]
    )
+ 输入序列为 ABC，可以变为 CBA 时，经过的栈操作为
    #grid(
    columns:(1),gutter: 9pt,
    [$A.$ $"push, pop, push, pop, push, pop"$],
    [$B.$ $"push, push, push, pop, pop, pop"$],
    [$C.$ $"push, push, pop, pop, push, pop"$],
    [$D.$ $"push, pop, push, push, pop, pop"$]
    )

+ 一个队列的入队序列是 1，2，3，4，则队列的输出序列是

    #grid(
    columns:(4),gutter: 1fr,
    [$A.space 4, 3, 2, 1$],
    [$B.space 1, 2, 3, 4$],
    [$C.space 1, 4, 3, 2$],
    [$D.space 3, 2, 4, 1$]
    )

+ 设计一个判别表达式中左、右括号是否配对出现的算法，采用\_\_\_\_\_数据结构最佳

    #grid(
    columns:(4),gutter: 1fr,
    [$A.$ 线性表的顺序存储结构],
    [$B.$ 队列],
    [$C.$ 线性表的链式存储结构],
    [$D.$ 栈]
    )

+ 设有两个串 $p$ 和 $q$，求 $q$ 在 $p$ 中首次出现的位置的运算称为

    #grid(
    columns:(4),gutter: 1fr,
    [$A.$ 连接],
    [$B.$ 模式匹配],
    [$C.$ 求子串],
    [$D.$ 求串长]
    )

+ 数组 $A$ 中，每个元素的长度为 $3$ 个字节，行下标 $i$ 从 $1$ 到 $8$，列下标 $j$ 从 $1$ 到 $10$，从首地址 $"SA"$ 开始连续存放的存储器内，该数组按行存放，元素 $A[8][5]$ 的起始地址为【$C$】

    #grid(
    columns:(4),gutter: 1fr,
    [$A. "SA"+141$],
    [$B. "SA"+144$],
    [$C. "SA"+222$],
    [$D. "SA"+225$]
    )

+ 对矩阵进行压缩存储是为了【$D$】

    #grid(
    columns:(4),gutter: 1fr,
    [$A.$ 方便运算],
    [$B.$ 方便存储],
    [$C.$ 提高运算速度],
    [$D.$ 减少存储空间]
    )

+ 下面程序段的时间复杂度是多少？【$C$】
    ```swift
    s = 0
    for (i = 1; i <= n; i++)
        for (j = 1; j <= i; j++)
            s += B[i][j]
    ```
    #grid(
    columns:(4),gutter: 1fr,
    [$A. O(1)$],
    [$B. O(n)$],
    [$C. O(n^2)$],
    [$D. O(log n)$]
    )

+ 栈是一种操作受限的数据结构，其插入和删除必须在何处进行？【$A$】

    #grid(
    columns:(4),gutter: 1fr,
    [$A.$ 栈顶],
    [$B.$ 栈底],
    [$C.$ 栈的任意位置],
    [$D.$ 指定位置]
    )

+ 适用于折半查找的表的存储方式及元表排列要求为【$D$】
    #grid(
    columns:(2),gutter: 10pt,
    [$A.$ 顺序存储结构，无序排列],
    [$B.$ 链式存储结构，无序排列],
    [$C.$ 链式存储结构，有序排列],
    [$D.$ 顺序存储结构，有序排列]
    )
+ 下面关于哈希查找的说法，正确的是 
    #grid(
    columns:(1),gutter: 9pt,
    [$A.$ 哈希函数的构造越复杂，因为这样随机性好，冲突小],
    [$B.$ 除留余数法是所有哈希函数中最好的],
    [$C.$ 没有特别好与坏的哈希函数，要视情况而定],
    [$D.$ 哈希表的平均查找长度有时也和记录总数有关]
    )

+ 堆的形状是一棵【$C$】
    #tasks(($A. "二叉排序树树"$,$B. "满二叉树"$,$C. "完全二叉树"$,$D. "平衡二叉树"$))
+ 若一组记录的排序码为 $(46,79,56,38,40,84)$ ,则利用快速排序的方法，以第一个记录为基准得到的一次划分结果为【$C$】
    #grid(
    columns:(4),gutter: 30pt,
    [$A. "40,38,56,46,79,84"$],
    [$B. "40,38,46,56,79,84"$],
    [$C. "40,38,46,56,79,84"$],
    [$D. "40,38,46,79,56,84"$]
    )

+ 一个完全二叉树有 $4000$ 个结点，那么叶子结点的个数是【$B$】
    #tasks(($A. "1000"$,$B. "2000"$,$C. "3999"$,$D. "4000"$))

+ 如果待排序序列中两个元素具有相同的值，在排序前后它们的相对位置不变，则称该排序是【B】
    #tasks(($A. "不稳定排序"$,$B. "稳定排序"$,$C. "内部排序"$,$D. "外部排序"$))

+ 在一个图中，所有顶点的度数之和等于图的边数的【$C$】
    #tasks(($A. "两倍"$,$B. "三倍"$,$C. "两倍"$,$D. "四倍"$))

+ 数据表中有 $10000$ 个元素，如果仅要求求出其中最大的 $10$ 个元素，最好的方法是【$C$】
    #tasks(($A. "冒泡排序"$,$B. "快速排序"$,$C. "简单选择排序"$,$D. "堆排序"$))

== 判断题：本大题共 10 小题，每小题 1 分，共 10 分。判断对的填“T”，判断错的填“F”。
#set enum(numbering: "1.")
+ 数据结构主要研究非数值问题 #h(1fr) 【$T$】
+ 数据的物理结构是指数据在计算机内的实际存储形式 #h(1fr) 【$T$】
+ 集合与线性表的区别在于是否按关键字排序 #h(1fr) 【$F$】
+ 递归程序结构清晰，形式简洁，但效率低 #h(1fr) 【$T$】
+ 元全二叉树的叶子只能在层次最大的两层上出现 #h(1fr) 【$F$】
+ 对 $22$ 个记录的有序表作折半查找，当查找失败时，至少要比较 $4$ 次关键字 #h(1fr) 【$F$】
+ 广义表 $(((a),b),c)$  的表尾是 $c$ #h(1fr) 【$T$】
+ 在 $n$ 个结点的二叉链表中，有 $n+1$ 个空链域 #h(1fr) 【$T$】
+ 空串是由空格组成的串 #h(1fr) 【$F$】
+ 强连通图中任意两个顶点之间都存在一条路径 #h(1fr) 【$T$】

== 应用题：本大题共 $8$ 大题，共 $61$ 分。
#set enum(numbering: "1.A.")
+ $3$ 个结点构造出的二叉树有几种不同的形态？普通树呢？请画出所有形态。

+ 已知一想二叉树的中序端列和先序序列为 $"DBEAFIHCG"$ 和 $"ABDECFIHG"$ 
    + 请画出该二叉树；
    + 请写出该二叉树的后序序列.

+ 给定一组汉字 “数”、“据”、“结”、“构”、“期”、“末”、“考”、“试”，
    + 画出哈夫曼树；
    + 为各字符设计哈夫曼编码值；
    + 计算哈夫曼树的带权路径长度 $"WPL"$

+ 已知如图 $1$
+ 关键字序列为 $10,18,3,8,12,2,7$ 请按序列中元素的顺序将它们依次插入一棵初始为空的二叉排序树中：
    + 画出插入完成后的二叉排序树；
    + 求其在等概率查找下的查找成功的平均查找长度

+ 采用哈希函数 $H(k)=k mod 11$，用线性探测法解决冲突，在地址空间 $[0..10]$ 中给关键字序列 $[47,7,29,11,16,92,22,8,3]$ 进行下列操作：
    + 构造哈希表
    + 计算装填因子

+ 给出初始待排序码 $[27,46,5,18,16,51,32,26]$，画出使用下面各种排序算法的状态变化示意图：
    + 直接插入排序
    + 二路归并排序
    + 希尔排序（增量选取 $5,3,1$)
+ 
== 算法设计题：本大题共 $1$ 题，共 $9$ 分。
1. 链栈的相关定义如下：

    ```c
    # define OK 1
    # define ERROR 0
    #define OVERFLOW -2

    typedef int Status;
    typedef int SElemType;

    typedef struct SNode {
        SElemType data;
        struct SNode *next;
    } SNode, *LinkStack;
    //链栈的初始化
    Status InitStack(LinkStack &S) {
        S = NULL;
        return OK;
    }
    //判断链栈是否为空
    bool StackEmpty(LinkStack S) {
        if (!s)
            return true;
        return false;
    }
    ```
请完成下列工作：

    + 实现入栈、出栈操作。函数定义要求如下：
            ```c
            Status Push (LinkStack &S, SElemType e)；//入栈
            Status Pop (LinkStack &S, SElemType &e)；//出栈
            ```

    2. 设计一个算法，用链栈实现数制转换：对于从键盘输入的一个非负十进制整数，将其转换为等值的八进制数。函数定义要求如下：
        ```C
        void conversion ()；//数制转换
        ```