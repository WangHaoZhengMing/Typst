extension Array where Element: Comparable {
    /// 使用 TimSort 算法对数组进行排序
    /// - Parameter areInIncreasingOrder: 可选的比较闭包，用于确定元素的顺序
    mutating func timSort(by areInIncreasingOrder: ((Element, Element) -> Bool)? = nil) {
        let minRun = 32  // TimSort 的最小子数组大小
        let n = self.count
        
        let comparator: (Element, Element) -> Bool = areInIncreasingOrder ?? { $0 < $1 }
        
        // 对每个 minRun 大小的子数组使用插入排序进行排序
        for i in stride(from: 0, to: n, by: minRun) {
            insertionSort(start: i, end: min(i + minRun - 1, n - 1), by: comparator)
        }
        
        var size = minRun
        while size < n {
            // 归并相邻的已排序子数组
            for left in stride(from: 0, to: n, by: 2 * size) {
                let mid = left + size - 1
                let right = min(left + 2 * size - 1, n - 1)
                if mid < right {
                    merge(left: left, mid: mid, right: right, by: comparator)
                }
            }
            size *= 2  // 每次归并后，子数组的大小翻倍
        }
    }
    
    /// 插入排序用于对小规模数组进行排序
    private mutating func insertionSort(start: Int, end: Int, by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in (start + 1)...end {
            let key = self[i]
            var j = i - 1
            while j >= start && !areInIncreasingOrder(self[j], key) {
                self[j + 1] = self[j]
                j -= 1
            }
            self[j + 1] = key
        }
    }
    
    /// 归并两个已排序的子数组
    private mutating func merge(left: Int, mid: Int, right: Int, by areInIncreasingOrder: (Element, Element) -> Bool) {
        let leftSub = Array(self[left...mid])  // 左半部分
        let rightSub = Array(self[(mid + 1)...right])  // 右半部分
        
        var i = 0, j = 0, k = left
        // 合并两个已排序数组
        while i < leftSub.count && j < rightSub.count {
            if areInIncreasingOrder(leftSub[i], rightSub[j]) {
                self[k] = leftSub[i]
                i += 1
            } else {
                self[k] = rightSub[j]
                j += 1
            }
            k += 1
        }
        
        // 处理左半部分剩余的元素
        while i < leftSub.count {
            self[k] = leftSub[i]
            i += 1
            k += 1
        }
        
        // 处理右半部分剩余的元素
        while j < rightSub.count {
            self[k] = rightSub[j]
            j += 1
            k += 1
        }
    }
}

// 测试示例
var numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
numbers.timSort()  // 使用默认比较器
print(numbers)  // 输出排序后的数组

// 使用闭包进行降序排序
var numbersDesc = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
numbersDesc.timSort(by: >)  // 使用大于号作为比较器
print(numbersDesc)  // 输出降序排序后的数组

// 使用自定义闭包排序
var people = [(name: "Alice", age: 25), (name: "Bob", age: 30), (name: "Charlie", age: 20)]
people.timSort { $0.age < $1.age }  // 按年龄升序排序
print(people)
