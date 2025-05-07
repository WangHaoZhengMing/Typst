// Set document metadata and basic styles
#set document(
  title: "Typst 简明入门教程",
  author: "AI Assistant",
)
#set text(lang: "zh", size: 11pt, font: ("pingfang sc")) // Use NCM for Latin/Math, Source Han Sans for Chinese
#set heading(numbering: "1.1") // Enable section numbering


#v(2em) // Add some vertical space before the content

// --- 前言 ---
#heading(level: 1, numbering: none)[前言]
*为什么选择 Typst*

Typst 是一个现代化的、基于标记语言的排版系统，它的设计目标是兼具 LaTeX 的强大功能和 Markdown 的简洁易用性。选择 Typst 的理由有很多：

-   *简洁的语法：* Typst 的语法直观且易于学习，特别是对于熟悉 Markdown 的用户。常见的格式化、列表、代码块等都非常简单。
-   *极快的编译速度：* Typst 的编译速度非常快，通常能在几百毫秒内完成文档的编译，即使是大型文档也能实现近乎实时的预览更新。这极大地提升了写作效率。
-   *强大的脚本能力：* 内建了图灵完备的脚本语言，可以直接在文档中进行计算、数据处理、自定义函数和复杂布局，无需依赖外部宏包或复杂的编程。
-   *内置常用功能：* 许多在 LaTeX 中需要宏包实现的功能（如图表、参考文献、数学公式、绘图等）在 Typst 中都是内置或有良好支持的。
-   *一致性与可复现性：* Typst 旨在提供更可预测和一致的输出，减少了环境配置和宏包冲突带来的麻烦。
-   *现代化的特性：* 支持 WebAssembly，可以在浏览器中运行（如官方 Web App），方便协作和分享。对 Unicode 和现代字体有良好支持。
-   *活跃的社区与发展：* Typst 是一个相对年轻但发展迅速的项目，社区活跃，不断有新功能和改进加入。

对于需要高质量排版（尤其是科技文档、论文、报告）但又希望摆脱 LaTeX 复杂性或 Word 不确定性的用户来说，Typst 是一个非常有吸引力的选择。

#pagebreak()
#outline() 

#pagebreak()

== 本教程的使用方法

本教程主要面向：

-   对 Typst 感兴趣的初学者。
-   希望从 Markdown, Word 或 LaTeX 迁移到 Typst 的用户。
-   需要快速了解 Typst 核心功能和工作流程的开发者或研究人员。

建议按顺序阅读，特别是“开始使用 Typst”部分。你可以：

1.  *通读理论：* 先了解 Typst 的基本概念和优势。
2.  *动手实践：* 跟着“安装和环境配置”和“创建第一个文档”部分实际操作。
3.  *按需查阅：* 对于特定的迁移路径或常见问题，可以直接跳转到相关章节。

本教程的代码示例都使用 Typst 语法编写，你可以直接复制到 `.typ` 文件中进行测试。

// --- 开始使用 Typst ---
#heading(level: 1)[开始使用 Typst]

== 认识 Typst

Typst (/`taɪpst`/) 是一个基于标记的排版系统，专为科学出版设计。它的核心理念是将内容、样式和逻辑分离，同时提供一种简洁而强大的方式来描述文档结构和外观。

主要特点回顾：

-   *标记语言：* 像 Markdown 和 LaTeX 一样，你编写纯文本，Typst 负责将其转换为格式精美的 PDF 文档。
-   *排版引擎：* 负责处理布局、分页、字体、字距调整等复杂的排版任务。
-   *脚本语言：* 提供编程能力，用于自动化、自定义样式和复杂逻辑。

你可以通过两种主要方式使用 Typst：

1.  *本地安装：* 在你的计算机上安装 Typst 编译器，使用你喜欢的文本编辑器编写 `.typ` 文件，并通过命令行编译。
2.  *Web App：* 使用官方提供的在线编辑器 `https://typst.app`，无需安装任何软件即可开始编写和编译文档，并支持实时预览和协作。

== 从其他排版工具迁移

=== 从 Markdown 迁移

本节将展示如何在 Typst 中实现与 Markdown 相同的功能。我们通过对比的方式来学习：

#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  align: left,
  table.header([*Markdown 写法*], [*Typst 实现方式*]),
  // 标题
  [```markdown
# 一级标题
## 二级标题
### 三级标题
```],
  [```typst
= 一级标题
== 二级标题
=== 三级标题
// 或者
#heading(level: 1)[一级标题]
```],
  
  // 文本强调
  [```markdown
*斜体* 或 _斜体_
**粗体** 或 __粗体__
***粗斜体***
```],
  [```typst
_斜体_
*粗体*
*_粗斜体_*
```],

  // 列表
  [```markdown
- 无序列表
  - 二级列表
1. 有序列表
2. 第二项
```],
  [```typst
- 无序列表
  - 二级列表
+ 有序列表
+ 第二项
// 或
1. 有序列表
2. 第二项
```],
)

#v(1em)

*数学公式对比：*
#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  table.header([*Markdown (需额外支持)*], [*Typst*]),
  [```markdown
$E = mc^2$

$$
\frac{-b \pm \sqrt{b^2-4ac}}{2a}
$$
```],
  [```typst
$E = mc^2$

$ frac(-b plus.minus sqrt(b^2 - 4a c), 2a) $
```],
)

#v(1em)

*图片和链接：*
#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  table.header([*Markdown*], [*Typst*]),
  [```markdown
![图片描述](./image.png)

[链接文字](https://typst.app)
```],
  [```typst
#figure(
  image("./image.png", width: 80%),
  caption: [图片描述]
) <fig-label>

#link("https://typst.app")[链接文字]
// 或直接：
https://typst.app
```],
)

#v(1em)

*代码块：*
#table(
  columns: (auto, auto),
  stroke: 0.5pt,
  table.header([*Markdown*], [*Typst*]),
  [````markdown
```python
def hello():
    print("Hello")
```
````]
)

#v(1em)

// 其他对比示例...

#v(1em)

// 结论：Markdown 适合快速书写，Typst 则提供了更强大的排版能力和灵活性。

== 安装和环境配置

=== Web App (推荐初学者)

最简单的方式是使用官方 Web App：`https://typst.app`
-   无需安装。
-   实时预览。
-   项目管理。
-   协作功能。

=== 本地安装

如果你想在本地使用 Typst，可以通过以下方式安装：

1.  *包管理器 (推荐):*
    -   *macOS (Homebrew):*
        ```bash
        brew install typst
        ```
    -   *Windows (Scoop):*
        ```bash
        scoop install typst
        ```
    -   *Arch Linux:*
        ```bash
        pacman -S typst
        ```
    -   *(其他 Linux 发行版可能在各自的仓库中)*

2.  *Cargo (如果你安装了 Rust 工具链):*
    ```bash
    cargo install --git https://github.com/typst/typst typst-cli
    ```

3.  *预编译二进制文件:*
    从 Typst 的 GitHub Releases 页面 (`https://github.com/typst/typst/releases`) 下载适用于你操作系统的预编译版本，解压并将其路径添加到系统的 `PATH` 环境变量中。

=== 开发环境 (推荐)

为了获得更好的编写体验，推荐使用支持 Typst 的编辑器插件：

-   *Visual Studio Code:* 安装 `Typst LSP` 插件。它提供了：
    -   实时预览 (Ctrl+Shift+P -> "Typst Preview")
    -   语法高亮
    -   自动补全
    -   错误诊断

安装后，你可以创建一个 `.typ` 文件，开始编写，并使用 `typst compile <input.typ> <output.pdf>` 命令编译，或者直接在 VS Code 中预览。

== 创建第一个文档

让我们创建一个简单的 "Hello World" 文档，包含标题、一些文本和一个数学公式。

1.  创建一个名为 `hello.typ` 的文件。
2.  在文件中输入以下内容：

    ```typst
    // hello.typ: A simple Typst document

    // Set document properties
    #set document(title: "我的第一个 Typst 文档", author: "你的名字")
    #set text(lang: "zh") // Enable Chinese typesetting rules

    // Document title (uses properties set above)
    #align(center)[
      #block(text(size: 18pt, weight: "bold", [#document.title]))
      #v(1em)
      #block([#document.author])
    ]

    #v(2em)

    // A section
    #heading("介绍")

    欢迎来到 Typst 的世界！这是一个 *简单* 且 _功能强大_ 的排版系统。
    你可以轻松地编写文本，并插入数学公式，例如：

    $ E = mc^2 $

    Typst 的编译速度非常快。

    // Another section
    #heading("列表示例")

    这里是一个无序列表：
    - 苹果
    - 香蕉
      - 黄色的香蕉
    - 橙子

    这里是一个有序列表：
    + 第一项
    + 第二项
    + 第三项

    // Code example
    #heading("代码块")

    Typst 使用三个反引号来创建代码块：
    ```typst
    #let square(x) = x * x
    #square(5) // Output: 25
    ```
    ```

3.  *编译文档:* 打开终端（或命令提示符），导航到 `hello.typ` 文件所在的目录，然后运行：

    ```bash
    typst compile hello.typ hello.pdf
    ```

    这会生成一个名为 `hello.pdf` 的文件。

4.  *或者使用 VS Code 预览:* 如果你安装了 `Typst LSP` 插件，打开 `hello.typ` 文件，按下 `Ctrl+Shift+P`，搜索并选择 "Typst Preview"，即可看到实时预览。

恭喜！你已经成功创建并编译了你的第一个 Typst 文档。
