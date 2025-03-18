// 并查集类
class DisjointSet {
   var parent: [Int]  // 父节点数组
   var rank: [Int]  // 树的高度数组，用于按秩合并

   // 初始化，n 是顶点数
   init(_ n: Int) {
      parent = Array(0..<n)  // 初始时每个节点的父节点是自己
      rank = [Int](repeating: 0, count: n)  // 初始高度为 0
   }

   // 查找根节点（带路径压缩）
   func find(_ x: Int) -> Int {
      if parent[x] != x {
         parent[x] = find(parent[x])  // 路径压缩
      }
      return parent[x]
   }

   // 合并两个集合（按秩合并）
   func union(_ x: Int, _ y: Int) {
      let rootX = find(x)
      let rootY = find(y)

      if rootX == rootY {
         return
      }

      if rank[rootX] < rank[rootY] {
         parent[rootX] = rootY
      } else if rank[rootX] > rank[rootY] {
         parent[rootY] = rootX
      } else {
         parent[rootY] = rootX
         rank[rootX] += 1
      }
   }
}

// 判断无向图是否有环
func hasCycle(edges: [(Int, Int)], vertexCount: Int) -> Bool {
   let ds = DisjointSet(vertexCount)  // 创建并查集

   for (u, v) in edges {  // 遍历所有边
      if ds.find(u) == ds.find(v) {  // 如果两个顶点已在同一集合
         return true  // 有环
      }
      ds.union(u, v)  // 否则合并
   }
   return false  // 无环
}

// 测试代码
func test() {
   // 测试用例 1：三角形（有环）
   let edges1 = [(0, 1), (1, 2), (2, 0)]
   let n1 = 3
   let result1 = hasCycle(edges: edges1, vertexCount: n1)
   print("图 1 是否有环: \(result1)")  // 输出 true

   // 测试用例 2：链（无环）
   let edges2 = [(0, 1), (1, 2)]
   let n2 = 3
   let result2 = hasCycle(edges: edges2, vertexCount: n2)
   print("图 2 是否有环: \(result2)")  // 输出 false
}

// 运行测试
test()

