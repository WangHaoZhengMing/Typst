var numbers = [2,6,3,5,1,4]
//write algorithm by my self, do not auto-complete!
let size = numbers.count

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = []
    var leftIndex: Int = 0    // 左数组的当前位置
    var rightIndex: Int = 0   // 右数组的当前位置
    
    // 当左右数组都还有元素时，比较它们的大小
    while leftIndex < left.count && rightIndex < right.count {
        // 比较两个数组当前位置的元素
        if left[leftIndex] <= right[rightIndex] {
            // 如果左边的元素较小，将其加入结果数组
            result.append(left[leftIndex])
            leftIndex += 1   // 左数组指针右移
        } else {
            // 如果右边的元素较小，将其加入结果数组
            result.append(right[rightIndex])
            rightIndex += 1  // 右数组指针右移
        }
    } 
    // 直接添加剩余元素
    result.append(contentsOf: left[leftIndex...])
    result.append(contentsOf: right[rightIndex...])
    
    return result
}

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let mid = array.count / 2
    let left = Array(array[..<mid])
    let right = Array(array[mid...])
    
    return merge(mergeSort(left), mergeSort(right))
}

// 执行排序
numbers = mergeSort(numbers)
print("排序后的数组: \(numbers)")
