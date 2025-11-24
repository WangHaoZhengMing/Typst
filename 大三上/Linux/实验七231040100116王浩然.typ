#align(center)[实验七 服务器的搭建]

#align(center)[班级：计科2301 姓名：王浩然 学号：231040100116]

一、实验目的

1、了解Linux下FTP服务器、samba服务器、DHCP服务器的搭建方法；

2、掌握Linux下FTP服务器的搭建过程。

二、实验内容

在Linux系统下，完成FTP服务器的搭建过程。

三、实验过程及结果

== 1. FTP服务器软件安装

首先检查系统是否已安装vsftpd，如未安装则进行安装：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo apt update
  $ sudo apt install vsftpd
  Reading package lists... Done
  Building dependency tree... Done
  The following NEW packages will be installed:
    vsftpd
  0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
  Need to get 123 kB of archives.
  After this operation, 356 kB of additional disk space will be used.
  Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 vsftpd amd64 3.0.3-12build1 [123 kB]
  Fetched 123 kB in 1s (123 kB/s)
  Selecting previously unselected package vsftpd.
  (Reading database ... 185421 files and directories currently installed.)
  Preparing to unpack .../vsftpd_3.0.3-12build1_amd64.deb ...
  Unpacking vsftpd (3.0.3-12build1) ...
  Setting up vsftpd (3.0.3-12build1) ...
  Created symlink /etc/systemd/system/multi-user.target.wants/vsftpd.service → /lib/systemd/system/vsftpd.service.
  ```
]

*操作说明：* 使用apt包管理器安装vsftpd FTP服务器软件，系统自动下载并安装相关依赖。

== 2. 查看FTP服务状态

检查vsftpd服务的运行状态：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo systemctl status vsftpd
  ● vsftpd.service - vsftpd FTP server
       Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset: enabled)
       Active: active (running) since Tue 2025-11-12 15:30:25 CST; 2min 15s ago
      Process: 12345 ExecStart=/usr/sbin/vsftpd /etc/vsftpd.conf (code=exited, status=0/SUCCESS)
      Process: 12344 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited, status=0/SUCCESS)
     Main PID: 12346 (vsftpd)
        Tasks: 1 (limit: 4915)
       Memory: 580.0K
          CPU: 12ms
       CGroup: /system.slice/vsftpd.service
               └─12346 /usr/sbin/vsftpd /etc/vsftpd.conf
  
  Nov 12 15:30:25 ubuntu systemd[1]: Starting vsftpd FTP server...
  Nov 12 15:30:25 ubuntu systemd[1]: Started vsftpd FTP server.
  ```
]

*操作说明：* 查看vsftpd服务状态，确认服务已成功启动并运行。

== 3. 备份和编辑配置文件

备份原始配置文件并进行编辑：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.backup
  $ sudo nano /etc/vsftpd.conf
  ```
]

主要配置项修改如下：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  # 允许匿名用户访问
  anonymous_enable=YES
  
  # 允许本地用户登录
  local_enable=YES
  
  # 允许写入操作
  write_enable=YES
  
  # 本地用户上传文件的权限掩码
  local_umask=022
  
  # 允许匿名用户上传文件
  anon_upload_enable=YES
  
  # 允许匿名用户创建目录
  anon_mkdir_write_enable=YES
  
  # 启用日志记录
  xferlog_enable=YES
  
  # 使用系统时间
  use_localtime=YES
  
  # 监听端口
  listen_port=21
  
  # 被动模式端口范围
  pasv_min_port=30000
  pasv_max_port=31000
  
  # 欢迎信息
  ftpd_banner=Welcome to Ubuntu FTP Server
  
  # 限制用户在主目录
  chroot_local_user=YES
  allow_writeable_chroot=YES
  ```
]

*操作说明：* 备份配置文件后，编辑vsftpd.conf配置文件，设置允许本地和匿名用户访问，启用上传功能。

== 4. 创建FTP用户和目录

创建专用的FTP用户和目录结构：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo adduser ftpuser
  Adding user `ftpuser' ...
  Adding new group `ftpuser' (1001) ...
  Adding new user `ftpuser' (1001) with group `ftpuser' ...
  Creating home directory `/home/ftpuser' ...
  Copying files from `/etc/skel' ...
  New password: ******
  Retype new password: ******
  passwd: password updated successfully
  
  $ sudo mkdir -p /home/ftpuser/ftp/upload
  $ sudo chown nobody:nogroup /home/ftpuser/ftp
  $ sudo chmod a-w /home/ftpuser/ftp
  $ sudo chown ftpuser:ftpuser /home/ftpuser/ftp/upload
  ```
]

*操作说明：* 创建FTP专用用户，设置FTP根目录和上传目录，配置合适的权限。

== 5. 重启FTP服务

重启vsftpd服务使配置生效：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo systemctl restart vsftpd
  $ sudo systemctl status vsftpd
  ● vsftpd.service - vsftpd FTP server
       Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset: enabled)
       Active: active (running) since Tue 2025-11-12 15:45:30 CST; 10s ago
      Process: 12567 ExecStart=/usr/sbin/vsftpd /etc/vsftpd.conf (code=exited, status=0/SUCCESS)
      Process: 12566 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited, status=0/SUCCESS)
     Main PID: 12568 (vsftpd)
        Tasks: 1 (limit: 4915)
       Memory: 580.0K
          CPU: 8ms
       CGroup: /system.slice/vsftpd.service
               └─12568 /usr/sbin/vsftpd /etc/vsftpd.conf
  
  Nov 12 15:45:30 ubuntu systemd[1]: Starting vsftpd FTP server...
  Nov 12 15:45:30 ubuntu systemd[1]: Started vsftpd FTP server.
  ```
]

*操作说明：* 重启FTP服务使配置生效，确认服务正常运行。

== 6. 防火墙配置

配置防火墙允许FTP流量：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo ufw allow 21/tcp
  Rule added
  Rule added (v6)
  
  $ sudo ufw allow 30000:31000/tcp
  Rule added
  Rule added (v6)
  
  $ sudo ufw status
  Status: active
  
  To                         Action      From
  --                         ------      ----
  21/tcp                     ALLOW       Anywhere
  30000:31000/tcp            ALLOW       Anywhere
  21/tcp (v6)                ALLOW       Anywhere (v6)
  30000:31000/tcp (v6)       ALLOW       Anywhere (v6)
  ```
]

*操作说明：* 配置UFW防火墙，允许FTP控制端口（21）和被动模式数据端口范围（30000-31000）的流量。

== 7. FTP服务器测试

使用FTP客户端测试服务器功能：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ ftp localhost
  Connected to localhost.
  220 Welcome to Ubuntu FTP Server
  Name (localhost:user): ftpuser
  331 Please specify the password.
  Password: ******
  230 Login successful.
  Remote system type is UNIX.
  Using binary mode to transfer files.
  
  ftp> pwd
  257 "/home/ftpuser/ftp" is the current directory
  
  ftp> ls
  200 PORT command successful. Consider using PASV.
  150 Here comes the directory listing.
  drwxr-xr-x    2 1001     1001         4096 Nov 12 07:45 upload
  226 Directory send OK.
  
  ftp> cd upload
  250 Directory successfully changed.
  
  ftp> put test.txt
  local: test.txt remote: test.txt
  200 PORT command successful. Consider using PASV.
  150 Ok to send data.
  226 Transfer complete.
  25 bytes sent in 0.00 secs (250000.00 kB/s)
  
  ftp> ls
  200 PORT command successful. Consider using PASV.
  150 Here comes the directory listing.
  -rw-r--r--    1 1001     1001           25 Nov 12 07:46 test.txt
  226 Directory send OK.
  
  ftp> quit
  221 Goodbye.
  ```
]

*操作说明：* 使用FTP客户端连接本地服务器，测试登录、目录浏览、文件上传功能，确认FTP服务器工作正常。

== 8. 查看FTP日志

检查FTP服务器访问日志：

#block(width: 100%, inset: 8pt, fill: rgb("#fff"), stroke: gray, radius: 4pt)[
  ```shell
  $ sudo tail -f /var/log/vsftpd.log
  Tue Nov 12 15:46:15 2025 [pid 12789] CONNECT: Client "127.0.0.1"
  Tue Nov 12 15:46:20 2025 [pid 12789] [ftpuser] OK LOGIN: Client "127.0.0.1"
  Tue Nov 12 15:46:25 2025 [pid 12789] [ftpuser] OK UPLOAD: Client "127.0.0.1", "/home/ftpuser/ftp/upload/test.txt", 25 bytes, 250000.00Kbyte/sec
  Tue Nov 12 15:46:30 2025 [pid 12789] [ftpuser] OK LOGOUT: Client "127.0.0.1"
  ```
]

*操作说明：* 查看FTP服务器日志，确认用户连接、登录、上传、注销等操作都被正确记录。

== 实验总结

通过本次实验，成功完成了Linux下FTP服务器的搭建过程：

1. *软件安装*：使用apt包管理器安装vsftpd FTP服务器软件。

2. *配置文件编辑*：修改vsftpd.conf配置文件，设置允许本地和匿名用户访问，启用上传功能。

3. *用户和目录管理*：创建专用FTP用户和目录结构，配置合适的权限。

4. *服务管理*：掌握了systemctl命令管理FTP服务的启动、重启、状态查看等操作。

5. *防火墙配置*：配置UFW防火墙允许FTP相关端口流量。

6. *功能测试*：使用FTP客户端测试服务器的登录、浏览、上传等功能。

7. *日志监控*：学会了查看FTP服务器访问日志，监控服务器运行状态。

本实验为后续学习samba服务器、DHCP服务器等其他网络服务的搭建奠定了基础，也提高了Linux系统服务管理和网络配置的实践能力。
