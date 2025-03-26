#import "temple.typ": *
#set text(font: "PingFang SC")
#title_page(
  "Super",
  "图像",
  author: "作者："
)
#outline()
= OpenCV图像存储原理与实现机制

== OpenCV 图像存储基础原理

OpenCV 中的图像本质是基于 NumPy 数组的多维矩阵表示。

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: left+horizon,
  [*内容*], [*RGB 图像*], [*灰度图像*],
  
  [数据格式],
  [- OpenCV 采用 BGR 格式存储彩色图像\
   - 每个像素包含蓝（B）、绿（G）、红（R）三个通道值\
   - 采用 BGR 格式是由于历史上Interl的处理器架构的优化需求],
  [单通道存储，仅包含亮度信息],

  [内存结构],
  [三维 NumPy 数组，维度为 `(height, width, 3)`：\
   - `height`：图像垂直方向像素数\
   - `width`：图像水平方向像素数\
   - `3`：BGR 三个颜色通道],
  [二维 NumPy 数组，维度为 `(height, width)`],

  [数值表示],
  [- 每个通道采用 8 位无符号整数（uint8）\
   - 取值范围为 [0, 255]],
  [uint8 类型，[0, 255] 表示从黑到白的渐变],

  [示例],
  [- 分辨率 480x640 的彩色图像\
   - 数组维度：`(480, 640, 3)`\
   - 总元素数：$480 times 640 times 3 = 921,600$],
  [- 分辨率 480x640\
   - 数组维度：`(480, 640)`\
   - 总元素数：$480 times 640 = 307,200$]
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
  align: left+horizon,
  [*特征*], [*OpenCV*], [*Swift*],
  [维度],
  [多维数组：\
   - 彩色：`(height, width, 3)`\
   - 灰度：`(height, width)`],
  [一维数组：所有像素线性排列],

  [通道顺序],
  [BGR（蓝绿红）],
  [RGB 或 RGBA（红绿蓝，可带透明度）],

  [访问方式],
  [直观：\
   - `img[100, 200]` 灰度像素\
   - `img[100, 200, 0]` 蓝色值],
  [需计算偏移量：\
   `index = (y * width + x) * channels + c`],

  [数据类型],
  [uint8（0-255）],
  [uint8（0-255）],

  [透明度],
  [默认不处理 Alpha 通道],
  [CGImage 可包含 Alpha 通道],
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
image("Pic/visualizationCompution.jpeg"),
caption: [Visualization Compution]
)
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