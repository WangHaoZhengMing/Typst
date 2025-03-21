func canJump(_ nums: [Int]) -> Bool {
   // 使用 reduce 追踪最远可到达的位置
   let canReachLast = nums.enumerated().reduce((maxReach: 0, canReach: true)) { (result, current) in
      let (index, jump) = current
      // 如果当前位置已经不可达，返回当前结果
      guard result.canReach && index <= result.maxReach else {
         return (result.maxReach, false)
      }
      // 更新最远可达位置
      let newMaxReach = max(result.maxReach, index + jump)
      return (newMaxReach, true)
   }

   return canReachLast.canReach
}

// 测试用例
let test1 = [2, 3, 1, 1, 4]  // true
let test2 = [3, 2, 1, 0, 4]  // false

print(canJump(test1))  // 输出: true
print(canJump(test2))  // 输出: false
