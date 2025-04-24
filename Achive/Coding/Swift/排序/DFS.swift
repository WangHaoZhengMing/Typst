class Graph {
   var adj: [[Int]]  // 邻接表表示的图
   var n: Int  // 顶点数

   init(vertices: Int) {
      self.n = vertices
      self.adj = Array(repeating: [], count: vertices)
   }

   func addEdge(_ u: Int, _ v: Int) {
      adj[u].append(v)
      adj[v].append(u)
   }

   func findCutVertices() -> [Bool] {
      var disc = Array(repeating: -1, count: n)  // 发现时间
      var low = Array(repeating: -1, count: n)  // 能够回溯到的最早顶点的发现时间
      var parent = Array(repeating: -1, count: n)  // 父节点
      var isCutVertex = Array(repeating: false, count: n)  // 是否为割点
      var time = 0

      // DFS函数
      func dfs(_ u: Int) {
         time += 1
         disc[u] = time
         low[u] = time
         var childCount = 0  // 记录根节点的子树数量

         // 遍历所有邻接点
         for v in adj[u] {
            if disc[v] == -1 {  // v未被访问
               childCount += 1
               parent[v] = u
               dfs(v)

               // 更新low值
               low[u] = min(low[u], low[v])

               // 判断是否为割点
               if parent[u] == -1 && childCount > 1 {  // u是根节点
                  isCutVertex[u] = true
               }
               if parent[u] != -1 && low[v] >= disc[u] {  // u不是根节点
                  isCutVertex[u] = true
               }
            }
            // 回边，但不是父节点
            else if v != parent[u] {
               low[u] = min(low[u], disc[v])
            }
         }
      }

      // 对每个未访问的顶点进行DFS
      for u in 0..<n {
         if disc[u] == -1 {
            dfs(u)
         }
      }

      return isCutVertex
   }
}

// 测试代码
func testCutVertices() {
   let g = Graph(vertices: 5)
   g.addEdge(1, 0)
   g.addEdge(0, 2)
   g.addEdge(2, 1)
   g.addEdge(0, 3)
   g.addEdge(3, 4)

   let cutVertices = g.findCutVertices()
   print("割点有：")
   for (vertex, isCut) in cutVertices.enumerated() {
      if isCut {
         print(vertex)
      }
   }
}

testCutVertices()
