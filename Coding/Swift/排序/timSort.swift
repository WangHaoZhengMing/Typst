import Foundation

// A simplified TimSort implementation using Swift's higher-order functions
struct TimSort {
    // Minimum size for a run
    private static let MIN_MERGE = 32
    
    // Simplified insertion sort using Swift's collection methods
    private static func insertionSort<T: Comparable>(_ array: inout ArraySlice<T>) {
        guard array.count > 1 else { return }
        
        for i in array.indices.dropFirst() {
            let current = array[i]
            var j = i
            
            while j > array.startIndex && array[j-1] > current {
                array[j] = array[j-1]
                j -= 1
            }
            
            array[j] = current
        }
    }
    
    // Merge two sorted ArraySlices
    private static func merge<T: Comparable>(_ left: ArraySlice<T>, _ right: ArraySlice<T>) -> [T] {
        var result = [T]()
        result.reserveCapacity(left.count + right.count)
        
        var leftIndex = left.startIndex
        var rightIndex = right.startIndex
        
        // Compare and merge elements
        while leftIndex < left.endIndex && rightIndex < right.endIndex {
            if left[leftIndex] <= right[rightIndex] {
                result.append(left[leftIndex])
                leftIndex += 1
            } else {
                result.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        // Append remaining elements
        result.append(contentsOf: left[leftIndex...])
        result.append(contentsOf: right[rightIndex...])
        
        return result
    }
    
    // Calculate min run length
    private static func minRunLength(_ n: Int) -> Int {
        var run = 0
        var n = n
        
        while n >= MIN_MERGE {
            run |= (n & 1)
            n >>= 1
        }
        
        return n + run
    }
    
    // Sort array using simplified TimSort
    public static func sort<T: Comparable>(_ array: inout [T]) {
        let n = array.count
        if n <= 1 { return }
        
        // Calculate minRun for this array
        let minRun = minRunLength(n)
        
        // Sort small subarrays using insertion sort
        for start in stride(from: 0, to: n, by: minRun) {
            let end = min(start + minRun, n)
            var slice = array[start..<end]
            insertionSort(&slice)
            
            // Copy sorted slice back to original array
            array.replaceSubrange(start..<end, with: slice)
        }
        
        // Merge sorted runs
        var size = minRun
        while size < n {
            for start in stride(from: 0, to: n, by: 2*size) {
                let mid = min(start + size, n)
                let end = min(start + 2*size, n)
                
                if mid < end {
                    let left = array[start..<mid]
                    let right = array[mid..<end]
                    let merged = merge(left, right)
                    array.replaceSubrange(start..<end, with: merged)
                }
            }
            size *= 2
        }
    }
}

// Simple example
func testSimplifiedTimSort() {
    var array = [5, 9, 1, 3, 8, 4, 7, 6, 2]
    print("Original array: \(array)")
    
    TimSort.sort(&array)
    print("Sorted array: \(array)")
}

// Uncomment to test
// testSimplifiedTimSort()
