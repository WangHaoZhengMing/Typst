import Foundation

//MARK: 贪心地选择不大于且最接近它的硬币
func coinChangeGreedy(coins: [Int], amt: Int) -> Int {
    // 使用 reduce 来处理贪心选择
    let (finalAmount, count) =
        coins
        .sorted(by: >)  // 确保从大到小排序
        .reduce((amount: amt, count: 0)) { (result, coin) in
            guard result.amount > 0 else { return result }

            // 计算当前面额可以用多少次
            let times = result.amount / coin
            let remaining = result.amount % coin

            return (amount: remaining, count: result.count + times)
        }

    // 如果剩余金额为0则返回计数，否则返回-1
    return finalAmount == 0 ? count : -1
}

func coinChangeGreedy2(coins: [Int], amt: Int) -> Int {
    let (finalAmount, count) =
        coins
        .sorted(by: >)
        .reduce((amt, 0)) {
            $0.0 <= 0
                ? $0
                : ($0.0 % $1, $0.1 + $0.0 / $1)
        }  //I can understand this haha
    return finalAmount == 0 ? count : -1
}

func coinChangeGreedy3(coins: [Int], amt: Int) -> Int {
    let (finalAmount, count) =
        coins
        .sorted(by: >)
        .reduce((amt, 0)) {
            print("Result: \($0), Coin: \($1)")
            return $0.0 <= 0 ? $0 : ($0.0 % $1, $0.1 + $0.0 / $1)
        }
    return finalAmount == 0 ? count : -1
}

print(coinChangeGreedy3(coins: [25, 10, 5, 1], amt: 67))

//MARK: 区间调度问题
func scheduleClasses(intervals: [(start: Int, end: Int)]) -> Int {
    let (_, count) =
        intervals  //_ 就是“这个位置的值我不在乎”的简洁写法。
        .sorted(by: { $0.end < $1.end })  // 按结束时间排序
        .reduce((-1, 0)) {  // 初始值：(上一次结束时间, 课程数)
            $0.0 > $1.start ? $0 : ($1.end, $0.1 + 1)
        }
    return count
}

// 测试数据（时间简化成整数，比如 8 表示 08:00）
let classes = [
    (start: 8, end: 9),  // A
    (start: 8, end: 10),  // B
    (start: 9, end: 11),  // C
    (start: 10, end: 11),  // D
    (start: 11, end: 12),  // E
    (start: 12, end: 14),  // F
]

print(scheduleClasses(intervals: classes))  // 输出: 4

//MARK: knapsack问题
class Item {
    var w: Int
    var v: Int
    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    let sortedItems =
        zip(wgt, val)
        .map { Item(w: $0, v: $1) }
        .sorted { Double($0.v) / Double($0.w) > Double($1.v) / Double($1.w) }
    let finalValue = sortedItems.reduce((remainingCap: cap, value: 0.0)) { partialResult, item in
        guard partialResult.remainingCap > 0 else { return partialResult }
        if partialResult.remainingCap > item.w {
            return (partialResult.remainingCap - item.w, partialResult.value + Double(item.v))
        } else {
            return (
                0,partialResult.value + Double(item.v) / Double(item.w)
                    * Double(partialResult.remainingCap)
            )
        }
    }.value
    return finalValue
}

let wgt = [10, 20, 30]
let val = [60, 100, 120]
let cap = 50
print(fractionalKnapsack(wgt: wgt, val: val, cap: cap))  // 输出: 240.0
