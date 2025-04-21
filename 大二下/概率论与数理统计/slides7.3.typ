// #import "@preview/box:0.0.6": box
#import "@preview/touying:0.6.1": *
#import "@preview/lilaq:0.2.0" as lq
#import themes.dewdrop: *
#set text(lang: "zh", font: "PingFang SC")
#import "@preview/numbly:0.1.0": numbly
#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
)
#outline-slide()
== 引言

#block(fill: luma(245), radius: 5pt, inset: 10pt)[
  前面, 我们讨论了参数点估计, 它是用样本算得的一个值去估计未知参数. 但是, 点估计值仅仅是未知参数的一个近似值, 它没有反映出这个近似值的误差范围, 使用起来把握不大. 区间估计正好弥补了点估计的这个缺陷.
]

譬如, 在估计湖中鱼数的问题中, 若我们根据一个实际样本, 得到鱼数 $N$ 的极大似然估计为1000条.

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  实际上, $N$ 的真值可能大于1000条, 也可能小于1000条.
]

#box(
  stroke: blue.lighten(50%),
  radius: 5pt,
  inset: 10pt,
)[
  若我们能给出一个区间, 在此区间内我们合理地相信 $N$ 的真值位于其中, 这样对鱼数的估计就有把握多了.
]

也就是说, 我们希望确定一个区间, 使我们能以比较高的 #text(fill: blue)[可靠程度] 相信它包含真参数值.
#align(center)[*湖中鱼数的真值*]

这里所说的 "#text(fill: blue)[可靠程度]" 是用概率来度量的, 称为 #text(fill: blue)[置信度] 或 #text(fill: blue)[置信水平].

习惯上把置信水平记作 $1 - alpha$, 这里 $alpha$ 是一个很小的正数.

//#pagebreak()

// Page 5
//#stats-badge
置信水平的大小是根据实际需要选定的. 例如, 通常可取置信水平 $1 - alpha = 0.95$ 或 $0.9$ 等.

根据一个实际样本, 由给定的置信水平, 我们求出一个尽可能小的区间 $(underline(theta), overline(theta))$, 使

$ P(underline(theta) < theta < overline(theta)) = 1 - alpha $

称区间 $(underline(theta), overline(theta))$ 为 $theta$ 的置信水平为 $1 - alpha$ 的 #text(fill: blue)[置信区间].

//#pagebreak()

// Page 6
//#stats-badge
== 一、置信区间定义

设 $theta$ 是一个待估参数, 给定 $alpha > 0$, 若由样本 $X_1, X_2, dots, X_n$ 确定的两个统计量
#grid(
  columns: (100%, auto),
  gutter: -9cm,
  align: center + horizon,
  [$ underline(theta) = underline(theta)(X_1, X_2, dots, X_n) $
    $ overline(theta) = overline(theta)(X_1, X_2, dots, X_n) $],
  [($underline(theta) < overline(theta)$)],
)

满足
$ P(underline(theta) < theta < overline(theta)) = 1 - alpha $

则称区间 $(underline(theta), overline(theta))$ 是 $theta$ 的置信水平 (置信度) 为 $1 - alpha$ 的 #text(fill: blue)[置信区间].

$underline(theta)$ 和 $overline(theta)$ 分别称为 #text(fill: blue)[置信下限] 和 #text(fill: blue)[置信上限].

//#pagebreak()

// Page 7
//#stats-badge
由此我们可见:

对参数 $theta$ 作区间估计, 就是要设法找出两个只依赖于样本的界限 (构造统计量).
#grid(
  columns: (100%, auto),
  gutter: -9cm,
  align: center + horizon,
  [$ underline(theta) = underline(theta)(X_1, X_2, dots, X_n) $
    $ overline(theta) = overline(theta)(X_1, X_2, dots, X_n) $],
  [($underline(theta) < overline(theta)$)],
)

一旦有了样本, 就把 $theta$ 估计在区间 $(underline(theta), overline(theta))$ 内.

这里有 #text(fill: blue)[两个要求]:

//#pagebreak()

// Page 8
//#stats-badge
1. 要求 $theta$ 以很大的可能被包含在区间 $(underline(theta), overline(theta))$ 内, 就是说, 概率 $P(underline(theta) < theta < overline(theta))$ 要尽可能大. 即要求估计尽量可靠.

2. 估计的精度要尽可能的高. 如要求区间长度 $overline(theta) - underline(theta)$ 尽可能短, 或能体现该要求的其它准则.
#align(center)[#box(
    stroke: green,
    inset: 8pt,
    [*可靠度* 与 *精度* 是一对矛盾, 一般是在保证可靠度的条件下尽可能提高精度.],
  )]

//#pagebreak()

// Page 9
//#stats-badge
== 二、置信区间的求法

在求置信区间时, 要查表求 #text(fill: blue)[分位点].

#block(fill: luma(230), radius: 5pt, inset: 10pt)[
  #text(fill: blue)[*上 $alpha$ 分位点 定义*:]
  设 $0 < alpha < 1$, 对随机变量 $X$, 称满足
  $ P(X > x_alpha) = alpha <=> P(X <= x_alpha) = 1 - alpha $
  的点 $x_alpha$ 为 $X$ 的概率分布的 #text(fill: blue)[上 $alpha$ 分位点].
]

#let x = lq.linspace(-3.5, 3.5)
#let x2 = lq.linspace(1.5, 3.5)
#show lq.selector(lq.label): set align(top + right)
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [#lq.diagram(
      width: 10cm,
      height: 6cm,
      ylim: (0, 0.4),
      xlabel: [x],
      ylabel: [f(x)],
      legend: (position: left + top),
      lq.plot(
        x,
        x.map(x => 1 / calc.root(2 * 3.14159, 2) * calc.exp(-x * x / 2)),
        label: "X~N(0, 1)",
      ),
      lq.fill-between(
        fill: blue,
        x2,
        x2.map(x2 => 1 / calc.root(2 * 3.14159, 2) * calc.exp(-x2 * x2 / 2)),
      ),
      lq.place(2.3, 0.1)[↓ #sym.alpha ],
      lq.place(1.5, 0)[$mu_alpha$ ],
    )
  ],
  [#block(fill: luma(230))[
      #align(center)[
        标准正态分布的
        上 $alpha$ 分位点 $u_alpha$
      ]
    ]
    若 $Z tilde N(0, 1)$, 则
    $ P(Z > u_alpha) = alpha $

    (注：图中 $X$ 代表标准正态变量, $U$ 通常代表一般正态变量 $N(mu, sigma^2)$)],
)

#block(fill: luma(230))[
  #align(center)[
    自由度为 $n$ 的
    $chi^2$ 分布的上 $alpha$
    分位数 $chi^2_(alpha)(n)$
  ]
]

若 $X^2 tilde chi^2(n)$, 则
$ P(X^2 > chi^2_(alpha)(n)) = alpha $

//#pagebreak()

// Page 12
//#stats-badge
// [Diagram: F PDF with upper alpha quantile F_(alpha)(n1, n2)] - Placeholder comment


#block(fill: luma(230))[
  #align(center)[
    自由度为 $n_1, n_2$ 的
    $F$ 分布的上 $alpha$ 分
    位数 $F_(alpha)(n_1, n_2)$
  ]
]

若 $F tilde F(n_1, n_2)$, 则
$ P(F > F_(alpha)(n_1, n_2)) = alpha $

#v(5cm)

=== 例1
设 $X_1, ..., X_n$ 是取自 $N(mu, sigma^2)$ 的样本, $sigma^2$ 已知.
求参数 $mu$ 的置信度为 $1 - alpha$ 的置信区间.

*解*

// #pause

选 $mu$ 的点估计为 $overline(X)$.

取 *枢轴量* (Pivotal Quantity):
$ U = (overline(X) - mu) / (sigma / sqrt(n)) tilde N(0, 1) $

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  stroke: 1pt,
  inset: 10pt,
  [*思路*: 寻找一个包含参数 $mu$ 和统计量的函数, 其分布已知且不依赖任何未知参数.],
  [*要求*: 求参数 $mu$ 的置信区间, 置信水平为 $1-alpha$.],

  [*基础*: 以样本均值 $overline(X)$ 作为 $mu$ 的点估计.], [*工具*: 利用枢轴量 $U$ 的标准正态分布 $N(0,1)$ 构造区间.],
)

//#pagebreak()

// Page 14
//#stats-badge
#block(fill: luma(230))[
  对于给定的置信水平, 根据 $U$ 的分布, 确定一个区间, 使得 $U$ 取值于该区间的概率为置信水平.
]

对给定的置信水平 $1 - alpha$,
查标准正态分布表得 $u_(alpha/2)$,



使得
$ P( abs( (overline(X) - mu) / (sigma / sqrt(n)) ) <= u_(alpha / 2) ) = 1 - alpha $

(选择对称区间 $|U| <= u_(alpha/2)$ 是因为对于对称的 $N(0,1)$ 分布, 这是包含概率 $1-alpha$ 的最短区间)

//#pagebreak()

// Page 15
//#stats-badge
对给定的置信水平 $1 - alpha$, 查标准正态分布表得 $u_(alpha/2)$, 使
$ P( abs( (overline(X) - mu) / (sigma / sqrt(n)) ) <= u_(alpha / 2) ) = 1 - alpha $

// [Diagram: Standard Normal PDF with central 1-alpha area] - Placeholder comment


从中解得 (关于 $mu$):
$ P(overline(X) - sigma / sqrt(n) u_(alpha / 2) <= mu <= overline(X) + sigma / sqrt(n) u_(alpha / 2)) = 1 - alpha $

//#pagebreak()

// Page 16
//#stats-badge
$ P(overline(X) - sigma / sqrt(n) u_(alpha / 2) <= mu <= overline(X) + sigma / sqrt(n) u_(alpha / 2)) = 1 - alpha $

于是所求 $mu$ 的置信区间为
$ [overline(X) - sigma / sqrt(n) u_(alpha / 2), quad overline(X) + sigma / sqrt(n) u_(alpha / 2)] $

也可简记为
$ (overline(X) plus.minus sigma / sqrt(n) u_(alpha / 2)) $

// [Diagram: Standard Normal PDF with central 1-alpha area] - Placeholder comment
//#pagebreak()

// Page 17
//#stats-badge
== 求置信区间的一般步骤

从例1解题的过程, 我们归纳出求置信区间的一般步骤如下:

1. 明确问题: 求什么参数 $theta$ 的置信区间? 置信水平 $1 - alpha$ 是多少?
2. 寻找参数 $theta$ 的一个良好的点估计 $T = T(X_1, X_2, ..., X_n)$.
3. 寻找一个枢轴量: 即待估参数 $theta$ 和估计量 $T$ 的函数 $U = U(T, theta)$, 要求 $U$ 的分布已知, 且不依赖于任何未知参数.

//#pagebreak()

// Page 18
//#stats-badge
4. 对于给定的置信水平 $1 - alpha$, 根据 $U(T, theta)$ 的分布, 确定常数 $a, b$, 使得
  $ P(a < U(T, theta) < b) = 1 - alpha $
  (通常选择使区间最短或计算方便的 $a, b$, 如对称分位点).

5. 对不等式 $a < U(T, theta) < b$ 作等价变形, 将 $theta$ 解出, 得到如下形式:
  #block(fill: luma(230))[
    $underline(theta) < theta < overline(theta)$
  ]
  即
  $ P(underline(theta) < theta < overline(theta)) = 1 - alpha $
  其中 $underline(theta)$ 和 $overline(theta)$ 是由 $a, b, T$ 确定的统计量.

于是 $(underline(theta), overline(theta))$ 就是 $theta$ 的置信度为 $(1 - alpha)$ 的置信区间.

//#pagebreak()

// Page 19
//#stats-badge
可见, 确定区间估计很关键的是要寻找一个待估参数 $theta$ 和估计量 $T$ 的函数 $U(T, theta)$ (枢轴量), 且 $U(T, theta)$ 的 *分布为已知, 不依赖于任何未知参数*.

而枢轴量的构造及其分布往往与 *总体分布* 有关, 所以, 总体分布的形式是否已知, 是怎样的类型, *至关重要*.

//#pagebreak()

// Page 20
//#stats-badge
需要指出的是, 给定样本, 给定置信水平, 置信区间也 *不是唯一的*.

任意两个数 $a$ 和 $b$, 只要使得 $P(a < U < b) = 1 - alpha$ (例如 $0.95$), 它们就确定了一个 $1 - alpha$ (例如 $95%$) 的置信区间.

// [Diagrams: Different intervals (a, b) covering 95% area] - Placeholder comment
// Example: Three different intervals on a PDF all containing 95% area.

我们总是希望置信区间 *尽可能短* (即精度更高).

//#pagebreak()

// Page 21
//#stats-badge
在概率密度为单峰且对称的情形 (例如正态分布对应的枢轴量 $U$), 当区间对称选取 (即 $a = -b$) 时求得的置信区间的长度为最短.

// [Diagrams: Highlighting the symmetric interval a = -b as shortest] - Placeholder comment
// Example: Arrow pointing to the symmetric interval from the previous slide.
$ a = -b $

//#pagebreak()

// Page 22
//#stats-badge
即使在概率密度不对称的情形, 如 $chi^2$ 分布, $F$ 分布, 习惯上仍取 *对称的分位点* (即两尾概率相等, 均为 $alpha/2$) 来计算未知参数的置信区间.

// [Diagram: Chi-squared PDF with equal-tailed quantiles] - Placeholder comment


我们可以得到未知参数的任何置信水平小于1的置信区间, 并且置信水平越高 (可靠性越高), 相应的置信区间平均长度越长 (精度越低).

//#pagebreak()

// Page 23
//#stats-badge
也就是说, 要想得到的区间估计可靠度高 (置信水平 $1-alpha$ 大), 区间长度就长, 估计的精度就差. 这是一对矛盾.

实用中应在保证足够可靠的前提下, 尽量使得区间的长度短一些.

//#pagebreak()

// Page 24
//#stats-badge
== 三、正态总体 $N(mu, sigma^2)$ 的区间估计

设总体 $X tilde N(mu, sigma^2)$, $X_1, ..., X_n$ 为来自总体的样本, $overline(X), S^2$ 分别为样本均值和样本方差.

=== 1. 均值 $mu$ 的置信区间

==== 1° $sigma^2$ 为已知

枢轴量:
#box($ (overline(X) - mu) / (sigma / sqrt(n)) tilde N(0, 1) $)

可得到 $mu$ 的置信水平为 $1 - alpha$ 的置信区间为
$ (overline(X) - sigma / sqrt(n) u_(alpha / 2), quad overline(X) + sigma / sqrt(n) u_(alpha / 2)) $
或
$ (overline(X) plus.minus sigma / sqrt(n) u_(alpha / 2)) $

//#pagebreak()

// Page 25
//#stats-badge
==== 2° $sigma^2$ 为未知

枢轴量:
#box($ T = (overline(X) - mu) / (S / sqrt(n)) tilde t(n-1) $)
#block(fill: luma(240))[
  此分布 $t(n-1)$ 不依赖于任何未知参数 ($mu, sigma^2$).
]

由 $ P( abs(T) < t_(alpha/2)(n-1) ) = 1 - alpha $
$ P( abs((overline(X) - mu) / (S / sqrt(n))) < t_(alpha / 2)(n-1) ) = 1 - alpha $

可得到 $mu$ 的置信水平为 $1 - alpha$ 的置信区间为
$ (overline(X) - S / sqrt(n) t_(alpha / 2)(n-1), quad overline(X) + S / sqrt(n) t_(alpha / 2)(n-1)) $
或
$ (overline(X) plus.minus S / sqrt(n) t_(alpha / 2)(n-1)) $

//#pagebreak()

// Page 26
//#stats-badge


=== 例1 (糖果重量 - 均值)

有一大批糖果. 现从中随机地取 $n=16$ 袋, 称得重量 (以克计) 如下:
506, 508, 499, 503, 504, 510, 497, 512,
514, 505, 493, 496, 506, 502, 509, 496. 设袋装糖果的重量近似地服从正态分布, 试求总体均值 $mu$ 的置信水平 $0.95$ 为的置信区间. ($sigma^2$ 未知)

*解*
这里 $ 1 - alpha = 0.95 ,space alpha = 0.05,space  alpha/2 = 0.025 $
样本量 $n = 16$, 自由度 $n - 1 = 15$.

查 $t$ 分布表: $t_(alpha/2)(n-1) = t_(0.025)(15) = 2.1315$.

计算样本统计量:
样本均值 $ overline(X) = (1/16) sum_(i=1)^16 x_i = 503.75  克. $
样本标准差 $ S = sqrt( (1/(n-1)) sum_(i=1)^16 (x_i - overline(X))^2 ) = sqrt( (1/15) sum_(i=1)^16 (x_i - 503.75)^2 ) = 6.2022 克. $
//#pagebreak()

// Page 27
//#stats-badge
于是得到 $mu$ 的置信水平为 $0.95$ 的置信区间为
$
  (overline(X) plus.minus S / sqrt(n) t_(alpha / 2)(n-1))
  &= (503.75 plus.minus 6.2022 / sqrt(16) times 2.1315)
  \ & = (503.75 plus.minus 6.2022 / 4 times 2.1315)
  \ & = (503.75 plus.minus 1.55055 times 2.1315)
  \ & =(503.75 plus.minus 3.305)
$

即 $(503.75 - 3.305, quad 503.75 + 3.305) = (500.445, quad 507.055) $

约等于 $(500.4, 507.1)$ 克.

=== 2. 方差 $sigma^2$ 的置信区间

(假设均值 $mu$ 未知)
枢轴量:
$ K = (n-1) S^2 / sigma^2 tilde chi^2(n-1) $

由 $ P( chi^2_(1-alpha/2)(n-1) < K < chi^2_(alpha/2)(n-1) ) = 1 - alpha $
$ P( chi^2_(1-alpha / 2)(n-1) < (n-1) S^2 / sigma^2 < chi^2_(alpha / 2)(n-1) ) = 1 - alpha $

解不等式得 $sigma^2$ 的范围:
$ (n-1) S^2 / chi^2_(alpha / 2)(n-1) < sigma^2 < (n-1) S^2 / chi^2_(1-alpha / 2)(n-1) $

可得到 $sigma^2$ 的置信水平为 $1 - alpha$ 的置信区间为
$ ( ((n-1) S^2) / chi^2_(alpha / 2)(n-1) , quad ((n-1) S^2) / chi^2_(1-alpha / 2)(n-1) ) $

#pagebreak()

=== 例2 (糖果重量 - 方差)

使用 *例1* 的糖果重量数据 ($n=16$), 设重量服从正态分布, 试求总体方差 $sigma^2$ 的置信水平 $0.95$ 为的置信区间.

*解*
这里 $1 - alpha = 0.95$, $alpha/2 = 0.025$, $1 - alpha/2 = 0.975$.
自由度 $n - 1 = 15$.
查 $chi^2$ 分布表:
\ (上分位点)$ chi^2_(alpha / 2)(n-1) = chi^2_(0.025)(15) = 27.488 $
(下分位点)$ chi^2_(1-alpha / 2)(n-1) = chi^2_(0.975)(15) = 6.262 $

计算样本方差:
$S^2 = (1 / (n-1)) sum_(i=1)^16 (x_i - overline(X))^2 = (6.2022)^2 = 38.4673 space (克²)$

计算 $(n-1)S^2 = 15 times 38.4673 = 577.0095$.

//#pagebreak()

// Page 30
//#stats-badge
于是得到 $sigma^2$ 的置信水平为 $0.95$ 的置信区间为
$
  ( ((n-1) S^2) / chi^2_(alpha / 2)(n-1) , quad ((n-1) S^2) / chi^2_(1-alpha / 2)(n-1) ) = ( 577.0095 / 27.488 , quad 577.0095 / 6.262 ) = ( 20.991, quad 92.144 )
$

即 $(20.99, 92.14)$ (克²).

(如果要 $sigma$ 的置信区间, 只需对两端点开平方根: $(sqrt(20.99), sqrt(92.14)) approx (4.58, 9.60)$ 克)

//#pagebreak()

// Page 31
//#stats-badge
== 四、课堂练习

1. 某厂生产的一种塑料口杯的重量 $X$ 被认为服从正态分布. 今随机抽取 $n=9$ 个, 测得其重量为 (单位: 克):
  21.1, 21.3, 21.4, 21.5, 21.3, 21.7, 21.4, 21.3, 21.6.
  试用 95% 的置信度估计全部口杯的平均重量 $mu$. ($sigma^2$ 未知)

  *解*

  由题设可知，口杯重量服从正态分布：
  $ X tilde N(mu, sigma^2) $
  样本容量：
  $ n = 9 $
  计算样本统计量：

  $
    overline(X) &= (21.1 + ... + 21.6) / 9
    &= 192.6 / 9
    &= 21.4 space 克
  $

  $
    S^2 &= (1 / (n-1)) sum (x_i - overline(X))^2
    &= 0.26 / 8
    &= 0.0325
  $

  $
    S &= sqrt(0.0325)
    &approx 0.1803 space 克 quad (用 S = 0.18 space 近 似)
  $

  置信水平：
  $ 1 - alpha = 0.95 quad => quad alpha / 2 = 0.025 $

  自由度：
  $ n - 1 = 8 $

  查 $t$ 分布表得：
  $ t_(0.025)(8) = 2.306 $

  计算置信区间：

  $
    overline(X) plus.minus (S / sqrt(n)) t_(alpha / 2)(n-1)
    &= 21.4 plus.minus (0.18 / sqrt(9)) times 2.306 \
    &= 21.4 plus.minus (0.18 / 3) times 2.306 \
    &= 21.4 plus.minus 0.06 times 2.306 \
    &= 21.4 plus.minus 0.13836
  $

  置信区间为：
  $ (21.4 - 0.13836, quad 21.4 + 0.13836) = (21.26164, quad 21.53836) $

  约等于：
  $ (21.26, quad 21.54) space 克 $

#pagebreak()

// Page 32
//#stats-badge
2. 设某灯泡的寿命 $X tilde N(mu, sigma^2)$, $mu, sigma^2$ 未知. 现从中任取 $n=5$ 个灯泡进行寿命试验, 得数据 (单位: 千小时):
  10.5, 11.0, 11.2, 12.5, 12.8.
  求置信水平为 90% 的 $sigma^2$ 的区间估计.

*解*

$ n = 5 $

计算样本统计量：

$ overline(X) = (10.5 + ... + 12.8) / 5 = 58.0 / 5 = 11.6 $ 千小时

$
  S^2 = (1 / (5 - 1)) sum (x_i - 11.6)^2
  &= ((-1.1)^2 + (-0.6)^2 + (-0.4)^2 + (0.9)^2 + (1.2)^2) / 4
  \ &= (1.21 + 0.36 + 0.16 + 0.81 + 1.44) / 4
  \ &= 3.98 / 4
  \ &= 0.995 ("千小时²")
$

置信水平：

$ 1 - alpha = 0.90,quad alpha = 0.10,quad alpha / 2 = 0.05 $

自由度：

$ n - 1 = 4 $

查表得：\
（上分位点）
$ chi^2_(alpha / 2)(n - 1) = chi^2_(0.05)(4) = 9.488 $
（下分位点）
$ chi^2_(1 - alpha / 2)(n - 1) = chi^2_(0.95)(4) = 0.711 $

计算：

$ (n - 1) S^2 = 4 * 0.995 = 3.98 $

计算置信区间：

$
  (( (n - 1) S^2 ) / chi^2_(alpha / 2)(n - 1),quad ((n - 1) S^2 ) / chi^2_(1 - alpha / 2)(n - 1)) = (3.98 / 9.488,quad 3.98 / 0.711) = (0.4195,quad 5.5977)
$

$  sigma^2$ 的置信区间为 $  (0.4195, 5.5977)$（千小时²）
