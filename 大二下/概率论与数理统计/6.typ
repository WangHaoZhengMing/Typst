#set document(title: "概率论与数理统计作业6")
#set heading(numbering: "1.")
#set text(font: ("New Computer Modern", "pingfang sc"), size: 11pt)
#show heading: set text(font: "Heiti SC")
#set page(margin: 2cm)
#set math.mat(delim: "[")

#align(
  center,
  text(17pt, weight: "bold")[
    概率论与数理统计
    #v(0.4em)
    作业 6
  ],
)

#grid(
  columns: 2,
  gutter: 1fr,
  [*姓名*: #underline(stroke: 1pt)[ ]], [*学号*: #underline(stroke: 1pt)[ ]],
)
#v(1em)

#let proof(body) = {
  [*证明*] + h(1em) + body
}

= 题目
设随机变量 $X_1, X_2, dots.c, X_n$ 是独立同分布的随机变量，期望为 $mu$，方差为 $sigma^2$。求证样本均值 $overline(X)$ 满足：
1. $E(overline(X)) = mu$
2. $"Var"(overline(X)) = sigma^2 / n$

其中，样本均值定义为：$overline(X) = 1/n sum_(i=1)^n X_i$

#text(blue)[
*重要说明：* 在本题中，我们需要区分以下两个期望：
1. $E(X_i)$：单个随机变量的期望，对每个 $i$ 都等于 $mu$
2. $E(overline(X))$：样本均值的期望，是对 $display(1/n sum_(i=1)^n X_i)$ 整体取期望
]

#line(length: 100%)

#proof[
  首先，我们来证明样本均值的期望。注意这里我们要证明的是 $E(overline(X))$，即对样本均值整体取期望：

  $
    E(overline(X)) &= E(1 / n sum_(i=1)^n X_i) \
    &= 1 / n E(sum_(i=1)^n X_i) \
  $

  根据期望的线性性质（期望的可加性），即使随机变量不独立，期望也可以拆分：
  $
    &= 1 / n sum_(i=1)^n E(X_i)
  $

  由于每个 $X_i$ 都是同分布的，它们都有相同的期望 $E(X_i) = mu$：
  $
    &= 1 / n sum_(i=1)^n mu \
    &= 1 / n dot n mu = mu
  $

  注意到虽然最终 $E(overline(X)) = mu = E(X_i)$，但这是通过证明得到的结果，而不是显然的。样本均值的期望等于单个随机变量的期望，这说明样本均值是总体均值的无偏估计。
]

#v(1em)
#proof[
  接下来证明样本均值的方差：

  $
    "Var"(overline(X)) &= "Var"(1 / n sum_(i=1)^n X_i) \
    &= (1 / n)^2 "Var"(sum_(i=1)^n X_i)
  $

  由于 $X_i$ 相互独立，方差具有可加性：
  $
    &= (1 / n)^2 sum_(i=1)^n "Var"(X_i) \
    &= (1 / n)^2 sum_(i=1)^n sigma^2 \
    &= (1 / n)^2 dot n sigma^2 \
    &= sigma^2 / n
  $

  第二个性质也得证。
]

= 样本方差的性质证明

== 题目
设一组独立同分布的随机变量 $X_1, X_2, dots.c, X_n$，每个随机变量的期望为 $mu$，方差为 $sigma^2$。样本方差 $S^2$ 定义为：

$
S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2
$

其中 $overline(X) = 1/n sum_(i=1)^n X_i$ 是样本均值。求证：

1. $S^2$ 可以表示为：
   $
   S^2 = 1/(n-1) [sum_(i=1)^n X_i^2 - n overline(X)^2]
   $

2. $S^2$ 是 $sigma^2$ 的无偏估计：
   $
   E(S^2) = sigma^2
   $

== 解答

#proof[
*第一部分：* 证明 $S^2 = 1/(n-1) [sum_(i=1)^n X_i^2 - n overline(X)^2]$

从样本方差的定义式开始：
$
S^2 &= 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2
$

展开平方项：
$
(X_i - overline(X))^2 = X_i^2 - 2X_i overline(X) + overline(X)^2
$

代入求和式：
$
S^2 &= 1/(n-1) sum_(i=1)^n (X_i^2 - 2X_i overline(X) + overline(X)^2) \
&= 1/(n-1) [sum_(i=1)^n X_i^2 - 2overline(X) sum_(i=1)^n X_i + sum_(i=1)^n overline(X)^2]
$

注意到：
- $sum_(i=1)^n X_i = n overline(X)$（根据样本均值定义）
- $sum_(i=1)^n overline(X)^2 = n overline(X)^2$（$overline(X)^2$ 是常数）

代入上式：
$
S^2 &= 1/(n-1) [sum_(i=1)^n X_i^2 - 2overline(X) (n overline(X)) + n overline(X)^2] \
&= 1/(n-1) [sum_(i=1)^n X_i^2 - 2n overline(X)^2 + n overline(X)^2] \
&= 1/(n-1) [sum_(i=1)^n X_i^2 - n overline(X)^2]
$

第一个性质得证。
]

#v(1em)
#proof[
*第二部分：* 证明 $E(S^2) = sigma^2$

从第一部分得到的等式出发：
$
S^2 = 1/(n-1) [sum_(i=1)^n X_i^2 - n overline(X)^2]
$

对 $S^2$ 取期望：
$
E(S^2) = 1/(n-1) [E(sum_(i=1)^n X_i^2) - n E(overline(X)^2)]
$

考虑每一项：

1) 对于 $E(sum_(i=1)^n X_i^2)$：
   - $E(X_i^2) = "Var"(X_i) + [E(X_i)]^2 = sigma^2 + mu^2$
   - 因此 $E(sum_(i=1)^n X_i^2) = n(sigma^2 + mu^2)$

2) 对于 $E(overline(X)^2)$：
   - $"Var"(overline(X)) = sigma^2/n$ （之前已证）
   - $E(overline(X)) = mu$
   - 所以 $E(overline(X)^2) = "Var"(overline(X)) + [E(overline(X))]^2 = sigma^2/n + mu^2$

代入原式：
$
E(S^2) &= 1/(n-1) [n(sigma^2 + mu^2) - n(sigma^2/n + mu^2)] \
&= 1/(n-1) [n sigma^2 + n mu^2 - sigma^2 - n mu^2] \
&= 1/(n-1) [(n-1)sigma^2] \
&= sigma^2
$

第二个性质得证。
]

= 正态分布的应用：电阻器阻值问题

== 题目
已知某型号电阻器的阻值服从正态分布：
- 均值 $mu = 200$ 欧姆
- 标准差 $sigma = 10$ 欧姆
- 使用了 25 个这样的电阻 ($n = 25$)

求解以下概率：
1. 25 个电阻平均阻值落在 199 到 202 欧姆之间的概率
2. 25 个电阻总阻值不超过 5100 欧姆的概率

#text(blue)[
*分析：* 首先明确我们的随机变量：
- 每个电阻的阻值 $X_i$ 服从正态分布：$X_i tilde N(200, 10^2)$
- 电阻之间相互独立
]

== 解答

#proof[
*第一部分：* 求平均阻值的概率 $P(199 <= overline(X) <= 202)$

令 $X_1, X_2, dots.c, X_25$ 为 25 个电阻的阻值。样本均值：
$
overline(X) = 1/25 sum_(i=1)^25 X_i
$

由正态分布的性质，$overline(X)$ 也服从正态分布：
- 期望：$E(overline(X)) = mu = 200$
- 标准差：$"SD"(overline(X)) = sigma/sqrt(n) = 10/sqrt(25) = 10/5 = 2$

因此 $overline(X) tilde N(200, 2^2)$。

标准化转换为 $Z$ 分数：
$
Z = (overline(X) - E(overline(X)))/"SD"(overline(X)) = (overline(X) - 200)/2
$

计算概率边界：
- 当 $overline(X) = 199$ 时，$Z = (199 - 200)/2 = -0.5$
- 当 $overline(X) = 202$ 时，$Z = (202 - 200)/2 = 1$

所以：
$
P(199 <= overline(X) <= 202) = P(-0.5 <= Z <= 1)
$

查标准正态分布表：
- $P(Z <= 1) = 0.8413$
- $P(Z <= -0.5) = 0.3085$

因此：
$
P(-0.5 <= Z <= 1) = P(Z <= 1) - P(Z <= -0.5) = 0.8413 - 0.3085 = 0.5328
$
]

#v(1em)
#proof[
*第二部分：* 求总阻值的概率 $P(S <= 5100)$

总阻值 $S$ 为所有电阻阻值之和：
$
S = sum_(i=1)^25 X_i
$

由正态分布的可加性，$S$ 也服从正态分布：
- 期望：$E(S) = 25 mu = 25 times 200 = 5000$
- 标准差：$"SD"(S) = sigma sqrt(n) = 10 sqrt(25) = 50$

因此 $S tilde N(5000, 50^2)$

标准化：
$
Z = (S - E(S))/"SD"(S) = (S - 5000)/50
$

当 $S = 5100$ 时：
$
Z = (5100 - 5000)/50 = 2
$

所以：
$
P(S <= 5100) = P(Z <= 2) = 0.9772
$
]

= 正态分布的应用：产业工人月收入分析

== 题目
已知某地产业工人的月收入服从正态分布：
- 均值 $mu = 1.5$ 万元
- 标准差 $sigma = 0.4$ 万元
- 随机调查了 100 个人 ($n = 100$)

求解以下概率：
1. 平均月收入大于 1.6 万元的概率
2. 平均月收入小于 1.2 万元的概率
3. 平均月收入落在区间 [1.4, 1.6] 内的概率

#text(blue)[
*分析：* 首先明确我们的随机变量：
- 每个人的月收入 $X_i$ 服从正态分布：$X_i tilde N(1.5, 0.4^2)$
- 各个工人的收入相互独立
]

== 预备计算

#proof[
令 $X_1, X_2, dots.c, X_100$ 为 100 个人的月收入。样本均值：
$
overline(X) = 1/100 sum_(i=1)^100 X_i
$

由正态分布的性质，$overline(X)$ 也服从正态分布：
- 期望：$E(overline(X)) = mu = 1.5$
- 标准差：$"SD"(overline(X)) = sigma/sqrt(n) = 0.4/sqrt(100) = 0.4/10 = 0.04$

因此 $overline(X) tilde N(1.5, 0.04^2)$

标准化公式：
$
Z = (overline(X) - E(overline(X)))/"SD"(overline(X)) = (overline(X) - 1.5)/0.04
$
]

== 解答

#proof[
*第一部分：* 求平均月收入大于 1.6 万元的概率 $P(overline(X) > 1.6)$

标准化：
$
Z = (1.6 - 1.5)/0.04 = 2.5
$

所以：
$
P(overline(X) > 1.6) = P(Z > 2.5) = 1 - P(Z <= 2.5)
$

查标准正态分布表：$P(Z <= 2.5) = 0.9938$

因此：
$
P(Z > 2.5) = 1 - 0.9938 = 0.0062
$
]

#v(1em)
#proof[
*第二部分：* 求平均月收入小于 1.2 万元的概率 $P(overline(X) < 1.2)$

标准化：
$
Z = (1.2 - 1.5)/0.04 = -7.5
$

所以：
$
P(overline(X) < 1.2) = P(Z < -7.5)
$

由于 $Z = -7.5$ 已经远远偏离均值（超过7个标准差），查表可知这个概率极其接近0
（具体值小于 $10^(-13)$）。
]

#v(1em)
#proof[
*第三部分：* 求平均月收入落在区间 [1.4, 1.6] 内的概率 $P(1.4 <= overline(X) <= 1.6)$

标准化边界：
- 当 $overline(X) = 1.4$ 时，$Z = (1.4 - 1.5)/0.04 = -2.5$
- 当 $overline(X) = 1.6$ 时，$Z = (1.6 - 1.5)/0.04 = 2.5$

所以：
$
P(1.4 <= overline(X) <= 1.6) = P(-2.5 <= Z <= 2.5)
$

$
P(-2.5 <= Z <= 2.5) = P(Z <= 2.5) - P(Z <= -2.5)
$

查表：
- $P(Z <= 2.5) = 0.9938$
- $P(Z <= -2.5) = 1 - P(Z <= 2.5) = 0.0062$

因此：
$
P(-2.5 <= Z <= 2.5) = 0.9938 - 0.0062 = 0.9876
$
]

