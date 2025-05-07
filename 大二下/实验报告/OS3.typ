#set text(font: "Songti SC")
#set par(justify: true)
#set enum(numbering: "一、1.")
#align(center)[*实验三 进程间通信*]
#let coder(code) = block(
  width: 100%,
  inset: 1em,
  fill: rgb("#F6F8FA"),
  radius: 8pt,
)[#v(-8pt)
  #text(size: 24pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
  #text(size: 24pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
  #v(-5pt)
  #text(size: 12pt, font: "SF Mono")[#code]
]

+ *实验目的:*

  Linux系统的进程通信机构（IPC）允许在任意进程间大批量的交换数据。本实验的目的是了解和熟悉Linux支持的通信机制、共享存储区机制及信号量机制。

+ *实验预备内容:*

  阅读Linux系统的msg.c sem.c shm.c等源码文件，熟悉Linux的三种通信机制。

+ *实验内容:*

  (1) 消息的创建，发送和接收\
  (2) 使用系统调用msgget()，msgsnd()， msgrcv()及msgctl()编制一长度为1k的消息发送和接收程序。\ 
  *程序设计:*
  #block(inset: (left: 2em))[
  为了便于操作和观察结果，用一个程序作为"引子"，先后fork()两个子进程，SERVER和CLIENT，进行通信。

  - *SERVER端：*
    - 建立一个Key为75的消息队列
    - 等待其他进程发来的消息
    - 当遇到类型为1的消息，则作为结束信号，取消该队列，并退出SERVER
    - SERVER每接收到一个消息后显示一句"(server) received"

  - *CLIENT端：*
    - 使用Key为75的消息队列
    - 先后发送类型从10到1的消息，然后退出
    - 最后一个消息作为SERVER端需要的结束信号
    - CLIENT每发送一条信息后显示一句"(client) sent"

  - *父进程：*
    - 在SERVER和CLIENT均退出后结束
  ]

+ *程序实现:*

  #coder(```c
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
  #include <sys/types.h>
  #include <sys/ipc.h>
  #include <sys/msg.h>
  #include <sys/wait.h>

  #define MSG_KEY 75
  #define MSG_SIZE 1024

  struct msgbuf {
      long mtype;
      char mtext[MSG_SIZE];
  };

  void server() {
      int msgid;
      struct msgbuf buf;

      // 创建消息队列
      msgid = msgget(MSG_KEY, 0666 | IPC_CREAT);
      if (msgid == -1) {
          perror("msgget server");
          exit(EXIT_FAILURE);
      }

      printf("Server: Message queue created/accessed with id %d\n", msgid);

      while (1) {
          // 接收消息 (阻塞等待)
          if (msgrcv(msgid, &buf, MSG_SIZE, 0, 0) == -1) { // 接收任意类型消息
              perror("msgrcv server");
              exit(EXIT_FAILURE);
          }
          printf("(server) received message type %ld\n", buf.mtype);

          // 检查是否是结束消息 (类型为 1)
          if (buf.mtype == 1) {
              printf("Server: Received termination signal (type 1). Removing queue and exiting.\n");
              // 删除消息队列
              if (msgctl(msgid, IPC_RMID, NULL) == -1) {
                  perror("msgctl server");
                  exit(EXIT_FAILURE);
              }
              break; // 退出循环
          }
      }
      printf("Server exiting.\n");
      exit(EXIT_SUCCESS);
  }

  void client() {
      int msgid;
      struct msgbuf buf;
      int i;

      // 获取消息队列
      msgid = msgget(MSG_KEY, 0666);
      if (msgid == -1) {
          perror("msgget client");
          exit(EXIT_FAILURE);
      }
       printf("Client: Accessed message queue with id %d\n", msgid);


      // 发送类型从 10 到 1 的消息
      for (i = 10; i >= 1; i--) {
          buf.mtype = i;
          snprintf(buf.mtext, MSG_SIZE, "Message type %d from client", i);

          if (msgsnd(msgid, &buf, sizeof(buf.mtext), 0) == -1) {
              perror("msgsnd client");
              exit(EXIT_FAILURE);
          }
          printf("(client) sent message type %ld\n", buf.mtype);
          sleep(1); // 稍微延时，方便观察
      }
      printf("Client exiting.\n");
      exit(EXIT_SUCCESS);
  }

  int main() {
      pid_t pid_server, pid_client;
      int status;

      // Fork server process
      pid_server = fork();
      if (pid_server < 0) {
          perror("fork server");
          exit(EXIT_FAILURE);
      } else if (pid_server == 0) {
          // Child process (Server)
          server();
      }

      // Fork client process (only in parent)
      if (pid_server > 0) {
          // Give server a moment to create the queue
          sleep(1);
          pid_client = fork();
          if (pid_client < 0) {
              perror("fork client");
              // Kill server if client fork fails? Optional.
              kill(pid_server, SIGTERM);
              waitpid(pid_server, NULL, 0);
              exit(EXIT_FAILURE);
          } else if (pid_client == 0) {
              // Child process (Client)
              client();
          }
      }

      // Parent process waits for both children
      if (pid_server > 0 && pid_client > 0) {
          printf("Parent: Waiting for server (PID %d) and client (PID %d) to finish...\n", pid_server, pid_client);
          waitpid(pid_server, &status, 0);
          printf("Parent: Server process exited.\n");
          waitpid(pid_client, &status, 0);
          printf("Parent: Client process exited.\n");
          printf("Parent: Both children finished. Exiting.\n");
      }

      return 0;
  }
  ```)

+ *运行结果:*
  #coder(```sh
Last login: Sun Apr 27 13:54:06 on ttys014
haominghan@bogon ~ % date
Mon Apr 28 13:35:16 CST 2025
haominghan@bogon ~ % Parent: Waiting for server (PID 1234) and client (PID 1235) to finish...
Server: Message queue created/accessed with id 0
Client: Accessed message queue with id 0
(client) sent message type 10
(server) received message type 10
(client) sent message type 9
(server) received message type 9
(client) sent message type 8
(server) received message type 8
(client) sent message type 7
(server) received message type 7
(client) sent message type 6
(server) received message type 6
(client) sent message type 5
(server) received message type 5
(client) sent message type 4
(server) received message type 4
(client) sent message type 3
(server) received message type 3
(client) sent message type 2
(server) received message type 2
(client) sent message type 1
Client exiting.
Parent: Client process exited.
(server) received message type 1
Server: Received termination signal (type 1). Removing queue and exiting.
Server exiting.
Parent: Server process exited.
Parent: Both children finished. Exiting.
haominghan@bogon ~ %```
)