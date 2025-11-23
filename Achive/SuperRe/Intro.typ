#import "temple.typ": *
#import "@preview/cetz:0.4.2"
#set text(font: "PingFang SC")
#title_page(
  "图像超分",
  "",
  author: "作者：王浩然",
)
#outline()
#pagebreak()
= OpenCV图像存储原理与实现机制

== OpenCV 图像存储基础原理

OpenCV 中的图像本质是基于 NumPy 数组的多维矩阵表示。

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: left + horizon,
  [*内容*], [*RGB 图像*], [*灰度图像*],

  [数据格式],
  [
    - OpenCV 采用 BGR 格式存储彩色图像\
    - 每个像素包含蓝（B）、绿（G）、红（R）三个通道值\
    - 采用 BGR 格式是由于历史上Interl的处理器架构的优化需求
  ],
  [单通道存储，仅包含亮度信息],

  [内存结构],
  [三维 NumPy 数组，维度为 `(height, width, 3)`：\
    - `height`：图像垂直方向像素数\
    - `width`：图像水平方向像素数\
    - `3`：BGR 三个颜色通道
  ],
  [二维 NumPy 数组，维度为 `(height, width)`],

  [数值表示],
  [
    - 每个通道采用 8 位无符号整数（uint8）\
    - 取值范围为 [0, 255]
  ],
  [uint8 类型，[0, 255] 表示从黑到白的渐变],

  [示例],
  [
    - 分辨率 480x640 的彩色图像\
    - 数组维度：`(480, 640, 3)`\
    - 总元素数：$480 times 640 times 3 = 921,600$
  ],
  [
    - 分辨率 480x640\
    - 数组维度：`(480, 640)`\
    - 总元素数：$480 times 640 = 307,200$
  ],
)

== 加载彩色图像
#code_block()[```python
import cv2
import numpy as np
# 加载一张彩色图像
img_color = cv2.imread("color_image.jpg", cv2.IMREAD_COLOR)
 # 例如 (480, 640, 3)
print("像素值范围:", np.min(img_color), "到", np.max(img_color))  # 0 到 255
```]

== 加载灰度图像
#code_block()[
  ```python
  # 加载一张灰度图像
  img_gray = cv2.imread("gray_image.jpg", cv2.IMREAD_GRAYSCALE)

  # 输出信息
  print("灰度图像形状:", img_gray.shape)  # 例如 (480, 640)
  print("像素值范围:", np.min(img_gray), "到", np.max(img_gray))  # 0 到 255
  ```]
*解释*
- `shape` 是 `(480, 640)`，没有通道维度，因为灰度图像只有一个值。
- 其他输出与彩色图像类似，只是数据量减少了两倍。

== 与 Swift 中 UIImage / CGImage 的对比

既然熟悉 Swift 中的图像处理，我们可以对比一下 OpenCV 和 Swift 的异同。

=== Swift 中的存储方式
- *UIImage* 这是 Swift 中的高级对象，像一个包装盒，里面包含图像的信息。真正的像素数据存储在 [CGImage] 中。
- *CGImage* 这是底层的存储结构，像素数据以一维数组形式存储，按行顺序排列。
- *数据结构*
  - 彩色图像通常采用 RGBA 格式（红、绿、蓝、透明度），每个通道 8 位。
  - 灰度图像可能只有一个通道。
- *内存表示* 例如一张 640x480 的 RGB 图像，数组长度为 640 * 480 * 3 = 921,600 个元素（如果有 Alpha 通道则更多）。

=== OpenCV 和 Swift 的异同

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: left + horizon,
  [*特征*], [*OpenCV*], [*Swift*],
  [维度],
  [多维数组：\
    - 彩色：`(height, width, 3)`\
    - 灰度：`(height, width)`
  ],
  [一维数组：所有像素线性排列],

  [通道顺序], [BGR（蓝绿红）], [RGB 或 RGBA（红绿蓝，可带透明度）],

  [访问方式],
  [直观：\
    - `img[100, 200]` 灰度像素\
    - `img[100, 200, 0]` 蓝色值
  ],
  [需计算偏移量：\
    `index = (y * width + x) * channels + c`],

  [数据类型], [uint8（0-255）], [uint8（0-255）],

  [透明度], [默认不处理 Alpha 通道], [CGImage 可包含 Alpha 通道],
)
通俗比喻来说:
- *OpenCV* 像一个立体的表格，彩色图像是三层（BGR），灰度图像是一层，直接查表格即可。
- *Swift* 像一条长长的队伍，所有像素排成一列，需要自己计算位置才能获取数据。


= SSIM
Compared with other objective quality metrics, like mean squared error (MSE) and peak signal-to-noise ratio (PSNR), which mainly focus on pixel-wise intensity differences, SSIM can be a more well-rounded metric. This is because it takes *structural information* about the images into account, which is very important for how we perceive scenes in real life.
== 理论基础
SSIM通过比较两个图像窗口 $x$ 和 $y$ 之间的三个特征来评估图像质量：亮度（luminance）、对比度（contrast）和结构（structure）。

==== 统计量定义
#figure(
  caption: [Visualization Compution],
)[#let c-blue = rgb("#cfe2f3")
  #let c-green = rgb("#d9ead3")
  #let c-red = rgb("#f4cccc")
  #let c-border = rgb("#666666")
  #let c-arrow-green = rgb("#6aa84f")
  #let c-arrow-red = rgb("#e06666")
  #let c-arrow-gray = rgb("#999999")

  #cetz.canvas({
    import cetz.draw: *
    scale(0.8)
    // Styles
    let box-style = (stroke: 1pt + c-border, radius: 5pt, fill: white)
    let math-box(body) = rect(
      fill: white,
      stroke: 1pt + c-border,
      inset: 8pt,
      radius: 3pt,
      content((0, 0), body),
    )

    // ===========================================
    // 1. INPUTS (Left Column)
    // ===========================================

    // Ground Truth
    rect((0, 0), (3, 1.5), fill: c-blue, stroke: 1pt + c-border, radius: 10pt, name: "gt")
    content("gt", [Ground Truth])

    // Regenerated
    rect((0, -4), (3, -2.5), fill: c-blue, stroke: 1pt + c-border, radius: 10pt, name: "regen")
    content("regen", [Regenerated])

    // ===========================================
    // 2. SPLIT IMAGES (Windows)
    // ===========================================

    content((5.5, 2.2), [*Split Images*])

    // GT Windows
    rect((4.5, 1.2), (7, 2.2), fill: c-green, stroke: 1pt + c-arrow-green, radius: 3pt, name: "w1-gt")
    content("w1-gt", [window 1])

    // Vertical dots
    for i in range(3) { circle((5.75, 0.8 - i * 0.3), radius: 1pt, fill: black) }

    rect((4.5, -0.8), (7, 0.2), fill: c-red, stroke: 1pt + c-arrow-red, radius: 3pt, name: "wm-gt")
    content("wm-gt", [window M])

    // Regen Windows
    rect((4.5, -2.8), (7, -1.8), fill: c-green, stroke: 1pt + c-arrow-green, radius: 3pt, name: "w1-reg")
    content("w1-reg", [window 1])

    // Vertical dots
    for i in range(3) { circle((5.75, -3.2 - i * 0.3), radius: 1pt, fill: black) }

    rect((4.5, -4.8), (7, -3.8), fill: c-red, stroke: 1pt + c-arrow-red, radius: 3pt, name: "wm-reg")
    content("wm-reg", [window M])

    // ===========================================
    // 3. IMAGE STATISTICS (Center)
    // ===========================================

    content((13.5, 2.2), [*Calculate Image Statistics*])
    content((13.5, 1.6), text(
      size: 8pt,
      fill: gray,
    )[mean and standard deviation calculated for\ both inputs (x=ground truth, y=regenerated)])

    // Container Box
    rect((9, 1), (18.5, -3.5), stroke: 1.5pt + gray, radius: 3pt, name: "stats-box")

    // Equations inside
    let eq-x = 13.75

    // Mu
    group(name: "eq-mu", {
      rect((10.5, 0.5), (12.5, -0.5), fill: white, stroke: 1pt + c-border)
      content((11.5, 0), $ mu_x = 1/N sum_(i=1)^N x_i $)
    })

    // Sigma
    group(name: "eq-sig", {
      rect((9.5, -1.0), (14.5, -2.2), fill: white, stroke: 1pt + c-border)
      content((12, -1.6), $ sigma_x = (1/(N-1) sum_(i=1)^N (x_i - mu_x)^2)^(1/2) $)
    })

    // Covariance
    group(name: "eq-cov", {
      rect((9.4, -2.5), (18.1, -3.5), fill: white, stroke: 1pt + c-border)
      content((13.75, -3), $ sigma_(x y) = 1/(N-1) sum_(i=1)^N (x_i - mu_x)(y_i - mu_y) $)
    })

    // ===========================================
    // 4. COMPARISONS (Right)
    // ===========================================

    content((24, 2.2), [*Image Statistic Comparisons*])

    let comp-x = 24

    // L(x,y)
    group(name: "eq-l", {
      rect((21, 1.2), (27, 0.2), fill: white, stroke: 1pt + c-border, radius: 3pt)
      content((24, 0.7), $ l(bold(x), bold(y)) = (2 mu_x mu_y + C_1) / (mu_x^2 + mu_y^2 + C_1) $)
    })

    // C(x,y)
    group(name: "eq-c", {
      rect((21, -0.3), (27, -1.3), fill: white, stroke: 1pt + c-border, radius: 3pt)
      content((24, -0.8), $ c(bold(x), bold(y)) = (2 sigma_x sigma_y + C_2) / (sigma_x^2 + sigma_y^2 + C_2) $)
    })

    // S(x,y)
    group(name: "eq-s", {
      rect((21, -1.8), (27, -2.8), fill: white, stroke: 1pt + c-border, radius: 3pt)
      content((24, -2.3), $ s(bold(x), bold(y)) = (sigma_(x y) + C_3) / (sigma_x sigma_y + C_3) $)
    })

    // ===========================================
    // 5. FINAL METRIC (Bottom)
    // ===========================================

    content((13.75, -5.5), [*Calculate Final Quality Metric*])

    // SSIM
    group(name: "eq-ssim", {
      rect((6, -6), (22, -7.5), fill: white, stroke: 1.5pt + c-border, radius: 3pt)
      content((14, -6.75), text(1.2em)[$
        "SSIM"(bold(x), bold(y)) = [l(bold(x), bold(y))]^alpha dot [c(bold(x), bold(y))]^beta dot [s(bold(x), bold(y))]^gamma
      $])
    })

    // MSSIM
    group(name: "eq-mssim", {
      rect((9.5, -8.2), (18.5, -9.8), fill: c-green, stroke: 1.5pt + c-border, radius: 0pt) // Green background rect
      rect((10, -8.5), (18, -9.5), fill: white, stroke: 1pt + c-border) // White inner rect
      content((14, -9), $ "MSSIM"(bold(X), bold(Y)) = 1/M sum_(j=1)^M "SSIM"(bold(x)_j, bold(y)_j) $)
    })

    // ===========================================
    // CONNECTORS (Arrows)
    // ===========================================

    // 1. Input Split Arrows
    line("gt.east", "w1-gt.west", mark: (end: ">", fill: gray), stroke: gray)
    line("gt.east", "wm-gt.west", mark: (end: ">", fill: gray), stroke: gray)

    line("regen.east", "w1-reg.west", mark: (end: ">", fill: gray), stroke: gray)
    line("regen.east", "wm-reg.west", mark: (end: ">", fill: gray), stroke: gray)

    // 2. Windows to Statistics
    // Define anchor points on the big statistics box
    let stat-in-top = (9, 0.5)
    let stat-in-mid = (9, -1)
    let stat-in-bot = (9, -2.5)

    // Green arrows (Top windows)
    // Use Bezier for smooth "S" curves
    bezier("w1-gt.east", stat-in-top, (8, 1.7), (8, 0.5), stroke: 1pt + c-arrow-green, mark: (
      end: ">",
      fill: c-arrow-green,
    ))
    bezier("w1-reg.east", stat-in-mid, (8, -2.3), (8, -1), stroke: 1pt + c-arrow-green, mark: (
      end: ">",
      fill: c-arrow-green,
    ))

    // Red arrows (Bottom windows)
    // Dashed lines indicating connections from dot areas
    line((5.75, 0.2), (6.5, 0.2), stroke: (dash: "dotted", paint: gray))
    bezier((6.5, 0.2), (9, 0), (8, 0.2), (8, 0), stroke: (dash: "dotted", paint: gray), mark: (end: ">", fill: gray))

    line((5.75, -3.8), (6.5, -3.8), stroke: (dash: "dotted", paint: gray))
    bezier(
      (6.5, -3.8),
      (9, -1.5),
      (8, -3.8),
      (8, -1.5),
      stroke: (dash: "dotted", paint: gray),
      mark: (end: ">", fill: gray),
    )

    // Solid Red arrows
    bezier("wm-gt.east", stat-in-mid, (8, -0.3), (8, -1), stroke: 1pt + c-arrow-red, mark: (
      end: ">",
      fill: c-arrow-red,
    ))
    bezier("wm-reg.east", stat-in-bot, (8, -4.3), (8, -2.5), stroke: 1pt + c-arrow-red, mark: (
      end: ">",
      fill: c-arrow-red,
    ))


    // 3. Statistics to Comparisons (The multi-colored fan)
    let stat-out = (18.5, -1.25) // approx center right of box

    // To L
    line(stat-out, "eq-l.west", stroke: 1pt + c-arrow-green, mark: (end: ">", fill: c-arrow-green))
    line(stat-out, (20.8, 0.6), stroke: 1pt + c-arrow-red, mark: (end: ">", fill: c-arrow-red)) // Offset arrow

    // To C
    line(stat-out, "eq-c.west", stroke: 1pt + c-arrow-green, mark: (end: ">", fill: c-arrow-green))
    line(stat-out, (20.8, -0.9), stroke: 1pt + c-arrow-red, mark: (end: ">", fill: c-arrow-red))
    line(stat-out, (20.8, -1.1), stroke: 1pt + gray, mark: (end: ">", fill: gray))

    // To S
    line(stat-out, "eq-s.west", stroke: 1pt + c-arrow-green, mark: (end: ">", fill: c-arrow-green))
    line(stat-out, (20.8, -2.4), stroke: 1pt + c-arrow-red, mark: (end: ">", fill: c-arrow-red))
    line(stat-out, (20.8, -2.6), stroke: 1pt + gray, mark: (end: ">", fill: gray))


    // 4. Comparisons to SSIM (Curved lines on right)
    // L -> SSIM
    line("eq-l.east", (27.5, 0.7), (27.5, -6.5), (22, -6.5), stroke: gray, radius: 5pt, mark: (end: ">", fill: gray))
    // C -> SSIM
    line("eq-c.east", (27.0, -0.8), (27.0, -6.75), (22, -6.75), stroke: gray, radius: 5pt, mark: (end: ">", fill: gray))
    // S -> SSIM
    line("eq-s.east", (26.5, -2.3), (26.5, -7.0), (22, -7.0), stroke: gray, radius: 5pt, mark: (end: ">", fill: gray))

    // 5. SSIM to MSSIM
    line("eq-ssim.south", "eq-mssim.north", stroke: 1.5pt + gray, mark: (end: ">", fill: gray))
  })]
对于图像窗口 $x$ 和 $y$，我们首先定义以下统计量：

- 平均值（亮度估计）：
$ μ_x == 1/N sum_(i=1)^N x_i $
$ μ_y == 1/N sum_(i=1)^N y_i $

- 标准差（对比度估计）：
$ σ_x == sqrt((1/(N-1)) sum_(i=1)^N (x_i - μ_x)^2) $
$ σ_y == sqrt((1/(N-1)) sum_(i=1)^N (y_i - μ_y)^2) $

- 协方差（结构相似性估计）：
$ σ_(x y) == 1/(N-1) sum_(i=1)^N (x_i - μ_x)(y_i - μ_y) $

==== SSIM指数计算

SSIM指数是通过三个比较函数的组合得到的：

1. 亮度比较函数：
$ l(x,y) == (2μ_x μ_y + C_1)/(μ_x^2 + μ_y^2 + C_1) $

2. 对比度比较函数：
$ c(x,y) == (2σ_x σ_y + C_2)/(σ_x^2 + σ_y^2 + C_2) $

3. 结构比较函数：
$ s(x,y) == (σ_(x y) + C_3)/(σ_x σ_y + C_3) $

其中 $C_1$、$C_2$ 和 $C_3$ 是小正常数，用于确保分母不为零，通常 $C_3 == C_2/2$。

最终的SSIM指数通过这三个比较函数的组合得到：

$ "SSIM"(x,y) == [l(x,y)]^α dot [c(x,y)]^β dot [s(x,y)]^γ $

其中 $α$、$β$ 和 $γ$ 是用于调整三个分量相对重要性的权重参数。在实践中，通常设置 $α == β == γ == 1$。

== 实际应用

// === 均值SSIM（MSSIM）

// 对于整幅图像的质量评估，我们计算所有窗口的SSIM平均值：

// $ "MSSIM"(X,Y) == 1/M sum_(j=1)^M "SSIM"(x_j,y_j) $

// 其中 $M$ 是图像中窗口的总数，$x_j$ 和 $y_j$ 是第 $j$ 个窗口的图像内容。

// === 参数选择

// 在实际应用中，常用的参数设置为：
// - 窗口大小：11×11
// - $C_1 == (K_1 L)^2$，其中 $K_1 == 0.01$，$L$ 是像素值的动态范围
// - $C_2 == (K_2 L)^2$，其中 $K_2 == 0.03$

// #section_divider()
以计算亮度相似度 l (luminance) 的为例, 来应用:
1. 图片的代码表示
  #code_block()[```python
  gt_window = np.array([
      [100, 120, 130, 110],
      [115, 125, 135, 105],
      [105, 115, 125, 115],
      [110, 120, 130, 120]
  ])

  regen_window = np.array([
      [98, 118, 128, 108],
      [113, 123, 133, 103],
      [103, 113, 123, 113],
      [108, 118, 128, 118]
  ])

  # 步骤 1: 计算平均值
  mu_x = np.mean(gt_window)    # 例如 = 117.5
  mu_y = np.mean(regen_window) # 例如 = 115.5

  # 步骤 2: 计算 C1 (假设 K1 = 0.01)
  C1 = (0.01 * 255)**2  # = 6.5025

  # 步骤 3: 计算 l
  numerator = 2 * 117.5 * 115.5 + C1
  denominator = 117.5**2 + 115.5**2 + C1
  l_value = numerator / denominator  # 接近 1 表示亮度相似
  ```]
