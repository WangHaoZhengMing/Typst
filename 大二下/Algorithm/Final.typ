#set text(font: ("Times New Roman", "pingfang sc"), size: 14pt) // Trying to match the font from the image
#import "@preview/cetz:0.3.4": *
#import "@preview/cetz-plot:0.1.0": *
#set page(margin: (x: 1in, y: 1in))

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

+ In the interval covering problem, we are given $n$ intervals $[s_1, t_1], [s_2, t_2], dots, [s_n, t_n]$ such that $union_(i in [n]) [s_i, t_i] = [0, T]$ for some given $T$. The goal of the problem is to return a smallest-size set $S subset.eq [n]$ such that $union_(i in S) [s_i, t_i] = [0, T]$. Design a greedy algorithm to solve this problem. To get a full mark for this problem, the running time of the algorithm should be $O(n log n)$.

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

#coder(```rust
fn interval_covering(intervals: &mut [(usize, usize)], t: usize) -> Vec<usize> {
    // 按照结束时间排序
    intervals.sort_by_key(|&(_, end)| end);

    let mut result = Vec::new();
    let mut current_end = 0;

    while current_end < t {
        // 找到开始时间 ≤ current_end 且结束时间最远的区间
        let next_interval = intervals.iter()
            .enumerate()
            .filter(|&(_, &(start, _))| start <= current_end)
            .max_by_key(|&(_, &(_, end))| end);

        match next_interval {
            Some((idx, &(_, end))) => {
                result.push(idx);
                current_end = end;

                // 如果已经覆盖了[0,T)，则返回结果
                if current_end >= t {
                    break;
                }
            },
            None => return Vec::new() // 无解
        }
    }

    result
}

// 时间复杂度: O(n log n) - 排序需要O(n log n)，之后的贪心选择过程需要O(n²)
// 空间复杂度: O(n) - 存储结果
```)

// Question 2 (from pages 4 & 5)
2. #text(
    fill: blue,
  )[Given two sequences A and B of letters, the sequence A is a sub-sequence of B, if A can be obtained from B by removing some letters. For example, "abcadb" is a sub-sequence of "badbaccaddfb" as you can remove letters as follows: "badba#strike[e]caddfb". Given two sequences A and B of letters with total length $n$, design an $O(n)$-time algorithm to decide if A is a sub-sequence of B.]

#coder(```rust
// 更直观的实现方式
fn is_subsequence_alt(a: &str, b: &str) -> bool {
    let mut a_iter = a.chars();
    let mut current = a_iter.next(); //获取 a 的第一个字符

    for b_char in b.chars() {
        if let Some(a_char) = current {
            if a_char == b_char {
                current = a_iter.next();
            }
        } else {
            return true; // 已经匹配完所有a中的字符
        }
    }

    current.is_none() // 如果a中的所有字符都匹配完，则a是b的子序列
}

// 时间复杂度：O(n) - n是a和b的总长度
// 空间复杂度：O(1) - 只需要常量额外空间
```)

// Question 3 (from pages 4 & 5)
3. Topological Ordering Problem. Given a directed acyclic graph (有向无环图) $G=(V,E)$, design a map function $pi: V -> {1, 2, 3, ..., n}$ so that if $(u, v) in E$ then $pi(u) < pi(v)$ (it is that for an edge $(u, v) in E$, $u$ precedes $v$ in the ordering $pi$). Please designe a solution for this problem and analyze time complexity of your designed solution.

#coder(```rust
use std::collections::{HashMap, VecDeque};

fn topological_sort(graph: &HashMap<usize, Vec<usize>>, num_vertices: usize) -> Vec<usize> {
    // 计算每个顶点的入度
    let mut in_degree = vec![0; num_vertices];

    graph.values()
        .flatten()
        .for_each(|&v| in_degree[v] += 1);

    // 找出所有入度为0的顶点
    let mut queue: VecDeque<usize> = (0..num_vertices)
        .filter(|&v| in_degree[v] == 0)
        .collect();

    let mut result = Vec::with_capacity(num_vertices);

    while let Some(u) = queue.pop_front() {
        result.push(u);

        // 减少所有相邻顶点的入度
        graph.get(&u)
            .iter()
            .flat_map(|neighbors| neighbors.iter())
            .for_each(|&v| {
                in_degree[v] -= 1;
                if in_degree[v] == 0 {
                    queue.push_back(v);
                }
            });
    }

    // 如果不能处理所有顶点，则图中有环
    if result.len() != num_vertices {
        return Vec::new();
    }

    result
}

// 时间复杂度：O(V + E) - V是顶点数，E是边数
// 空间复杂度：O(V + E) - 存储图结构和结果
```)

// Question 4 (from page 3)
4. Please design solution to Find the $i$th largest number of $n$ numbers with divide and conquer and analyze its time complexity.

#coder(```rust
fn find_ith_largest(arr: &mut [i32], i: usize) -> Option<i32> {
    if i == 0 || i > arr.len() {
        return None;
    }

    // 第i大的元素是第(len - i)小的元素（0-indexed）
    let target_idx = arr.len() - i;

    fn quick_select(arr: &mut [i32], target: usize, start: usize, end: usize) -> i32 {
        if start == end {
            return arr[start];
        }

        let pivot_idx = partition(arr, start, end);

        match pivot_idx.cmp(&target) {
            std::cmp::Ordering::Equal => arr[pivot_idx],
            std::cmp::Ordering::Greater => quick_select(arr, target, start, pivot_idx - 1),
            std::cmp::Ordering::Less => quick_select(arr, target, pivot_idx + 1, end)
        }
    }

    fn partition(arr: &mut [i32], start: usize, end: usize) -> usize {
        let pivot = arr[end];
        let mut i = start;

        for j in start..end {
            if arr[j] <= pivot {
                arr.swap(i, j);
                i += 1;
            }
        }

        arr.swap(i, end);
        i
    }

    Some(quick_select(arr, target_idx, 0, arr.len() - 1))
}

复杂度：O(log n) - 递归调用栈的深度
```)

#pagebreak()

// Question 5 (from page 3)
5. Maximum Product Cutting. Given a rope of length $n$ meters, cut the rope into different parts of integer lengths in a way that maximizes the product (乘积) of the lengths of all parts. You must make at least one cut. Assume that the length of the rope is more than 2 meters. Please use dynamic programming algorithm to design a solution and analyze time complexity of the solution.

#coder(```rust
fn max_product_cutting(n: usize) -> usize {
    if n <= 1 {
        return 0; // 不可能有效切割
    }

    // dp[i] 表示长度为i的绳子切割后的最大乘积
    let mut dp = vec![0; n + 1];

    // 基础情况
    dp[1] = 1; // 长度为1的绳子不能再切割
    dp[2] = 1; // 长度为2的绳子只能切成1+1，乘积为1

    // 自底向上填充dp表
    for i in 3..=n {
        // 方案1: 切割成两段，分别为j和i-j
        for j in 1..=i/2 {
            // 计算两种可能性：
            // 1. j*(i-j): 切成j和i-j两段，不再继续切割
            // 2. j*dp[i-j]: 切成j和i-j两段，其中i-j段继续按最优切割
            dp[i] = dp[i].max(j * (i-j).max(dp[i-j]));
        }
    }

    dp[n]
}

// 时间复杂度：O(n²) - 两层嵌套循环，外层循环n次，内层循环n/2次
// 空间复杂度：O(n) - 需要大小为n+1的dp数组
```)

// Question 6 (from page 3)
6. Number Tower (数字塔). Find a path from the top to the bottom in the digital triangle that maximizes the sum of the numbers passing through the path. Every step on the path can only be taken to the bottom left or bottom right. Just need to calculate the maximum sum, there is no need to provide a specific path. Please provide a solution using the dynamic programming algorithm and analyze the time complexity of the solution. Please design a solution with dynamic programming algorithm and analyze its time complexity.

#coder(```rust
fn number_tower_max_path_sum(triangle: &Vec<Vec<i32>>) -> i32 {
    if triangle.is_empty() {
        return 0;
    }

    let height = triangle.len();

    // 创建dp数组，初始化为最后一行的值
    let mut dp = triangle.last().unwrap().clone();

    // 从倒数第二行开始，自底向上更新dp数组
    for i in (0..height-1).rev() {
        for j in 0..=i {
            // 当前位置的最大路径和 = 当前位置的值 + 下一行左右两个位置的最大路径和
            dp[j] = triangle[i][j] + dp[j].max(dp[j+1]);
        }
    }

    // 最终dp[0]就是从顶部到底部的最大路径和
    dp[0]
}

// 更简洁的解决方案，使用原地修改
fn number_tower_max_path_sum_inplace(mut triangle: Vec<Vec<i32>>) -> i32 {
    let height = triangle.len();

    (1..height).for_each(|i| {
        (0..i+1).for_each(|j| {
            let left = if j > 0 { triangle[i-1][j-1] } else { 0 };
            let right = if j < i { triangle[i-1][j] } else { 0 };
            triangle[i][j] += left.max(right);
        });
    });

    *triangle.last()
        .unwrap_or(&vec![0])
        .iter()
        .max()
        .unwrap_or(&0)
}

// 时间复杂度：O(n²) - 其中n是三角形的高度，总共有约n²/2个元素需要计算
// 空间复杂度：O(n) - 使用长度为n的dp数组
```)

// Question 7 (from pages 2 & 3)
7. Jump Game. Given an array of non-negative integers, you are initially positioned at the first index of the array. Each element in the array represents your maximum jump length at that position. Determine if you are able to reach the last index. \
  *Example 1:* \
  *Input:* `[3,3,1,1,4]` \
  *Output:* true \
  *Explanation:* Jump 1 step from index 0 to 1, then 3 steps to the last index.

#coder(```rust
fn can_jump(nums: &[i32]) -> bool {
    let mut max_reach = 0;

    nums.iter()
        .enumerate()
        .take_while(|&(i, _)| i <= max_reach)
        .for_each(|(i, &jump)| {
            max_reach = max_reach.max(i + jump as usize);
        });

    max_reach >= nums.len() - 1
}

// 另一种更命令式的写法
fn can_jump_alternative(nums: &[i32]) -> bool {
    let n = nums.len();
    let mut max_reach = 0;

    for i in 0..n {
        // 如果当前位置已经超过了能到达的最远距离，则无法到达终点
        if i > max_reach {
            return false;
        }

        // 更新能到达的最远距离
        max_reach = max_reach.max(i + nums[i] as usize);

        // 如果已经可以到达终点，则提前返回
        if max_reach >= n - 1 {
            return true;
        }
    }

    true
}

// 时间复杂度：O(n) - 其中n是数组的长度，只需遍历一次数组
// 空间复杂度：O(1) - 只使用常量额外空间
```)

// Question 8 (from page 2)
8. Please use the dynamic programming method to resolve the Weighted Interval Scheduling, and analyze the time complexity of your solution.

#coder(```rust
struct Interval {
    start: usize,
    end: usize,
    weight: i32,
}

fn weighted_interval_scheduling(intervals: &mut [Interval]) -> i32 {
    if intervals.is_empty() {
        return 0;
    }

    // 按结束时间排序
    intervals.sort_by_key(|i| i.end);
    let n = intervals.len();

    // 预处理：找出每个区间的前一个兼容区间
    // p[i]表示与区间i兼容且结束时间最晚的区间的索引
    let mut p = vec![0; n];
    for i in 0..n {
        p[i] = binary_search_prev_compatible(intervals, i);
    }

    // dp[i]表示考虑前i个区间的最大权重和
    let mut dp = vec![0; n + 1];

    for i in 1..=n {
        // 选择当前区间，加上与其兼容的前一个区间的最优解
        let with_current = intervals[i-1].weight +
            if p[i-1] != usize::MAX { dp[p[i-1]] } else { 0 };

        // 不选择当前区间，保持前i-1个区间的最优解
        let without_current = dp[i-1];

        dp[i] = with_current.max(without_current);
    }

    dp[n]
}

fn binary_search_prev_compatible(intervals: &[Interval], current_idx: usize) -> usize {
    let current_start = intervals[current_idx].start;

    // 二分查找结束时间小于等于当前开始时间的最大索引
    let mut low = 0;
    let mut high = current_idx;
    let mut result = usize::MAX;

    while low < high {
        let mid = low + (high - low) / 2;

        if intervals[mid].end <= current_start {
            result = mid;
            low = mid + 1;
        } else {
            high = mid;
        }
    }

    result
}

// 时间复杂度：O(n log n) - 排序需要O(n log n)，二分查找前置兼容区间需要O(n log n)，DP过程需要O(n)
// 空间复杂度：O(n) - 存储dp数组和前置兼容区间数组
```)

// Question 9 (from page 1)
9. You are climbing a stair case. It takes $n$ steps to reach to the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top? Please design a solution with dynamic programming and analyse the complexity of the solution.

#coder(```rust
fn climb_stairs(n: usize) -> usize {
    if n <= 1 {
        return 1;
    }

    // 使用动态规划，dp[i]表示爬到第i阶的方法数
    let mut dp = vec![0; n + 1];
    dp[0] = 1; // 基础情况，0阶有1种方法
    dp[1] = 1; // 基础情况，1阶有1种方法

    // 填充dp表
    for i in 2..=n {
        dp[i] = dp[i-1] + dp[i-2]; // 可以从i-1阶爬1步或从i-2阶爬2步
    }

    dp[n]
}

// 空间优化版本
fn climb_stairs_optimized(n: usize) -> usize {
    if n <= 1 {
        return 1;
    }

    let mut prev1 = 1; // dp[i-1]
    let mut prev2 = 1; // dp[i-2]
    let mut current = 0;

    for _ in 2..=n {
        current = prev1 + prev2;
        prev2 = prev1;
        prev1 = current;
    }

    current
}

// 时间复杂度：O(n) - 需要计算从2到n的每个台阶的方法数
// 空间复杂度：O(n) - 标准版本使用大小为n+1的dp数组
// 空间复杂度：O(1) - 优化版本只使用常量额外空间
```)

// Question 10 (from page 1)
10. Counting Inversions problem. Please use divide and conquer to solve the Counting Inversions problem and analyse the complexity of your solution.

#coder(```rust
fn count_inversions(arr: &[i32]) -> (Vec<i32>, usize) {
    if arr.len() <= 1 {
        return (arr.to_vec(), 0);
    }

    let mid = arr.len() / 2;

    // 分治
    let (left_sorted, left_inv) = count_inversions(&arr[..mid]);
    let (right_sorted, right_inv) = count_inversions(&arr[mid..]);

    // 合并两个已排序的子数组，并计算跨越两个子数组的逆序对
    let (merged, split_inv) = merge_and_count(&left_sorted, &right_sorted);

    // 总的逆序对 = 左半部分逆序对 + 右半部分逆序对 + 跨越两个子数组的逆序对
    (merged, left_inv + right_inv + split_inv)
}

fn merge_and_count(left: &[i32], right: &[i32]) -> (Vec<i32>, usize) {
    let mut result = Vec::with_capacity(left.len() + right.len());
    let mut inversions = 0;
    let mut i = 0;
    let mut j = 0;

    while i < left.len() && j < right.len() {
        if left[i] <= right[j] {
            result.push(left[i]);
            i += 1;
        } else {
            result.push(right[j]);
            j += 1;
            // 当右边的元素较小时，左边剩余的所有元素都会形成逆序对
            inversions += left.len() - i;
        }
    }

    // 处理剩余元素
    result.extend_from_slice(&left[i..]);
    result.extend_from_slice(&right[j..]);

    (result, inversions)
}

// 对外暴露的简单接口
fn count_inversions_simple(arr: &[i32]) -> usize {
    count_inversions(arr).1
}

// 时间复杂度：O(n log n) - 使用归并排序的分治思想，每层递归需要O(n)，总共有log n层
// 空间复杂度：O(n) - 需要额外的数组来存储合并结果
```)
