// 文档设置
#set text(font: "pingfang sc", lang: "zh") // 使用支持中文的字体，例如 "New Computer Modern", "Noto Sans CJK SC" 等
#set heading(numbering: "1.1") // 设置标题编号格式

// 页面设置 (可选)
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
)

// 标题
#align(center)[
  #text(size: 20pt, weight: "bold")[区间覆盖问题分析与 Rust 实现]
]

#v(1.5em) // 垂直间距

= 问题描述

我们给定 $n$ 个半开半闭区间，形式为 $[s_1, t_1), [s_2, t_2), dots, [s_n, t_n)$。
已知这些区间的并集能够完全覆盖一个给定的目标区间 $[0, T)$，也就是说 $union_(i in {1, dots, n}) [s_i, t_i) = [0, T)$，其中 $T$ 是一个给定的正数。

问题的目标是：从这 $n$ 个区间中找出一个规模最小的子集 $S$ (即 $S$ 中包含的区间数量最少)，使得这个子集 $S$ 中的区间的并集也能够完全覆盖目标区间 $[0, T)$。
形式化地说，我们要找到 $S subset {1, ..., n}$，使得 $union_(i in S) [s_i, t_i) = [0, T)$，并且 $|S|$ 最小。

任务是设计一个贪心算法来解决此问题，并分析所设计算法的时间复杂度。

= 贪心算法思路

解决区间覆盖问题的经典贪心策略如下：

1.  *排序 (Sort)*：
    首先，将所有给定的 $n$ 个区间按照它们的起始点 $s_i$ 进行升序排序。如果两个区间的起始点相同，则按照它们的结束点 $t_i$ 进行降序排序。按结束点降序排序的目的是，当有多个区间从同一点开始时，优先选择那个能覆盖到更远位置的区间，这有助于做出更优的局部选择。

2.  *选择与推进 (Select and Advance)*：
    - 初始化当前已覆盖到的最远点 `current_coverage_end = 0`。
    - 初始化结果集合 `result_intervals` 为空。
    - 设置一个索引 `interval_idx = 0` 来遍历排序后的区间列表。
    - *主循环*：当 `current_coverage_end < T` 时，重复以下步骤：
        a.  *寻找最佳延伸区间*：在所有尚未被考虑过且其起始点 $s_j <= "current_coverage_end"$ 的区间中，找到一个能够使得结束点 $t_j$ 最大的区间。\
        b.  *覆盖检查*：如果找不到任何能够延伸当前覆盖范围的区间，并且 `current_coverage_end < T`，则说明无法覆盖整个区间 (根据题目描述，此情况不应发生)。\
        c.  *选择区间*：将找到的最佳延伸区间加入到 `result_intervals` 中。\
        d.  *更新覆盖范围*：将 `current_coverage_end` 更新为选中区间的结束点 $t_j$。

= Rust 代码实现

下面是区间覆盖问题的 Rust 实现：

#block(fill: luma(240), inset: 10pt, radius: 3pt, stroke: luma(180))[
```rust
// 定义区间结构体
#[derive(Debug, Clone, PartialEq, Eq)]
struct Interval {
    start: i32, // 区间起始点 (包含)
    end: i32,   // 区间结束点 (不包含)
}

/// 寻找最小区间集合以覆盖目标范围 [0, target_t)
fn smallest_set_to_cover_range(
    mut intervals: Vec<Interval>,
    target_t: i32,
) -> Result<Vec<Interval>, String> {
    if target_t == 0 {
        return Ok(Vec::new());
    }

    // 1. 排序区间
    intervals.sort_by(|a, b| {
        if a.start != b.start {
            a.start.cmp(&b.start) // 起始点升序
        } else {
            b.end.cmp(&a.end) // 结束点降序
        }
    });

    let mut result_intervals: Vec<Interval> = Vec::new();
    let n = intervals.len();
    let mut current_scan_idx = 0;
    let mut current_coverage_end = 0;

    while current_coverage_end < target_t {
        let mut farthest_reach_this_step = current_coverage_end;
        let mut best_interval_this_step: Option<Interval> = None;
        let mut next_scan_idx_candidate = current_scan_idx;

        while next_scan_idx_candidate < n &&
              intervals[next_scan_idx_candidate].start <= current_coverage_end {
            if intervals[next_scan_idx_candidate].end > farthest_reach_this_step {
                farthest_reach_this_step = intervals[next_scan_idx_candidate].end;
                best_interval_this_step = Some(intervals[next_scan_idx_candidate].clone());
            }
            next_scan_idx_candidate += 1;
        }

        if best_interval_this_step.is_none() {
            return Err(format!(
                "无法覆盖目标范围。覆盖卡在了 {}。",
                current_coverage_end
            ));
        }

        result_intervals.push(best_interval_this_step.unwrap());
        current_coverage_end = farthest_reach_this_step;
        current_scan_idx = next_scan_idx_candidate;
    }

    Ok(result_intervals)
}

// 主函数，用于测试 (为简洁起见，此处省略了 main 函数的完整示例调用)
// pub fn main() { /* ... 测试用例 ... */ }
```
]

#v(1em)
*注意：* 上述代码块中的 `main` 函数及其测试用例为简洁起见已省略，实际使用时可以包含之前的测试代码。

= 复杂度分析

== 时间复杂度 (Time Complexity)

1.  *排序*：对 $N$ 个区间进行排序。标准的比较排序算法 (如 Rust `Vec::sort_by` 底层通常是归并排序或类似的高效算法) 的时间复杂度是 $O(N log N)$。

2.  *贪心选择*：
    - 外层 `while` 循环：设最终选出的区间数量为 $M$ (其中 $M <= N$)。外层循环最多执行 $M$ 次。
    - 内层 `while` 循环：`current_scan_idx` 和 `next_scan_idx_candidate` 这两个索引在整个算法的执行过程中，总体上只会从头到尾扫描排序后的区间列表一次。因此，所有内层循环的总迭代次数加起来是 $O(N)$。

3.  *总时间复杂度*：算法的主要时间开销在于排序步骤。因此，总时间复杂度是 $O(N log N + N) = O(N log N)$。

== 空间复杂度 (Space Complexity)

1.  *排序*：如果排序算法是原地排序，则它可能需要 $O(log N)$ 或 $O(1)$ 的辅助空间。如果使用的是像归并排序那样需要额外空间的算法，则可能需要 $O(N)$ 的辅助空间。

2.  *结果存储*：`result_intervals` 向量用于存储最终选中的区间。其大小最多为 $N$。因此，这部分的空间复杂度是 $O(M)$，其中 $M$ 是解中区间的数量 ($M <= N$)。

3.  *总空间复杂度*：综合考虑，额外的空间复杂度主要是由排序（如果非原地）和结果存储贡献的。通常可以认为是 $O(N)$。


#line()



