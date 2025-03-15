extension Array where Element: Comparable {
    /// 使用 TimSort 算法对数组进行排序
    mutating func timSort() {
        let minRun = 32  // TimSort 的最小子数组大小
        let n = self.count
        
        // 对每个 minRun 大小的子数组使用插入排序进行排序
        for i in stride(from: 0, to: n, by: minRun) {
            insertionSort(start: i, end: min(i + minRun - 1, n - 1))
        }
        
        var size = minRun
        while size < n {
            // 归并相邻的已排序子数组
            for left in stride(from: 0, to: n, by: 2 * size) {
                let mid = left + size - 1
                let right = min(left + 2 * size - 1, n - 1)
                if mid < right {
                    merge(left: left, mid: mid, right: right)
                }
            }
            size *= 2  // 每次归并后，子数组的大小翻倍
        }
    }
    
    /// 插入排序用于对小规模数组进行排序
    private mutating func insertionSort(start: Int, end: Int) {
        for i in (start + 1)...end {
            let key = self[i]
            var j = i - 1
            while j >= start && self[j] > key {
                self[j + 1] = self[j]
                j -= 1
            }
            self[j + 1] = key
        }
    }
    
    /// 归并两个已排序的子数组
    private mutating func merge(left: Int, mid: Int, right: Int) {
        let leftSub = Array(self[left...mid])  // 左半部分
        let rightSub = Array(self[(mid + 1)...right])  // 右半部分
        
        var i = 0, j = 0, k = left
        // 合并两个已排序数组
        while i < leftSub.count && j < rightSub.count {
            if leftSub[i] <= rightSub[j] {
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
numbers.timSort()
print(numbers)  // 输出排序后的数组
