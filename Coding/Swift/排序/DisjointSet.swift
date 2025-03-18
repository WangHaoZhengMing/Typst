// 并查集类
class DisjointSet {
   var parent: [Int]
   var rank: [Int]

   init(_ n: Int) {
      parent = Array(0..<n)
      rank = [Int](repeating: 0, count: n)
   }

   func find(_ x: Int) -> Int {
      if parent[x] != x {
         parent[x] = find(parent[x])
      }
      return parent[x]
   }

   func union(_ x: Int, _ y: Int) {
      let rootX = find(x)
      let rootY = find(y)

      guard rootX != rootY else { return }

      let (small, large) = rank[rootX] < rank[rootY] ? (rootX, rootY) : (rootY, rootX)
      parent[small] = large
      if rank[rootX] == rank[rootY] { rank[large] += 1}
   }
}

func hasCycle(edges: [(Int, Int)], vertexCount: Int) -> Bool {
   let ds = DisjointSet(vertexCount)

   return edges.reduce(false) { result, edge in
      if ds.find(edge.0) == ds.find(edge.1) { return true }  //有环
      ds.union(edge.0, edge.1)
      return result  // 无环，继续
   }
}

// 测试数据生成和运行
func generateTestCases() -> [([(Int, Int)], Int, String)] {
   [
      ([(0, 1), (1, 2), (2, 0)], 3, "三角形图（有环）"),
      ([(0, 1), (1, 2)], 3, "链图（无环）"),
   ]
}

func runTests() {
   // 使用 $0 表示元组
   generateTestCases().forEach {
      print("\($0.2): \(hasCycle(edges: $0.0, vertexCount: $0.1))")
   }
}
// 运行测试
runTests()
