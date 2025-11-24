#align(center)[实验六 用户管理和网络命令]

#align(center)[班级：计科2301 姓名：王浩然 学号：231040100116]

一、实验目的

1、掌握Linux下用户和组的创建使用方法；

2、掌握Linux常用网络命令及操作。

二、实验内容

在Linux系统下，完成以下实验内容：

1、用户和组的创建

（1）在Ubuntu中分别以命令行的方式和图形界面的方式，添加一个新用户，用户名为zhang，并以zhang用户登陆系统。

（2）激活root用户，并从普通用户转换至root用户。

（3）在Ubuntu中分别以命令行的方式和图形界面的方式，添加和删除一个组，组名为abc。

2、常用网络命令

（1）使用ping命令完成以下任务：检测本机网络功能是否正常，完成5次回应即可，每次间隔10秒。

（2）使用ifconfig命令查看当前网卡信息。

（3）使用finger命令查询当前主机上登录账号的信息。

三、实验过程及结果

== 用户和组的创建

=== 1. 添加新用户（命令行方式）

#block(width: 100%, inset: 8pt, fill: rgb("#ffffff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo adduser zhang
  Adding user `zhang' ...
  Enter new UNIX password: ******
  Retype new UNIX password: ******
  Full Name []: Zhang San
  Room Number []:
  Work Phone []:
  Home Phone []:
  Other []:
  Is the information correct? [Y/n] Y
  ...
  $ su - zhang
  $ whoami
  zhang
  ```
]
*操作说明：* 使用adduser命令添加新用户zhang，设置密码和信息后，切换到zhang用户并验证登录。

=== 2. 添加新用户（图形界面方式）

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  在Ubuntu设置-用户界面中，点击“添加用户”，输入用户名zhang，设置密码，完成添加。
  注：此处可插入系统用户管理界面截图。
]
*操作说明：* 通过系统设置界面添加用户，操作简单直观。

=== 3. 激活root用户并切换

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo passwd root
  Enter new UNIX password: ******
  Retype new UNIX password: ******
  passwd: password updated successfully
  $ su - root
  Password: ******
  # whoami
  root
  ```
]
*操作说明：* 设置root用户密码后，使用su命令切换到root用户。

=== 4. 添加和删除组（命令行方式）

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo groupadd abc
  $ cat /etc/group | grep abc
  abc:x:1002:
  $ sudo groupdel abc
  $ cat /etc/group | grep abc
  # 无输出，组已删除
  ```
]
*操作说明：* 使用groupadd和groupdel命令添加和删除组abc。

=== 5. 添加和删除组（图形界面方式）

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  在系统设置-用户和组管理界面，点击“添加组”，输入组名abc，完成添加。删除时选择abc组，点击“删除”。
  注：此处可插入组管理界面截图。
]
*操作说明：* 通过图形界面完成组的添加和删除。

== 常用网络命令

=== 1. ping命令检测网络功能

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ ping -c 5 -i 10 127.0.0.1
  PING 127.0.0.1 (127.0.0.1): 56 data bytes
  64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.045 ms
  64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.040 ms
  64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.039 ms
  64 bytes from 127.0.0.1: icmp_seq=4 ttl=64 time=0.038 ms
  64 bytes from 127.0.0.1: icmp_seq=5 ttl=64 time=0.037 ms
  --- 127.0.0.1 ping statistics ---
  5 packets transmitted, 5 received, 0% packet loss
  ```
]
*操作说明：* 使用ping命令检测本机网络功能，5次回应，每次间隔10秒。

=== 2. ifconfig命令查看网卡信息

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ ifconfig
  eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.100  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::a00:27ff:fe4e:66a1  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:4e:66:a1  txqueuelen 1000  (Ethernet)
        RX packets 12345  bytes 987654 (987.6 KB)
        TX packets 6789  bytes 543210 (543.2 KB)
  ...
  ```
]
*操作说明：* 使用ifconfig命令查看当前网卡信息，包括IP地址、MAC地址、收发包统计等。

=== 3. finger命令查询登录账号信息

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ finger
  Login     Name       Tty      Idle  Login Time   Office     Office Phone
  zhang     Zhang San  pts/0    00:00 2025-11-12   
  root      root       pts/1    00:00 2025-11-12   
  ...
  ```
]
*操作说明：* 使用finger命令查询当前主机上登录账号的信息。

== 实验总结

通过本次实验，掌握了Linux下用户和组的创建、删除及切换方法，熟悉了常用网络命令的使用，为后续系统管理和网络维护打下了基础。
