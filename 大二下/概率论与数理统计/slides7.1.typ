#import "@preview/touying:0.6.1": *
#import "@preview/lilaq:0.2.0" as lq
#import themes.dewdrop: *
#set text(lang: "zh", font: "PingFang SC")
#import "@preview/numbly:0.1.0": numbly
#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  header: [数理统计],
)
#text(outline(title: none, indent: 1em))
#set par(first-line-indent: (amount: 1.5em, all: true))
// OCR Page 1: Title Slide
== 第一节 参数的点估计
上一讲, 我们介绍了总体、样本、简单随机样本、统计量和抽样分布的概念, 介绍了统计中常用的三大分布, 给出了几个重要的抽样分布定理. 它们是进一步学习统计推断的基础.

== 统计推断流程
研究统计量的性质和评价一个统计推断的优良性, 完全取决于其抽样分布的性质.
// OCR Page 4: Parameter Estimation Intro
== 参数估计

现在我们来介绍一类重要的统计推断问题

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  参数估计问题是利用从总体抽样得到的信息来估计总体的某些参数或者参数的某些函数.
]

#columns(2)[
  + 估计新生儿的体重
  + 估计废品率
  + 估计湖中鱼数
  + 估计降雨量
  + ...
  #colbreak()
  #box(
    stroke: red.darken(20%),
    inset: 8pt,
    radius: 3pt,
    fill: luma(245),
  )[
    在参数估计问题中, 假定总体分布形式已知, 未知的仅仅是一个或几个参数.
  ]
]


#pagebreak()

// OCR Page 5: General Formulation
=== 参数估计问题的一般提法

设有一个统计总体, 总体的分布函数为 $F(x, theta)$, 其中 $theta$ 为未知参数 ($theta$ 可以是向量).

现从该总体抽样, 得样本
$ X_1, X_2, dots, X_n $

要依据该样本对参数 $theta$ 作出估计, 或估计 $theta$ 的某个已知函数 $g(theta)$.

#block(fill: luma(235), radius: 5pt, inset: 8pt)[
  这类问题称为 #text(fill: blue)[参数估计].
]

#pagebreak()

// OCR Page 6: Types of Estimation
=== 参数估计的类型

#align(center)[
  参数估计
  $arrow.r$
  #stack(
    dir: ttb,
    spacing: 1em,
    [#text(1.2em)[点估计]],
    [#text(1.2em)[区间估计]],
  )
]

#pagebreak()

// OCR Page 7: Example: Point vs Interval
=== 点估计 vs 区间估计

例如我们要估计某队男生的平均身高.
(假定身高服从正态分布 $N(mu, 0.1^2)$)

现从该总体选取容量为 5 的样本, 我们的任务是要根据选出的样本 (5 个数) 求出总体均值 $mu$ 的估计. 而全部信息就由这 5 个数组成.

设这 5 个数是:
#align(center)[ 1.65, 1.67, 1.68, 1.78, 1.69 ]

估计 $mu$ 为 1.68, 这是 #text(fill: blue)[点估计].

估计 $mu$ 在区间 [1.57, 1.84] 内, 这是 #text(fill: blue)[区间估计].

#pagebreak()

// OCR Page 8: Point Estimation Concept Intro
== 点估计概念

=== 例1 (新生儿体重)
已知某地区新生婴儿的体重 $X tilde N(mu, sigma^2)$, ($mu, sigma$ 未知)
// Image placeholders
// #image("babies.png", width: 30%) ... #image("scale.png", width: 25%)

随机抽查 100 个婴儿, 得 100 个体重数据:
#align(center)[ 10, 7, 6, 6.5, 5, 5.2, ... ]

而全部信息就由这 100 个数组成.
据此, 我们应如何估计 $mu$ 和 $sigma$ 呢?

#pagebreak()

为估计 $mu$:

我们需要构造出适当的样本的函数 $T(X_1, X_2, dots, X_n)$, 每当有了样本, 就代入该函数中算出一个值, 用来作为 $mu$ 的估计值.

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  $T(X_1, X_2, dots, X_n)$ 称为参数 $mu$ 的 #text(fill: blue)[点估计量] (Estimator),
  把样本值代入 $T(X_1, X_2, dots, X_n)$ 中, 得到 $mu$ 的一个 #text(fill: blue)[点估计值] (Estimate).
]

#pagebreak()

我们知道, 若 $X tilde N(mu, sigma^2)$, 则 $E(X) = mu$.
由大数定律,
$ lim_(n -> oo) P { abs( (1/n) sum_(i=1)^n X_i - mu ) < epsilon } = 1 $

#box(stroke: red.darken(20%), fill: luma(245), radius: 3pt, inset: 5pt)[样本体重的平均值]

自然想到把样本体重的平均值作为总体平均体重的一个估计.

用样本体重的均值 $overline(X)$ 估计 $mu$.
类似地, 用样本体重的方差 $S^2$ 估计 $sigma^2$.

$ overline(X) = (1 / n) sum_(i=1)^n X_i, quad S^2 = (1 / (n-1)) sum_(i=1)^n (X_i - overline(X))^2 $

#pagebreak()

// OCR Page 11: Choice of Estimator
== 点估计概念 (问题)

问题是:
使用什么样的统计量去估计 $mu$?

+ 可以用样本均值 $overline(X)$;
+ 也可以用样本中位数;
+ 还可以用别的统计量.
  (引出需要寻找“好”的估计量和估计方法)

#pagebreak()

// OCR Page 12: Methods for Finding Estimators
== 二、寻求估计量的方法

1. #text(fill: blue)[矩估计法] (Method of Moments)
2. #text(fill: blue)[极大似然法] (Maximum Likelihood Estimation)
3. 最小二乘法 (Least Squares)
4. 贝叶斯方法 (Bayesian Methods)
  ...

#block(fill: luma(235), radius: 5pt, inset: 8pt)[
  这里我们主要介绍前面两种方法.
]

#pagebreak()

// OCR Page 13: Method of Moments Intro
== 1. 矩估计法

矩估计法是英国统计学家 K. 皮尔逊 (K. Pearson) 最早提出来的.

#grid(
  columns: (70%, 30%),
  [
    由大数定律, 若总体 $X$ 的数学期望 $E(X) = mu$ 有限, $X_1, X_2, ..., X_n$ 是一组样本, 独立同分布 (和 $X$ 分布相同), 则有
    $ overline(X) = (1 / n) sum_(i=1)^n X_i arrow.long.r^"P" E(X) = mu $
    (依概率收敛)

    同理, 对总体的 $k$ 阶矩 $mu_k = E(X^k)$ 和样本的 $k$ 阶原点矩 $A_k = (1/n) sum_(i=1)^n X_i^k$, 若 $E(X^k)$ 存在, 则有
    $ A_k = (1 / n) sum_(i=1)^n X_i^k arrow.long.r^"P" -> E(X^k) = mu_k quad (k = 1, 2, ...) $
  ],
  [
    // Placeholder for Pearson's image
    // #image("pearson.jpg", width: 100%)
  ],
)

#pagebreak()

// OCR Page 14: Method of Moments Definition
== 矩估计法 (定义)

这表明, 当样本容量很大时, 在统计上, 可以用样本矩去估计总体矩. 这一事实导出矩估计法.

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  #text(fill: blue)[定义:] 用 #text(green)[样本原点矩] 估计相应的 #text(green)[总体原点矩], 这种参数点估计法称为 #text(fill: blue)[矩估计法].
]

#box(stroke: green, inset: 8pt, radius: 3pt)[
  理论依据: 大数定律 (样本矩依概率收敛于总体矩)
]

#block(fill: luma(235), radius: 5pt, inset: 8pt)[
  矩估计法的具体做法如下:
  设总体的分布函数中含有 $k$ 个未知参数 $theta_1, theta_2, ..., theta_k$.
  那么它的前 $k$ 阶总体原点矩 $mu_1, mu_2, ..., mu_k$, 一般
]

#pagebreak()

// OCR Page 15: Method of Moments Procedure
== 矩估计法 (步骤)

都是这 $k$ 个参数的函数, 记为:
$ mu_i = mu_i (theta_1, theta_2, ..., theta_k) quad i=1, 2, ..., k $

从这 $k$ 个方程中解出 $theta_j$:
$ theta_j = theta_j (mu_1, mu_2, ..., mu_k) quad j=1, 2, ..., k $

那么用诸 #text(green)[样本原点矩] $A_i$ 的估计量代替上式中的诸 #text(green)[总体原点矩] $mu_i$, 即可得诸 $theta_j$ 的矩估计量:
$ hat(theta)_j = theta_j (A_1, A_2, ..., A_k) quad j=1, 2, ..., k $


#pagebreak()

// OCR Page 16: MoM Example 2 - Uniform Prep
== 矩估计法 - 例2

设总体 $X$ 在 $[a, b]$ 上服从均匀分布, $a, b$ 未知. $X_1, ..., X_n$ 是来自 $X$ 的样本, 试求 $a, b$ 的矩估计量.
*解*
*解*
总体是均匀分布 $U(a, b)$, 其概率密度函数为:
$
  f(x) = cases(1 / (b-a)\,  quad &a <= x <= b \
      0\, quad &"其它")
$

*步骤 1*: 计算总体的两个矩
(1) 一阶矩 (均值):
$ E(X) = integral_a^b x dot (1 / (b-a)) dif x = (b+a) / 2 $

(2) 二阶矩:
$ E(X^2) = integral_a^b x^2 dot (1 / (b-a)) dif x = (b^2 + a b + a^2) / 3 $

*步骤 2*: 用样本矩估计总体矩

设 $overline(X) = (1/n)sum_(i=1)^n X_i$ (样本均值),
$A_2 = (1/n)sum_(i=1)^n X_i^2$ (样本二阶矩),
则可建立方程组:
$ overline(X) = (b+a) / 2 $
$ A_2 = (b^2 + a b + a^2) / 3 $

*步骤 3*: 求解方程组
从第一个方程得: $b = 2overline(X) - a$

代入第二个方程:
$ A_2 = ((2overline(X) - a)^2 + a(2overline(X) - a) + a^2) / 3 $
$ = (4overline(X)^2 - 4a overline(X) + a^2 + 2a overline(X) - a^2 + a^2) / 3 $
$ = (4overline(X)^2 - 2a overline(X) + a^2) / 3 $

因此:
$ 3A_2 = 4overline(X)^2 - 2a overline(X) + a^2 $
$ a^2 - 2a overline(X) + (4overline(X)^2 - 3A_2) = 0 $

解此二次方程得:
$ a = overline(X) - sqrt(3(A_2 - overline(X)^2)) $
$ b = overline(X) + sqrt(3(A_2 - overline(X)^2)) $

因此, $a$ 和 $b$ 的矩估计量为:
$
  hat(a) = overline(X) - sqrt(3((1/n)sum_(i=1)^n X_i^2 - overline(X)^2)) ,quad hat(b) = overline(X) + sqrt(3((1/n)sum_(i=1)^n X_i^2 - overline(X)^2))
$
#pagebreak()

// OCR Page 18: MoM Example 3 - Mean/Variance Prep
== 矩估计法 - 例3

设总体 $X$ 的均值 $mu$ 和方差 $sigma^2 (> 0)$ 都存在, $mu, sigma^2$ 未知. $X_1, ..., X_n$ 是来自 $X$ 的样本, 试求 $mu, sigma^2$ 的矩估计量.

*解*
总体矩:
$ mu_1 = E(X) = mu $
$ mu_2 = E(X^2) = D(X) + [E(X)]^2 = sigma^2 + mu^2 $

(#box(stroke: red, fill: luma(245))[总体矩])
解得
$ mu = mu_1 $
$ sigma^2 = mu_2 - mu_1^2 $

于是 $mu, sigma^2$ 的矩估计量为 (用 $A_1=overline(X)$ 和 $A_2 = (1/n)sum X_i^2$ 代替 $mu_1, mu_2$):
$ hat(mu) = A_1 = overline(X) $
$ hat(sigma)^2 = A_2 - A_1^2 = (1 / n) sum_(i=1)^n X_i^2 - overline(X)^2 = (1 / n) sum_(i=1)^n (X_i - overline(X))^2 $
(#box(stroke: red, fill: luma(245))[样本矩])

#pagebreak()

// OCR Page 20: MoM Conclusion for Mean/Variance
== 矩估计法 - 结论
<结论>

#block(fill: luma(230), radius: 5pt, inset: 10pt)[
  结论: 不管总体 $X$ 服从何种分布, 总体期望 $mu$ 和方差 $sigma^2$ 的矩估计量分别为
  $ hat(mu) = overline(X) = (1 / n) sum_(i=1)^n X_i $
  $ hat(sigma)^2 = (1 / n) sum_(i=1)^n (X_i - overline(X))^2 = ((n-1) / n) S^2 $
  #box(stroke: green, fill: yellow.lighten(80%))[*可作为公式*]
]
#v(100%)
估计值为:
$ hat(mu) = overline(x) = (1 / n) sum_(i=1)^n x_i $
$ hat(sigma)^2 = (1 / n) sum_(i=1)^n (x_i - overline(x))^2 $

#pagebreak()

// OCR Page 21: MoM Example 4
== 矩估计法 - 例4

设 $X_1, X_2, ..., X_n$ 为总体 $X$ 的样本, 试求下列总体分布参数的矩估计量.\
(1) $X tilde N(mu, sigma^2)$\
(2) $X tilde B(N, p)$ (N 已知)\
(3) $X tilde P(lambda)$
#v(100%)
*解*
(1) 由于 $E(X) = mu$, $D(X) = sigma^2$.
根据例 3 结论, 参数 $mu$ 和 $sigma^2$ 的矩估计量为
$ hat(mu) = overline(X) $
$ hat(sigma)^2 = (1 / n) sum_(i=1)^n (X_i - overline(X))^2 $

(2) 由于 $E(X) = N p$.
令总体一阶矩等于样本一阶矩: $N p = overline(X)$.
所以 $N p = overline(X)$
得参数 $p$ 的矩估计量为 $hat(p) = overline(X) / N = (1 / (N n)) sum_(i=1)^n X_i $

(3) 由于 $E(X) = lambda$. (同时 $D(X) = lambda$)
令总体一阶矩等于样本一阶矩: $lambda = overline(X)$.
所以参数 $lambda$ 的矩估计量为
$ hat(lambda) = overline(X) = (1 / n) sum_(i=1)^n X_i $ [一阶矩])

或者, 令总体二阶矩等于样本二阶矩: $E(X^2) = D(X) + [E(X)]^2 = lambda + lambda^2$.
$ lambda + lambda^2 = A_2 = (1 / n) sum X_i^2 $. 这也可以解出 $lambda$, 但通常用低阶矩.
(注: 教材原文似乎用二阶中心矩 $D(X)$ 来估计 $lambda$, $hat(lambda) = (1/n)sum(X_i-overline(X))^2$. 但用一阶矩更直接简单).

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  可见: 同一个参数的矩估计量可以不同 (例如上面用一阶矩和二阶矩得到不同的估计量形式). 所以统计量存在“优、劣”之分.
]

#pagebreak()

// OCR Page 23: MoM Pros and Cons
== 矩估计法 - 优缺点

#box(fill: green.lighten(80%), radius: 5pt, inset: 10pt)[
  *优点*: 简单易行, 并不需要事先知道总体是什么分布.
]

#box(fill: red.lighten(80%), radius: 5pt, inset: 10pt)[
  *缺点*: 当总体类型已知时, 没有充分利用分布提供的信息. 一般场合下, 矩估计量不具有唯一性.
]

其主要原因在于建立矩法方程时, 选取哪些总体矩用相应样本矩代替带有一定的随意性.

#pagebreak()

// OCR Page 24: Classroom Exercise 1 Prep
== 三、课堂练习 (矩估计法)

=== 例1
设总体 $X$ 的概率密度为
$ f(x) = cases( (alpha + 1) x^alpha\, quad 0 < x < 1 \ 0\, quad "其它" ) $
其中 $alpha > -1$ 是未知参数, $X_1, X_2, ..., X_n$ 是取自 $X$ 的样本, 求参数 $alpha$ 的矩估计.

#v(100%)

*解*
计算总体一阶矩:
$ mu_1 = E(X) = integral_0^1 x f(x) dif x = integral_0^1 x (alpha + 1) x^alpha dif x $
$ space quad = (alpha + 1) integral_0^1 x^(alpha + 1) dif x = (alpha + 1) [ x^(alpha + 2) / (alpha + 2) ]_0^1 $
$ space quad = (alpha + 1) / (alpha + 2) $
(#box(stroke: red, fill: luma(245))[总体矩])

令 $mu_1 = A_1 = overline(X)$ (#box(stroke: red, fill: luma(245))[样本矩]):
$ (alpha + 1) / (alpha + 2) = overline(X) $

解得 $alpha$:
$ alpha + 1 = overline(X) (alpha + 2) = alpha overline(X) + 2 overline(X) $
$ alpha (1 - overline(X)) = 2 overline(X) - 1 $
$ alpha = (2 overline(X) - 1) / (1 - overline(X)) $

故 $alpha$ 的矩估计量为
$ hat(alpha) = (2 overline(X) - 1) / (1 - overline(X)) $

#pagebreak()

// OCR Page 26: Classroom Exercise 2 Prep
== 课堂练习 - 例2

设 $X_1, X_2, ..., X_n$ 是取自总体 $X$ 的一个样本, 其密度函数为
$ X tilde f(x) = cases( (1/theta) e^(-(x-mu)/theta), quad x >= mu \ 0, quad "其它" ) $
其中 $theta > 0$, $mu$ 为未知参数. 求 $theta, mu$ 的矩估计.
#v(100%)
*解*
由密度函数知: $Y = X - mu$ 是具有参数 $lambda = 1/theta$ 的指数分布.
$ E(Y) = 1 / lambda = theta $
$ D(Y) = 1 / lambda^2 = theta^2 $

故
$ E(X - mu) = theta quad => quad E(X) - mu = theta quad => quad E(X) = mu + theta $
$ D(X - mu) = theta^2 quad => quad D(X) = theta^2 $


也就是总体矩:
$ mu_1 = E(X) = mu + theta $
$ sigma^2 = D(X) = theta^2 quad => quad theta = sqrt(D(X)) $

解得
$ theta = sqrt(D(X)) = sqrt(E(X^2) - [E(X)]^2) = sqrt(mu_2 - mu_1^2) $
$ mu = E(X) - theta = mu_1 - sqrt(mu_2 - mu_1^2) $

于是 $theta, mu$ 的矩估计量为 (用样本矩 $A_1, A_2$ 代替 $mu_1, mu_2$):
$ hat(theta) = sqrt( A_2 - A_1^2 ) = sqrt( (1/n) sum_(i=1)^n (X_i - overline(X))^2 ) $
$ hat(mu) = A_1 - hat(theta) = overline(X) - sqrt( (1/n) sum_(i=1)^n (X_i - overline(X))^2 ) $
(注: 有时也用 $S^2$ 的矩估计 $hat sigma}^2 = (1/n)sum(X_i - overline{X})^2$ 中的 $\hat{sigma}$ 作为 $theta$ 的估计)

#pagebreak()

== 2. 极大似然估计 (MLE)

它是在总体类型已知条件下使用的一种参数估计方法.

#grid(
  columns: 1,
  [
    它首先是由德国数学家高斯 (Gauss) 在 1821 年提出的. 然而, 这个方法常归功于英国统计学家费歇 (Fisher).

    费歇在 1922 年重新发现了这一方法, 并首先研究了这种方法的一些性质.
  ],
)

#pagebreak()

// OCR Page 29: MLE Basic Idea - Example 1
== 极大似然法基本思想

先看一个简单例子:
某位同学与一位猎人一起外出打猎. 一只野兔从前方窜过. 只听一声枪响, 野兔应声倒下. 如果要你推测, 是谁打中的呢? 你会如何想呢?
#pause

你就会想, 只发一枪便打中, #text(green)[猎人命中的概率] 一般大于 #text(green)[这位同学命中的概率]. 看来这一枪是猎人射中的.

#block(fill: luma(240), radius: 5pt, inset: 10pt)[
  这个例子所作的推断已经体现了极大似然法的基本思想:
  #text(blue)[哪个参数值使得观察到的样本结果出现的可能性 (概率) 最大, 就选哪个值作为参数的估计.]
]

#pagebreak()

// OCR Page 31: MLE Basic Idea - Example 2
== 极大似然法基本思想 (再例)

某人射击, 射中目标概率为 $p$, $p$ 只可能为 0.9 或者 0.1. 他射了一次便射中. 自然认为他射中目标的概率为 0.9.

此例可以理解为, 总体分布为 Bernoulli(p):
$ X = cases(1 quad "射中" \ 0 quad "射不中") $
$ P(X=x) = p^x (1-p)^(1-x), quad x=0, 1 $
($p$ 是待估参数)

观察到样本 $X_1 = 1$ 发生.
比较两种可能:
+ 若 $p = 0.9$, 则 $P(X_1=1 | p=0.9) = 0.9$
+ 若 $p = 0.1$, 则 $P(X_1=1 | p=0.1) = 0.1$

选择 $p = 0.9$ 是因为 $p=0.9$ 时, $X_1 = 1$ 发生的概率 (可能性) 比 $p = 0.1$ 时更大.

#block(fill: luma(230), radius: 5pt, inset: 8pt)[
  #text(blue)[极大似然估计思路]: 总体中有未知参数 $theta$, 抽取样本 $X_1, ..., X_n$. 选择 $theta$ 的原则是: 选择的 $hat(theta)$ 可使样本观测值 $(x_1, ..., x_n)$ 出现的可能性 (概率或联合密度) 最大.
]

#pagebreak()

// OCR Page 32: MLE Formal Definition - Discrete
== 参数的极大似然估计法 (离散型)

若总体 $X$ 为离散型, 设总体 $X$ 的分布律为
$ P(X = x) = p(x; theta) quad (theta " 为待估参数") $

设样本 $(X_1, X_2, ..., X_n)$ 的观测值为 $(x_1, x_2, ..., x_n)$.
即事件 ${ X_1 = x_1, X_2 = x_2, ..., X_n = x_n }$ 发生.

由于 $X_1, X_2, ..., X_n$ 独立同分布, 该事件发生的概率为:
$ P(X_1 = x_1, ..., X_n = x_n) = P(X_1 = x_1) ... P(X_n = x_n) $
$ space quad = p(x_1; theta) p(x_2; theta) ... p(x_n; theta) $
$ space quad = product_(i=1)^n p(x_i; theta) $

这个概率是 $theta$ 的函数, 称为 #text(fill: blue)[似然函数], 记为 $L(theta)$.
$
  L(theta) = L(theta; x_1, ..., x_n) = product_(i=1)^n p(x_i; theta)
$ (#box(stroke: red, fill: luma(245))[令为 $L(theta)$])

#pagebreak()

// OCR Page 33: MLE Definition - Likelihood Maximization
== 参数的极大似然估计法 (求法)

为了使样本观测值 $(x_1, ..., x_n)$ 出现的概率 $L(theta)$ 最大, 需要找到参数 $theta$ 的估计量 $hat(Theta)$ (其取值为 $hat(theta)$), 使得 $L(theta)$ 达到最大, 即
$ L(hat(theta); x_1, ..., x_n) = max_(theta) L(theta; x_1, ..., x_n) $

#block(fill: luma(235), radius: 5pt, inset: 10pt)[
  则称 $hat(theta)$ 为参数 $theta$ 的 #text(fill: blue)[极大似然估计值], 相应的统计量 $hat(Theta)$ 为 #text(fill: blue)[极大似然估计量] (MLE).
]

#pagebreak()

// OCR Page 34: MLE Formal Definition - Continuous
== 参数的极大似然估计法 (连续型)

若总体 $X$ 为连续型随机变量, 设总体 $X$ 的密度函数为
$ f(x; theta) quad (theta " 为未知参数") $

则样本 $(X_1, X_2, ..., X_n)$ 的联合密度函数为
$ f(x_1, ..., x_n; theta) = product_(i=1)^n f(x_i; theta) $

令 #text(fill: blue)[似然函数] 为
$ L(theta) = L(theta; x_1, ..., x_n) = product_(i=1)^n f(x_i; theta) $

参数 $theta$ 的估计量 $hat(Theta)$ (取值为 $hat(theta)$), 使得样本观测值 $(x_1, ..., x_n)$ 出现的 "概率密度" (似然) 达到最大, 也即 $L(theta)$ 达到最大, 即
$ L(hat(theta); x_1, ..., x_n) = max_(theta) L(theta; x_1, ..., x_n) $

#block(fill: luma(235), radius: 5pt, inset: 10pt)[
  则称 $hat(theta)$ 为参数 $theta$ 的 #text(fill: blue)[极大似然估计值], $hat(Theta)$ 为 #text(fill: blue)[极大似然估计量] (MLE).
]

#pagebreak()

// OCR Page 35: MLE Practical Calculation
== 极大似然估计法 (求解技巧)

两点说明:
1. 求似然函数 $L(theta)$ 的最大值点, 可以应用微积分中的技巧. 由于 $ln(x)$ 是 $x$ 的增函数, $ln L(theta)$ 与 $L(theta)$ 在 $theta$ 的同一值处达到它的最大值. 假定 $theta$ 是一实数, 且 $ln L(theta)$ 是 $theta$ 的一个可微函数. 通过求解 #text(fill: blue)[似然方程]:
  $ (dif / (dif theta)) ln L(theta) = 0 $
  可以得到 $theta$ 的极大似然估计 $hat(theta)$.
  #box(stroke: green)[若 $theta$ 是向量, 上述方程必须用方程组代替.]

2. 用上述求导方法求参数的极大似然估计有时行不通 (如导数不存在或方程无解或解不在参数空间), 这时要用极大似然原则 (即直接找 $L(theta)$ 的最大值点) 来求.

#pagebreak()

// OCR Page 36: MLE Example 5 - Bernoulli Prep
== MLE 举例 - 例5

设 $X_1, X_2, ..., X_n$ 是取自总体 $X tilde B(1, p)$ 的一个样本 ($X$ 服从伯努利分布), 求参数 $p$ 的极大似然估计量.

*解*:
总体 $X$ 的分布律 (PMF):
$ P(X=k) = p^k (1-p)^(1-k), quad k = 0, 1 $
(这里 $N=1$, 即 $B(1,p)$).

单个观测 $x_i$ 的概率为 $P(X_i = x_i) = p^(x_i) (1-p)^(1-x_i)$, 其中 $x_i = 0$ 或 $1$.
似然函数为:
$ L(p) = f(x_1, ..., x_n; p) = product_(i=1)^n P(X_i = x_i) $
$ space quad = product_(i=1)^n p^(x_i) (1-p)^(1-x_i) $
$ space quad = p^(sum x_i) (1-p)^(n - sum x_i) $

#pagebreak()

// OCR Page 37: MLE Example 5 - Bernoulli Solution
== MLE 举例 - 例5 (续)

对数似然函数为:
$ ln L(p) = (sum_(i=1)^n x_i) ln(p) + (n - sum_(i=1)^n x_i) ln(1 - p) $

对 $p$ 求导并令其为 0:
$ (dif / (dif p)) ln L(p) = (sum_(i=1)^n x_i) / p - (n - sum_(i=1)^n x_i) / (1 - p) = 0 $
$ (sum x_i) / p = (n - sum x_i) / (1 - p) $
$ (sum x_i) (1 - p) = p (n - sum x_i) $
$ sum x_i - p sum x_i = n p - p sum x_i $
$ sum x_i = n p $
$ p = (1 / n) sum_(i=1)^n x_i = overline(x) $

得 $hat(p) = overline(x)$. 即为 $p$ 的极大似然估计值.

从而 $p$ 的极大似然估计量为
$ hat(P) = (1 / n) sum_(i=1)^n X_i = overline(X) $

#pagebreak()

// OCR Page 38: MLE Steps Summary
== 参数的极大似然估计法步骤

(1) #text(blue)[构造似然函数] $L(theta) = product_(i=1)^n f(x_i; theta)$ (连续型) 或 $L(theta) = product_(i=1)^n p(x_i; theta)$ (离散型).

(2) #text(blue)[取自然对数] $ln L(theta) = sum_(i=1)^n ln f(x_i; theta)$ 或 $sum_(i=1)^n ln p(x_i; theta)$.

(3) #text(blue)[建立似然方程(组)]
令 $ (dif / (dif theta)) ln L(theta) = 0 $.
其解 $hat(theta)$ 即为参数 $theta$ 的极大似然估计值.

若总体的密度函数中有多个参数 $theta_1, theta_2, ..., theta_k$, 则将第 (3) 步改为解 #text(blue)[似然方程组]:
$ (partial / (partial theta_j)) ln L(theta_1, ..., theta_k) = 0, quad (j = 1, 2, ..., k) $
解方程组即可.

#pagebreak()

// OCR Page 39: MLE Example 6 - Poisson Prep
== MLE 举例 - 例6

设总体 $X tilde P(lambda)$ (泊松分布), $lambda$ 未知. $x_1, ..., x_n$ 是来自 $X$ 的样本值, 试求 $lambda$ 的极大似然估计量.

*解*:
$X$ 的概率分布 (PMF) 为
$ P(X = k) = (lambda^k e^(-lambda)) / (k!), quad k = 0, 1, 2, ... $

似然函数为
$ L(lambda) = product_(i=1)^n P(X=x_i) = product_(i=1)^n (lambda^(x_i) e^(-lambda)) / (x_i!) $
$ space quad = (lambda^(sum x_i) e^(-n lambda)) / (product_(i=1)^n x_i!) $


对似然函数取对数:
$ ln L(lambda) = (sum_(i=1)^n x_i) ln lambda - n lambda - sum_(i=1)^n ln(x_i!) $

令导数为 0:
$ (dif / (dif lambda)) ln L(lambda) = (sum_(i=1)^n x_i) / lambda - n = 0 $

即
$ (sum x_i) / lambda = n $
$ lambda = (1 / n) sum_(i=1)^n x_i = overline(x) $

可得 $lambda$ 的极大似然估计值为 $hat(lambda) = overline(x)$.
极大似然估计量为 $hat(Lambda) = overline(X)$.

#pagebreak()

// OCR Page 41: MLE Example 7 - Normal Prep
== MLE 举例 - 例7

设总体 $X tilde N(mu, sigma^2)$, $mu, sigma^2$ 未知. $x_1, ..., x_n$ 是来自 $X$ 的样本值, 试求 $mu, sigma^2$ 的极大似然估计量.

*解*:
$X$ 的概率密度 (PDF) 为
$ f(x; mu, sigma^2) = 1 / (sqrt(2 pi sigma^2)) e^(- (x - mu)^2 / (2 sigma^2)), quad -oo < x < oo $

似然函数为
$ L(mu, sigma^2) = product_(i=1)^n 1 / (sqrt(2 pi sigma^2)) e^(- (x_i - mu)^2 / (2 sigma^2)) $


$ L(mu, sigma^2) = (1 / ( (2 pi sigma^2)^(n / 2) )) exp[ - (1 / (2 sigma^2)) sum_(i=1)^n (x_i - mu)^2 ] $
$ space quad = (2 pi)^(-n / 2) (sigma^2)^(-n / 2) exp[ - (1 / (2 sigma^2)) sum_(i=1)^n (x_i - mu)^2 ] $

于是对数似然函数为 (记 $theta_1 = mu, theta_2 = sigma^2$)
$ ln L = - (n / 2) ln(2 pi) - (n / 2) ln(sigma^2) - (1 / (2 sigma^2)) sum_(i=1)^n (x_i - mu)^2 $

求偏导数:
$
  (partial / (partial mu)) ln L = - (1 / (2 sigma^2)) sum_(i=1)^n 2 (x_i - mu) (-1) = (1 / sigma^2) sum_(i=1)^n (x_i - mu)
$
$ (partial / (partial sigma^2)) ln L = - (n / 2) (1 / sigma^2) - (-1 / (2 (sigma^2)^2)) sum_(i=1)^n (x_i - mu)^2 $
$ space quad = - n / (2 sigma^2) + 1 / (2 (sigma^2)^2) sum_(i=1)^n (x_i - mu)^2 $

令偏导数为 0:
$ (1 / sigma^2) sum_(i=1)^n (x_i - mu) = 0 quad => quad sum x_i - n mu = 0 $
$ - n / (2 sigma^2) + (sum (x_i - mu)^2) / (2 (sigma^2)^2) = 0 $

解似然方程组:
从第一个方程得: $sum x_i = n mu quad => quad mu = (1/n) sum x_i = overline(x) $
将 $mu = overline(x)$ 代入第二个方程:
$ - n / (2 sigma^2) + (sum (x_i - overline(x))^2) / (2 (sigma^2)^2) = 0 $
乘以 $2 (sigma^2)^2$:
$ - n sigma^2 + sum (x_i - overline(x))^2 = 0 $
$ n sigma^2 = sum (x_i - overline(x))^2 $
$ sigma^2 = (1 / n) sum_(i=1)^n (x_i - overline(x))^2 $

解得极大似然估计值为:
$ hat(mu) = overline(x) $
$ hat(sigma)^2 = (1 / n) sum_(i=1)^n (x_i - overline(x))^2 $

$mu, sigma^2$ 的极大似然估计量为:
$ hat(Mu) = overline(X) $
$ hat(Sigma)^2 = (1 / n) sum_(i=1)^n (X_i - overline(X))^2 $

#pagebreak()

// OCR Page 44: MLE Example 8 - Uniform
== MLE 举例 - 例8

设总体 $X tilde U(0, theta)$, $theta > 0$ 未知. $x_1, ..., x_n$ 是来自 $X$ 的样本值, 试求 $theta$ 的极大似然估计.

*解*:
$X$ 的概率密度为
$ f(x; theta) = cases( 1/theta\, quad 0 <= x <= theta \ 0\, quad "其它" ) $

似然函数为
$
  L(theta) = product_(i=1)^n f(x_i; theta) = cases( (1/theta)^n\, quad "if all " 0 <= x_i <= theta \ 0\, quad "otherwise" )
$

条件 "all $0 <= x_i <= theta$" 等价于 $theta >= max(x_1, ..., x_n)$ 且 $min(x_1, ..., x_n) >= 0$. 假设后者成立 (因为总体是 $U(0, theta)$). 记 $x_((n)) = max(x_1, ..., x_n)$.
则 $L(theta) = (1/theta)^n$ for $theta >= x_((n))$, and $L(theta)=0$ for $theta < x_((n))$.

#block(fill: luma(230), radius: 5pt, inset: 10pt)[
  为使 $L(theta)=(1/theta)^n$ 最大, $theta$ 须尽可能的小.
  但 $theta$ 不能小于 $x_((n)) = max{x_1, ..., x_n}$.
  故 $theta$ 的最小值应取 $x_((n))$.
  故 $hat(theta) = max{x_1, ..., x_n}$ 时 $L(theta)$ 取到最大值.
]
(这里不能用求导法)

故 $theta$ 的极大似然估计量为 $hat(Theta) = max{X_1, X_2, ..., X_n}$.

#pagebreak()

// OCR Page 45: Classroom Exercise (MLE) Prep
== 课堂练习 (极大似然估计)

设 $X_1, X_2, ..., X_n$ 是取自总体 $X$ 的一个样本, 其概率密度为
$ X tilde f(x) = cases( theta x^(theta - 1)\, quad 0 < x < 1 \ 0\, quad "其它" ) $
其中 $theta > 0$. 求 $theta$ 的极大似然估计值.

*解*
似然函数为 (假设 $0 < x_i < 1$ for all $i$)
$ L(theta) = product_(i=1)^n f(x_i; theta) = product_(i=1)^n (theta x_i^(theta - 1)) $
$ space quad = theta^n (product_(i=1)^n x_i)^(theta - 1) $

对数似然函数为
$ ln L(theta) = n ln theta + (theta - 1) sum_(i=1)^n ln x_i $

#pagebreak()

// OCR Page 46: Classroom Exercise (MLE) Solution
== 课堂练习 (MLE) 解答

对数似然函数为
$ ln L(theta) = n ln theta + (theta - 1) sum_(i=1)^n ln x_i $

求导并令其为 0:
$ (dif / (dif theta)) ln L(theta) = n / theta + sum_(i=1)^n ln x_i = 0 $

从中解得 $theta$:
$ n / theta = - sum_(i=1)^n ln x_i $
$ theta = - n / (sum_(i=1)^n ln x_i) $

即为 $theta$ 的极大似然估计值.
$ hat(theta) = - n / (sum_(i=1)^n ln x_i) $

(极大似然估计量为 $hat(Theta) = - n / (sum_(i=1)^n ln X_i)$)

#pagebreak()

// OCR Page 47: Summary
== 四、小结

这一讲, 我们介绍了 #text(fill: blue)[参数点估计], 给出了寻求估计量最常用的 #text(fill: blue)[矩法] 和 #text(fill: blue)[极大似然法].

参数点估计是用一个确定的值去估计未知的参数. 看来似乎精确, 实际上把握不大 (没有提供误差信息).
(引出下一节: 区间估计)
