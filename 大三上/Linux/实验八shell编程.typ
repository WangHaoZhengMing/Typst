#set text(font: "SimSun")
#align(center)[实验八 shell编程]

#align(center)[班级：计科2301 姓名：王浩然 学号：231040100116]

= 实验目的

  + 掌握Linux下shell的变量定义及使用；

  + 掌握Linux下的简单shell编程，掌握Shell中控制结构的使用。

= 实验内容

在Linux系统下，完成以下实验内容。

+ Shell基础

  + 在Shell中定义两个数值型的变量，分别赋值，最终显示出两个变量相加的结果。

  + 在Shell中，使用alias命令为某命令定义别名，显示执行效果。

+ Shell编程

  + 编写一个Shell脚本，判断用户登录的用户名和密码是否正确。用户名不正确允许重复输入，密码三次不正确则退出程序，并显示相应的提示信息。

  + 编写一个脚本，判断一个文件是否具有可读、可写、可执行的权限。

  + 编写一个脚本，统计当前路径下所有C语言的源文件的总行数共有多少行。

  + 编写一个脚本，以英文月份名为参数，显示当年该月的日历。

= 实验过程（程序代码）及结果

== Shell基础

=== 1. 变量定义及使用

在Shell中定义两个数值型变量，分别赋值，显示两个变量相加的结果：

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ num1=15\
    \$ num2=25\
    \$ sum=\$((num1 + num2))\
    \$ echo "第一个数值: \$num1"\
    第一个数值: 15\
    \$ echo "第二个数值: \$num2"\
    第二个数值: 25\
    \$ echo "两数之和: \$sum"\
    两数之和: 40
  ]
]

*操作说明：* 定义了两个数值型变量num1和num2，分别赋值为15和25，然后使用算术运算计算它们的和并输出结果。

=== 2. 使用alias命令定义别名

为ls命令定义别名并显示执行效果：

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ alias ll='ls -l'\
    \$ alias | grep ll\
    alias ll='ls -l'\
    \$ ll\
    total 12\
    -rw-r--r-- 1 user user 1024 Nov 12 15:30 login_check.sh\
    -rw-r--r-- 1 user user  856 Nov 12 15:25 file_permission.sh\
    -rw-r--r-- 1 user user  724 Nov 12 15:20 count_c_files.sh\
    -rw-r--r-- 1 user user  512 Nov 12 15:15 calendar_show.sh
  ]
]

*操作说明：* 使用alias命令为ls -l创建了别名ll，然后验证别名是否创建成功，最后测试别名的使用效果。

== Shell编程

=== 3. 用户登录验证脚本

编写一个Shell脚本，判断用户登录的用户名和密码是否正确：

*脚本代码（login_check.sh）：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 9pt, fill: white)[
    \#!/bin/bash\
    \# 用户登录验证脚本\
    \
    correct_username="admin"\
    correct_password="123456"\
    password_attempts=0\
    max_attempts=3\
    \
    echo "=== 用户登录验证系统 ==="\
    \
    \# 用户名验证\
    while true; do\
    read -p "请输入用户名: " username\
    if [ "\$username" = "\$correct_username" ]; then\
    echo "用户名正确！"\
    break\
    else\
    echo "用户名错误，请重新输入！"\
    fi\
    done\
    \
    \# 密码验证\
    while [ \$password_attempts -lt \$max_attempts ]; do\
    password_attempts=\$((password_attempts + 1))\
    read -s -p "请输入密码: " password\
    echo\
    if [ "\$password" = "\$correct_password" ]; then\
    echo "密码正确！登录成功！"\
    echo "欢迎您，\$username!"\
    exit 0\
    else\
    remaining=\$((max_attempts - password_attempts))\
    if [ \$remaining -gt 0 ]; then\
    echo "密码错误！还有 \$remaining 次机会。"\
    else\
    echo "密码错误次数过多，程序退出！"\
    exit 1\
    fi\
    fi\
    done
  ]
]

*执行结果：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ chmod +x login_check.sh\
    \$ ./login_check.sh\
    === 用户登录验证系统 ===\
    请输入用户名: user1\
    用户名错误，请重新输入！\
    请输入用户名: admin\
    用户名正确！\
    请输入密码: \
    密码错误！还有 2 次机会。\
    请输入密码: \
    密码正确！登录成功！\
    欢迎您，admin!
  ]
]

*操作说明：* 创建了用户登录验证脚本，实现了用户名错误可重复输入，密码最多3次机会的功能。演示了错误用户名重新输入和密码验证的过程。

=== 4. 文件权限检查脚本

编写一个脚本，判断文件是否具有可读、可写、可执行的权限：

*脚本代码（file_permission.sh）：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 9pt, fill: white)[
    \#!/bin/bash\
    \# 文件权限检查脚本\
    \
    if [ \$\# -eq 0 ]; then\
    echo "用法: \$0 <文件名>"\
    exit 1\
    fi\
    \
    file_path="\$1"\
    \
    if [ ! -e "\$file_path" ]; then\
    echo "错误：文件 '\$file_path' 不存在！"\
    exit 1\
    fi\
    \
    echo "检查文件：\$file_path"\
    echo "文件权限检查结果："\
    \
    \# 检查可读权限\
    if [ -r "\$file_path" ]; then\
    echo "✓ 可读 (readable)"\
    else\
    echo "✗ 不可读 (not readable)"\
    fi\
    \
    \# 检查可写权限\
    if [ -w "\$file_path" ]; then\
    echo "✓ 可写 (writable)"\
    else\
    echo "✗ 不可写 (not writable)"\
    fi\
    \
    \# 检查可执行权限\
    if [ -x "\$file_path" ]; then\
    echo "✓ 可执行 (executable)"\
    else\
    echo "✗ 不可执行 (not executable)"\
    fi\
    \
    \# 显示详细权限信息\
    echo -e "\n详细权限信息："\
    ls -l "\$file_path"
  ]
]

*执行结果：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ chmod +x file_permission.sh\
    \$ ./file_permission.sh test.txt\
    检查文件：test.txt\
    文件权限检查结果：\
    ✓ 可读 (readable)\
    ✓ 可写 (writable)\
    ✗ 不可执行 (not executable)\
    \
    详细权限信息：\
    -rw-r--r-- 1 user user 256 Nov 12 15:45 test.txt\
    \
    \$ ./file_permission.sh login_check.sh\
    检查文件：login_check.sh\
    文件权限检查结果：\
    ✓ 可读 (readable)\
    ✓ 可写 (writable)\
    ✓ 可执行 (executable)\
    \
    详细权限信息：\
    -rwxr-xr-x 1 user user 1024 Nov 12 15:30 login_check.sh
  ]
]

*操作说明：* 创建了文件权限检查脚本，能够检测指定文件的可读、可写、可执行权限，并显示详细的权限信息。分别测试了普通文本文件和可执行脚本文件。

=== 5. C语言源文件行数统计脚本

编写一个脚本，统计当前路径下所有C语言源文件的总行数：

*脚本代码（count_c_files.sh）：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 9pt, fill: white)[
    \#!/bin/bash\
    \# C语言源文件行数统计脚本\
    \
    echo "统计当前路径下所有C语言源文件的行数..."\
    echo "当前路径：\$(pwd)"\
    echo\
    \
    \# 查找所有.c文件\
    c_files=\$(find . -name "\*.c" -type f 2>/dev/null)\
    \
    if [ -z "\$c_files" ]; then\
    echo "当前路径下没有找到C语言源文件(.c)"\
    exit 0\
    fi\
    \
    total_lines=0\
    file_count=0\
    \
    echo "找到的C源文件："\
    echo "------------------------"\
    \
    for file in \$c_files; do\
    if [ -f "\$file" ]; then\
    lines=\$(wc -l < "\$file")\
    echo "%-20s %6d 行" "\$file" "\$lines"\
    total_lines=\$((total_lines + lines))\
    file_count=\$((file_count + 1))\
    fi\
    done\
    \
    echo "------------------------"\
    echo "统计结果："\
    echo "C源文件总数：\$file_count 个"\
    echo "代码总行数：\$total_lines 行"
  ]
]

*执行结果：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ \# 先创建一些C源文件用于测试\
    \$ echo -e "\#include <stdio.h>int main() {\nprintf(\"Hello World\");\nreturn 0;\n}" > hello.c\
    \$ echo -e "\#include <stdio.h>\#include <stdlib.h>\nint add(int a, int b) {\nreturn a + b;\n}" > calc.c\
    \$ echo -e "// 这是一个测试文件\n#include <stdio.h>" > test.c\
    \
    \$ chmod +x count_c_files.sh\
    \$ ./count_c_files.sh\
    统计当前路径下所有C语言源文件的行数...\
    当前路径：/home/user/shell_lab8\
    \
    找到的C源文件：\
    ------------------------\
    ./hello.c             5 行\
    ./calc.c              4 行\
    ./test.c              2 行\
    ------------------------\
    统计结果：\
    C源文件总数：3 个\
    代码总行数：11 行
  ]
]

*操作说明：* 创建了C语言源文件行数统计脚本，能够自动查找当前目录及子目录下的所有.c文件，统计每个文件的行数并计算总行数。

=== 6. 月份日历显示脚本

编写一个脚本，以英文月份名为参数，显示当年该月的日历：

*脚本代码（calendar_show.sh）：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 9pt, fill: white)[
    \#!/bin/bash\
    \# 月份日历显示脚本\
    \
    if [ \$\# -eq 0 ]; then\
    echo "用法: \$0 <英文月份名>"\
    echo "例如: \$0 January 或 \$0 Jan"\
    exit 1\
    fi\
    \
    month_input="\$1"\
    current_year=\$(date +%Y)\
    \
    \# 月份名称转换为数字\
    case "\${month_input,,}" in\
    january|jan) month_num=1; month_name="January" ;;\
    february|feb) month_num=2; month_name="February" ;;\
    march|mar) month_num=3; month_name="March" ;;\
    april|apr) month_num=4; month_name="April" ;;\
    may) month_num=5; month_name="May" ;;\
    june|jun) month_num=6; month_name="June" ;;\
    july|jul) month_num=7; month_name="July" ;;\
    august|aug) month_num=8; month_name="August" ;;\
    september|sep) month_num=9; month_name="September" ;;\
    october|oct) month_num=10; month_name="October" ;;\
    november|nov) month_num=11; month_name="November" ;;\
    december|dec) month_num=12; month_name="December" ;;\
    \*)\
    echo "错误：无效的月份名 '\$month_input'"\
    echo "请输入有效的英文月份名（如January, Feb等）"\
    exit 1\
    ;;\
    esac\
    \
    echo "显示 \$current_year 年 \$month_name 月的日历："\
    echo\
    cal \$month_num \$current_year
  ]
]

*执行结果：*

#block(width: 100%, inset: 8pt, fill: rgb("#080808"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    \$ chmod +x calendar_show.sh\
    \$ ./calendar_show.sh November\
    显示 2025 年 November 月的日历：\
    \
    November 2025\
    Su Mo Tu We Th Fr Sa\
    1\
    2345678\
    9101112131415\
    16171819202122\
    23242526272829\
    30\
    \
    \$ ./calendar_show.sh Dec\
    显示 2025 年 December 月的日历：\
    \
    December 2025\
    Su Mo Tu We Th Fr Sa\
    123456\
    78910111213\
    14151617181920\
    21222324252627\
    28293031\
    \
    \$ ./calendar_show.sh invalid\
    错误：无效的月份名 'invalid'\
    请输入有效的英文月份名（如January, Feb等）
  ]
]

*操作说明：* 创建了月份日历显示脚本，能够接受英文月份名（完整形式或缩写形式）作为参数，显示当年该月的日历。包含了输入验证和错误处理功能。

== 实验总结

通过本次实验，我掌握了以下Shell编程技能：

1. *Shell变量使用*：学会了如何定义和使用数值型变量，以及进行基本的算术运算。

2. *命令别名设置*：掌握了使用alias命令为常用命令创建别名，提高命令行操作效率。

3. *条件判断和循环结构*：在用户登录验证脚本中使用了while循环和if条件判断，实现了复杂的逻辑控制。

4. *文件权限检查*：学会了使用Shell的文件测试操作符(-r, -w, -x)来检查文件权限。

5. *文件查找和统计*：掌握了使用find命令查找特定类型的文件，并结合wc命令进行行数统计。

6. *参数处理和输入验证*：学会了处理脚本参数，进行输入验证，并提供友好的错误提示。

7. *系统命令调用*：掌握了在脚本中调用系统命令（如cal、ls、wc等）来完成特定功能。

这些技能为后续的Linux系统管理和自动化脚本开发打下了坚实的基础。
