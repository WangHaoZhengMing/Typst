import Foundation
/* 大顶堆 */
class MaxHeap {
    private var maxHeap: [Int] = []
    public var size: Int {
        return maxHeap.count
    }

    /* 交换元素 */
    private func swap(_ first: Int, _ second: Int) {
        let tmp = maxHeap[first]
        maxHeap[first] = maxHeap[second]
        maxHeap[second] = tmp
    }

    /* 元素入堆 */
    func push(_ val: Int) {
        maxHeap.append(val)
        siftUp(size - 1)
    }

    /* 从底至顶堆化 */
    private func siftUp(_ index: Int) {
        var current = index
        while true {
            let parent = (current - 1) / 2  // 定义父节点索引的计算方式
            // 使用guard检查是否需要继续上浮
            guard parent >= 0, maxHeap[current] > maxHeap[parent] else { break }
            swap(current, parent)
            current = parent
        }
    }

    func pop() -> Int? {
        guard size != 0 else { return nil }
        swap(0, size - 1) // 交换根节点与最后一个元素
        // 删除节点
        let val = maxHeap.removeLast()
        // 从顶至底堆化
        siftDown(0)
        return val
    }

    /* 从顶至底堆化 */
    private func siftDown(_ index: Int) {
        var current = index
        while true {
            let left = 2 * current + 1
            let right = 2 * current + 2
            var max = current
            // 使用三元运算符和条件检查更新max
            max = left < size && maxHeap[left] > maxHeap[max] ? left : max
            max = right < size && maxHeap[right] > maxHeap[max] ? right : max
            // 若父节点最大则结束
            if max == current { break }
            swap(current, max)
            current = max
        }
    }

    /* 访问堆顶元素 */
    func peek() -> Int? {
        if size == 0 { return nil }
        return maxHeap[0]
    }
}