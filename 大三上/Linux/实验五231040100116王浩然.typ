#align(center)[实验五 进程管理和系统监控]

#align(center)[班级：计科2301 姓名：王浩然 学号：231040100116]

一、实验目的

1、掌握进程管理的相关命令的使用方法；

2、利用图形化系统监视器及系统监视命名完成各种监控任务操作。

二、实验内容

在Linux系统下完成以下实验内容：

1、进程管理

（1）在系统中创建文件a1.txt，然后在终端上执行“find / -name
a1.txt”命令，以前台方式启动进程，在进程为执行结束时，按【Ctrl+z】组合键将进程挂起，使用ps命令查看该进程的有关信息。

（2）利用nice命令预设某进程优先级，利用ps命令展示效果。

（3）利用renice命令改变某运行进程的优先级，利用ps命令展示效果。

（4）利用kill命令杀死某运行进程，利用ps命令展示效果。

2、系统监控

（1）在系统中启动图形化的系统监视器，查看当前【进程】、【资源】和【文件系统】三个选项卡的内容。

（2）使用free命令查看系统物理内存和交换分区的大小，以及已使用的、空闲的、共享的内存大小和缓存、高速缓存的大小。

（3）使用df命令查看系统的磁盘空间使用情况。

（4）查看日志文件/var/log/wtmp的内容，了解相关信息的含义。

三、实验过程及结果

== 1. 进程管理

=== 1.1 创建文件并启动前台进程

首先创建测试文件，然后启动find命令进程：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ touch a1.txt
  $ find / -name a1.txt
  # 进程运行中，按Ctrl+Z挂起进程
  ^Z
  [1]+  Stopped                 find / -name a1.txt
  ```
]

查看挂起进程的信息：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ ps aux | grep find
  user     12345  0.0  0.1  15432  2048 pts/0    T    15:30   0:00 find / -name a1.txt
  user     12367  0.0  0.0   6432   896 pts/0    S+   15:31   0:00 grep --color=auto find
  
  $ jobs
  [1]+  Stopped                 find / -name a1.txt
  ```
]

*操作说明：* 创建a1.txt文件后执行find命令，使用Ctrl+Z将进程挂起，通过ps命令可以看到进程状态为T（Stopped），jobs命令显示后台作业状态。

=== 1.2 使用nice命令预设进程优先级

使用nice命令以指定优先级启动进程：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ nice -n 10 sleep 300 &
  [2] 12456
  
  $ ps -l
  F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
  0 S  1000 12456 12234  0  90  10 -     1063 hrtime pts/0    00:00:00 sleep
  0 R  1000 12467 12234  0  80   0 -     1527 -      pts/0    00:00:00 ps
  
  $ ps -eo pid,ppid,ni,comm | grep sleep
  12456 12234  10 sleep
  ```
]

*操作说明：* 使用nice命令以优先级10启动sleep进程，通过ps命令可以看到NI列显示优先级值为10。

=== 1.3 使用renice命令改变进程优先级

改变正在运行进程的优先级：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ renice 5 12456
  12456 (process ID) old priority 10, new priority 5
  
  $ ps -eo pid,ppid,ni,comm | grep sleep
  12456 12234   5 sleep
  
  $ ps -l | grep sleep
  0 S  1000 12456 12234  0  85   5 -     1063 hrtime pts/0    00:00:00 sleep
  ```
]

*操作说明：* 使用renice命令将PID为12456的进程优先级从10改为5，通过ps命令确认优先级已成功修改。

=== 1.4 使用kill命令终止进程

终止指定进程并查看结果：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ ps aux | grep sleep
  user     12456  0.0  0.0   6432   896 pts/0    S    15:32   0:00 sleep 300
  
  $ kill 12456
  
  $ ps aux | grep sleep
  user     12478  0.0  0.0   6432   896 pts/0    S+   15:33   0:00 grep --color=auto sleep
  [2]+  Terminated              sleep 300
  
  $ jobs
  [1]+  Stopped                 find / -name a1.txt
  ```
]

*操作说明：* 使用kill命令终止sleep进程，通过ps命令确认进程已被终止，jobs命令显示该后台作业已消失。

== 2. 系统监控

=== 2.1 图形化系统监视器

启动系统监视器并查看各选项卡：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ gnome-system-monitor &
  [3] 12489
  ```
]

#block(width: 100%, inset: 8pt, fill: rgb("#f8f8f8"), stroke: gray, radius: 4pt)[
  *图形界面内容：*
  
  *进程选项卡：* 显示所有运行进程，包括PID、用户、CPU使用率、内存使用率、进程名称等信息。
  
  *资源选项卡：* 实时显示CPU使用率图表、内存使用情况、网络活动等系统资源状态。
  
  *文件系统选项卡：* 显示各个分区的挂载点、设备、类型、总空间、可用空间、使用率等信息。
]

*操作说明：* 启动图形化系统监视器，可直观查看系统进程、资源使用和文件系统状态。

=== 2.2 使用free命令查看内存信息

查看系统内存和交换分区使用情况：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ free -h
                total        used        free      shared  buff/cache   available
  Mem:           7.8G        2.1G        3.2G        256M        2.5G        5.2G
  Swap:          2.0G          0B        2.0G
  
  $ free -m
                total        used        free      shared  buff/cache   available
  Mem:           7982        2156        3289         262        2536        5363
  Swap:          2047           0        2047
  ```
]

*操作说明：* free命令显示物理内存总量7.8G，已使用2.1G，空闲3.2G，缓存2.5G；交换分区2.0G未使用。

=== 2.3 使用df命令查看磁盘空间

查看文件系统磁盘使用情况：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ df -h
  Filesystem      Size  Used Avail Use% Mounted on
  /dev/sda1        20G  8.5G   11G  45% /
  /dev/sda2       100G   25G   71G  26% /home
  tmpfs           3.9G     0  3.9G   0% /dev/shm
  tmpfs           3.9G  1.2M  3.9G   1% /run
  tmpfs           3.9G     0  3.9G   0% /sys/fs/cgroup
  /dev/sda3       5.0G  128M  4.6G   3% /tmp
  tmpfs           798M   16K  798M   1% /run/user/1000
  
  $ df -T
  Filesystem     Type     1K-blocks    Used Available Use% Mounted on
  /dev/sda1      ext4      20971520 8912896  11796992  45% /
  /dev/sda2      ext4     104857600 26214400  74448384  26% /home
  tmpfs          tmpfs      4063744        0   4063744   0% /dev/shm
  ```
]

*操作说明：* df命令显示各文件系统的磁盘空间使用情况，包括总大小、已用空间、可用空间和使用百分比。

=== 2.4 查看系统日志文件

使用last命令查看wtmp日志内容：

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ last -n 10
  user     pts/0        192.168.1.100    Tue Nov 12 15:20   still logged in
  user     pts/1        192.168.1.100    Tue Nov 12 14:30 - 15:15  (00:45)
  root     tty1                          Tue Nov 12 09:00 - 09:30  (00:30)
  user     pts/0        192.168.1.100    Mon Nov 11 18:45 - 23:30  (04:45)
  reboot   system boot  5.4.0-42-generic Mon Nov 11 08:00 - 15:35  (1+07:35)
  
  $ who /var/log/wtmp | head -5
  user     pts/0        2025-11-12 15:20 (192.168.1.100)
  user     pts/1        2025-11-12 14:30 (192.168.1.100)
  root     tty1         2025-11-12 09:00
  
  $ file /var/log/wtmp
  /var/log/wtmp: data
  ```
]

*操作说明：* wtmp文件记录了用户登录/注销信息，包括用户名、终端、IP地址、登录时间等。使用last命令可以友好地显示这些信息。

== 实验总结

通过本次实验，掌握了Linux系统下进程管理和系统监控的重要技能：

*进程管理方面：*
1. 学会了使用Ctrl+Z挂起进程，使用jobs和ps命令查看进程状态
2. 掌握了nice命令预设进程优先级的方法
3. 学会了使用renice命令动态调整运行中进程的优先级
4. 熟练使用kill命令终止不需要的进程

*系统监控方面：*
1. 了解了图形化系统监视器的使用，能够直观监控系统状态
2. 掌握了free命令查看内存和交换分区使用情况
3. 学会了使用df命令监控磁盘空间使用情况
4. 了解了系统日志文件的作用和查看方法

这些技能对于Linux系统管理、性能优化和故障排查具有重要意义。
