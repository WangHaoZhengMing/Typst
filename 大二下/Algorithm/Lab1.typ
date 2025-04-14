#import "@preview/cetz:0.3.4": *
#import "@preview/cetz-plot:0.1.0": *
#let question_counter = counter("question")

#let problem(body) = {
  text(fill: blue)[* Problem #question_counter.step() . * #sym.space ]
  body
}
#block(
  // stroke: gray + 0.5pt,
  inset: 8pt,
  radius: 4pt,
)[
  #set text(size: 0.8em)
  *Remarks:*
  - In all the algorithm design problems, a correct pseudo-code or description of the algorithm will give you a majority of the points.
  - If the algorithm you designed is a greedy algorithm, you need to prove its correctness to get a full score. The most convenient way to do this is to describe the three elements:
    + the decision you make for each step
    + proof of the safety of the decision
    + a reduction of the instance after you made the decision
    If additionally, you are asked to achieve a certain running time, a pseudo-code on top of the three elements is sufficient.
  - If the algorithm you designed is a divide and conquer algorithm, you need to describe:
    + the input and the output of the recursion
    + the recurrence for the running time
    + the final running time
  - The examples are given to help you understand the problems. There might be multiple optimum solutions for the given input instance; it is OK if your algorithm outputs a different optimum solution from the one provided.
]

#problem([In the interval covering problem, we are given $n$ intervals $[s_1, t_1], [s_2, t_2], dots, [s_n, t_n]$ such that $union_(i in [n]) [s_i, t_i] = [0, T]$ for some given $T$. The goal of the problem is to return a smallest-size set $S subset.eq [n]$ such that $union_(i in S) [s_i, t_i] = [0, T]$. Design a greedy algorithm to solve this problem. To get a full mark for this problem, the running time of the algorithm should be $O(n log n)$.])

#figure(
  canvas(
    // scale
    {
      import draw: *
      // rect((-5,0), (-2,1))
      // rect((-2,0), (1,1))
      // content((-3.5,0.5), [OP])
      grid((-5, -3), (11, 2), help-lines: true)
      line((-5, 1), (11, 1))
      for i in (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16) {
        content((i - 5, 1.3), [#(i * 10)])
        line((i - 5, 1), (i - 5, -2), stroke: (dash: "dashed"))
      }
    },
  ),
)

#problem([Given two sequences $A$ and $B$ of letters, the sequence $A$ is a sub-sequence of $B$, if $A$ can be obtained from $B$ by removing some letters. For example, "abcadb" is a sub-sequence of "badbaccaddfb" as you can remove letters as follows: "badbaccaddfb".

  Given two sequences $A$ and $B$ of letters with total length $n$, design an $O(n)$-time algorithm to decide if $A$ is a sub-sequence of $B$.])

```rust
fn is_subsequence(a: &str, b: &str) -> bool {
    let mut num = 0;
    let mut a_inter = a.chars().peekable();
    b.chars().for_each(|item| {
        if Some(item) == a_inter.peek().copied() {
            num += 1;
            a_inter.next();
        }
    });
    num == a.len()
}

fn main() {
    let a = "abcadb";
    let b = "badbacaddfb";
    println!("{}", is_subsequence(a, b)); // 输出: true

    let a = "abc";
    let b = "def";
    println!("{}", is_subsequence(a, b)); // 输出: false
}


```
#problem()[
  Problem 3: Minimizing Lateness. Please write code to implement a solution to Minimizing Lateness, and analyse the time complexity of your solution.]

```rust
use std::cmp::max; // 导入 max 函数

#[derive(Debug, Clone)] // 添加 PartialEq, Eq 以便测试
struct Job {
    id: i32,
    start: i32,    // 作业就绪时间 (release time)
    duration: i32, // 作业处理时长
    deadline: i32, // 作业截止时间
}
//此算法可以衡量系统的最差性能（Worst-Case Performance Guarantee
/// - 作业不可抢占。
/// - 作业在其 `start` 时间或之后才能开始。
fn minimize_max_lateness(mut jobs: Vec<Job>) -> (Vec<Job>, i32) {
    // 1. 按 'deadline' 时间升序排序
    jobs.sort_by(|a, b| a.deadline.cmp(&b.deadline));

    // 预分配容量
    let mut scheduled_jobs = Vec::with_capacity(jobs.len());
    let mut current_time = 0; // 跟踪处理器何时变为空闲
    let mut max_lateness = i32::MIN; // 初始化为可能的最小值，以正确处理负延迟
    for job in jobs.iter() {
        let actual_start_time = max(current_time, job.start);
        let finish_time = actual_start_time + job.duration;
        let lateness = finish_time - job.deadline;
        max_lateness = max(max_lateness, lateness);
        current_time = finish_time;
        scheduled_jobs.push(job.clone());
    }

    (scheduled_jobs, max_lateness)
}
```



#problem()[Jump Game. Given an array of non-negative integers, you are initially positioned at the first index of the array. Each element in the array represents your maximum jump length at that position.\
  Determine if you are able to reach the last index.\
  Example 1:
  Input: [2,3,1,1,4]\
  Output: true\
  Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.]
```rust
fn main() {
    let input = vec![3, 2, 1, 0, 4];
    let mut max_reach = 1;

    for (index, item) in input.iter().enumerate() {
        if max_reach < index + 1 {
            print!("no")
        }
        let current_reach = index + item + 1;
        max_reach = max_reach.max(current_reach);
    }
}
```
