import Foundation

func intervalCovering(intervals: [(start: Int, end: Int)]) -> [Int] {
    guard !intervals.isEmpty else { return [] }
    guard intervals.map({ $0.start }).min()! <= 0 else { return [] }
    
    let indexedIntervals = intervals.enumerated().map { (i, interval) in
        (index: i + 1, start: interval.start, end: interval.end)
    }
    
    let result = indexedIntervals
        .sorted(by: { $0.start < $1.start })
        .reduce((covered: 0, indices: [Int]())) { acc, interval in
            if acc.covered >= 160 { return acc }
            if interval.start > acc.covered { return (covered: -1, indices: []) }
            
            let bestInterval = indexedIntervals
                .filter { $0.start <= acc.covered }
                .max(by: { $0.end < $1.end })
            
            guard let best = bestInterval else { return (covered: -1, indices: []) }
            if acc.indices.contains(best.index) { return acc }
            
            return (
                covered: best.end,
                indices: acc.indices + [best.index]
            )
        }
    
    return result.covered >= 160 ? result.indices : []
}

// Example usage with the intervals from the image:
let intervals: [(start: Int, end: Int)] = [
    (15, 50),  // 1
    (5, 40),  // 2
    (45, 120),  // 3
    (80, 130),  // 4
    (85, 115),  // 5
    (120, 140),  // 6
    (130, 160),  // 7
]

let solution = intervalCovering(intervals: intervals)

print("Solution: \(solution)")

// Function that takes a list of intervals as input and returns the numbers that correspond to the chosen indices.
func getIntervalsNumbers(from intervals: [(start: Int, end: Int)], indices: [Int]) -> [Int] {

    var result: [Int] = []
    for index in indices {
        result.append(index)
    }

    return result
}

// To calculate the running time
func calculateRunningTime(intervals: [(start: Int, end: Int)], numberOfIterations: Int)
    -> TimeInterval
{
    let startTime = CFAbsoluteTimeGetCurrent()

    for _ in 0..<numberOfIterations {
        let _ = intervalCovering(intervals: intervals)
    }
    let endTime = CFAbsoluteTimeGetCurrent()
    return (endTime - startTime) / Double(numberOfIterations)
}

let numberOfIterations = 1000
let averageTime = calculateRunningTime(intervals: intervals, numberOfIterations: numberOfIterations)

print("Average running time in seconds is \(averageTime)")
