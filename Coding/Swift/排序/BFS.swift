// 定义树节点
class TreeNode: Hashable {
   var value: Int
   var children: [TreeNode]  // 子节点数组

   init(_ value: Int) {
      self.value = value
      self.children = []
   }
   static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
      return lhs === rhs  // 引用相等
   }

   func hash(into hasher: inout Hasher) {
      hasher.combine(ObjectIdentifier(self))  // 用对象标识符作为哈希值
   }
}

// BFS 遍历函数
func breadthFirstSearch(root: TreeNode?) {
   // 如果根节点为空，直接返回
   guard let root = root else { return }

   // 创建一个队列来存储待访问的节点（FIFO）
   var queue: [TreeNode] = []
   // 用一个集合记录访问过的节点（避免重复，这里树不会有环，可以省略）
   var visited: Set<TreeNode> = []

   // 第一步：从起点开始，把根节点加入队列
   queue.append(root)

   // 只要队列不为空，就继续探索
   while !queue.isEmpty {
      // 取出队列头部节点（当前层的最左节点）
      let currentNode = queue.removeFirst()

      // 如果没访问过，处理当前节点（这里简单打印）
      if !visited.contains(currentNode) {
         print(currentNode.value, terminator: " ")  // 输出当前节点值
         visited.insert(currentNode)
         for child in currentNode.children {queue.append(child)}
      }
   }
}

// 测试代码
func testBFS() {
   // 构建一棵树
   //       1
   //     / | \
   //    2  3  4
   //   / \    |
   //  5   6   7

   let root = TreeNode(1)
   let node2 = TreeNode(2)
   let node3 = TreeNode(3)
   let node4 = TreeNode(4)
   let node5 = TreeNode(5)
   let node6 = TreeNode(6)
   let node7 = TreeNode(7)

   root.children = [node2, node3, node4]
   node2.children = [node5, node6]
   node4.children = [node7]

   print("广度优先遍历结果：")
   breadthFirstSearch(root: root)  // 预期输出: 1 2 3 4 5 6 7
}

// 运行测试
testBFS()
