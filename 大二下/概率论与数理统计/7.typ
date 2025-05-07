#set text(font: "PingFang SC")
+ 设总体服从参数为 λ 的指数分布，求 λ 的矩估计

  对于服从参数为 $lambda$ 的指数分布，其概率密度函数为：

  $ f(x) = lambda e^(-lambda x), quad x >= 0, lambda > 0 $

  矩估计法基于样本矩与总体矩相等。我们需要计算总体的均值（一阶矩），然后用样本均值来估计参数 $lambda$。

  步骤：
  *总体均值（一阶矩）*：
  指数分布的均值是：
  $ E(X) = 1 / lambda $

  *样本均值*：
  假设有样本 $(X_1, X_2, dots.c, X_n)$，样本均值为：
  $ overline(X) = 1 / n sum_(i=1)^n X_i $

  *矩估计*：
  根据矩估计原理，令样本均值等于总体均值：
  $ overline(X) = 1 / lambda $
  解得：
  $ hat(lambda) = 1 / overline(X) $
+ 设总体为 $[0,2theta]$ 上的均匀分布，求参数 $theta$ 的矩估计.

  对于均匀分布 $U(0, theta)$，其概率密度函数为：

  $ f(x; 2theta) = cases(  1/(2theta)\, quad 0 <= x <= theta , 0\, quad "otherwise") $
  均匀分布的均值为：
  $ E(X) = (0 + 2theta) / 2 = theta $
  假设有样本 $(X_1, X_2, dots.c, X_n)$，样本均值为：
  $ overline(X) = 1 / n sum_(i=1)^n X_i $
  根据矩估计原理，令样本均值等于总体均值：
  $ overline(X) = theta $
  解得：
  $ hat(theta) = overline(X) $



+ 给定概率密度函数：
  $
    f(x) = cases(
    1/theta e^(-x/theta)\, quad x >= 0,
    0\, quad "其他"
  )
  $

  这是一个参数为 $theta$ 的指数分布。指数分布的均值为 $E(X) = theta$。样本为 $(X_1, X_2, X_3)$，并给出四个估计量：

  $
    hat(theta)_1 = X_1, quad hat(theta)_2 = (X_1 + X_2) / 2, quad hat(theta)_3 = (X_1 + 2X_2) / 3, quad hat(theta)_4 = overline(X)
  $

  其中 $overline(X) = (X_1 + X_2 + X_3)/3$ 是样本均值。

  需要解决：
  1. 哪个估计量是 $theta$ 的矩估计？
  2. 比较这些估计量的方差和均方误差（MSE）。

  (1) 解：\
  我们已经知道 $E(X) = theta$，因此矩估计是基于样本均值的 $hat(theta)_4$。

  对于给出的估计量，我们首先检查它们是否是无偏估计。

  设 $X_1$, $X_2$, $X_3$ 是独立同分布的，服从参数为 $theta$ 的指数分布。
  对于每个估计量，计算其期望：

  $ E(hat(theta)_1) = E(X_1) = theta $
  $ E(hat(theta)_2) = E((X_1 + X_2) / 2) = (E(X_1) + E(X_2)) / 2 = (theta + theta) / 2 = theta $
  $ E(hat(theta)_3) = E((X_1 + 2X_2) / 3) = (E(X_1) + 2E(X_2)) / 3 = (theta + 2theta) / 3 = theta $
  $ E(hat(theta)_4) = E(overline(X)) = E((X_1 + X_2 + X_3) / 3) = (theta + theta + theta) / 3 = theta $

  因此，所有四个估计量都是无偏估计。
  #box(stroke: 1pt, inset: 5pt, radius: 10pt)[
    *无偏估计*：

    无偏估计意味着估计量的期望值等于被估计参数的真实值。即对于参数 $theta$ 的估计量 $hat(theta)$，有：

    $ E(hat(theta)) = theta $

    无偏性是一个重要的性质，因为它表明估计量在平均意义下不会系统地高估或低估参数的真实值。

    然而，无偏性并不是评判估计量优劣的唯一标准，我们还需要考虑估计量的方差等其他性质。
  ]

  (2) 解：\
  现在我们计算每个估计量的方差和均方误差（MSE）。
  由于指数分布的方差为 $"Var"(X) = theta^2$，且各样本独立，我们有：

  #table(
    columns: 3,
    align: (center, center, center),
    [*估计量*], [*Var*], [*MSE*],
    [$hat(theta)_1$],
    [$"Var"(X_1) = theta^2$],
    [$theta^2$],

    [$hat(theta)_2$],
    [$"Var"((X_1 + X_2)/2) = 1/4 ("Var"(X_1) + "Var"(X_2)) = 1/4 (theta^2 + theta^2) = theta^2 / 2$],
    [$theta^2 / 2$],

    [$hat(theta)_3$],
    [$"Var"((X_1 + 2X_2)/3) = 1/9 ("Var"(X_1) + "Var"(2X_2)) = 1/9 ("Var"(X_1) + 4"Var"(X_2)) = 1/9 (theta^2 + 4theta^2) = 5 theta^2 / 9$],
    [$5 theta^2 / 9$],

    [$hat(theta)_4$],
    [$"Var"(overline(X)) = "Var"((X_1 + X_2 + X_3)/3) = 1/9 ("Var"(X_1) + "Var"(X_2) + "Var"(X_3)) = 1/9 (3 theta^2) = theta^2 / 3$],
    [$theta^2 / 3$],
  )

  由于所有估计量都是无偏的，它们的均方误差等于它们的方差。比较方差（或MSE）：
  $ theta^2 / 3 < theta^2 / 2 < 5 theta^2 / 9 < theta^2 $
  因此，$hat(theta)_4$ 的方差最小，是这些无偏估计量中最好的（最有效的）。
+ 为考察某种高油玉米的含油量，从粮库中随机抽取 20 个样品，每个样品净重 1 千克，加工测得各个样品的含油量(单位 = 克)为  $ 88.5, 92.1, 89.1, 90.5, 92.1, 90.8, 91.4, 92.3, 90.8, 89.9, $
  $ 92.3, 90.2, 92.0, 92.6, 88.3, 92.7, 89.8, 89.6, 90.3, 90.6 $
  假设含油量分布为 $N(mu, sigma^2)$ ，试分如下两种情况求 $mu$ 的置信系数为 0.90 的置信区间 \
  (1)$sigma^2 = 2$. (2)$sigma^2$ 未知.

  *解：*
  首先，计算样本均值 $overline(X)$ 和样本方差 $S^2$。
  样本数据为：
  $ 88.5, 92.1, 89.1, 90.5, 92.1, 90.8, 91.4, 92.3, 90.8, 89.9, $
  $ 92.3, 90.2, 92.0, 92.6, 88.3, 92.7, 89.8, 89.6, 90.3, 90.6 $
  样本量 $n = 20$。

  *样本均值*：
  $ overline(X) = 1/n sum_(i=1)^n X_i = 1/20 (88.5 + ... + 90.6) = 1815.9 / 20 = 90.795 $

  *样本方差*（为情况 (2) 准备）：
  $ S^2 = 1/(n-1) sum_(i=1)^n (X_i - overline(X))^2 $
  $ sum_(i=1)^n (X_i - overline(X))^2 = (88.5 - 90.795)^2 + ... + (90.6 - 90.795)^2 $
  $ sum_(i=1)^n (X_i - overline(X))^2 approx 34.9425 $
  $ S^2 = 34.9425 / (20 - 1) = 34.9425 / 19 approx 1.8391 $
  样本标准差 $S = sqrt(S^2) approx sqrt(1.8391) approx 1.3561$

  置信系数为 $1 - alpha = 0.90$，所以 $alpha = 0.10$，$alpha/2 = 0.05$。

  *(1) $sigma^2 = 2$ (已知方差)*
  此时总体标准差 $sigma = sqrt(2)$。
  $mu$ 的置信区间为：
  $ overline(X) plus.minus z_(alpha/2) sigma / sqrt(n) $
  我们需要查找标准正态分布的分位数 $z_(0.05)$。
  $ z_(0.05) approx 1.645 $
  置信区间为：
  $ 90.795 plus.minus 1.645 * sqrt(2) / sqrt(20) $
  $ 90.795 plus.minus 1.645 * 1 / sqrt(10) $
  $ 90.795 plus.minus 1.645 / 3.162 $
  $ 90.795 plus.minus 0.520 $
  所以，置信区间为 $(90.795 - 0.520, 90.795 + 0.520) = (90.275, 91.315)$。

  *(2) $sigma^2$ 未知*
  此时使用样本标准差 $S$ 估计 $sigma$。
  $mu$ 的置信区间为：
  $ overline(X) plus.minus t_(alpha/2, n-1) S / sqrt(n) $
  我们需要查找 t 分布的分位数 $t_(alpha/2, n-1) = t_(0.05, 19)$。自由度为 $n-1 = 19$。
  $ t_(0.05, 19) approx 1.729 $
  置信区间为：
  $ 90.795 plus.minus 1.729 * 1.3561 / sqrt(20) $
  $ 90.795 plus.minus 1.729 * 1.3561 / 4.4721 $
  $ 90.795 plus.minus 1.729 * 0.3032 $
  $ 90.795 plus.minus 0.524 $
  所以，置信区间为 $(90.795 - 0.524, 90.795 + 0.524) = (90.271, 91.319)$。
  #box(stroke: 1pt, inset: 5pt, radius: 10pt)[
    *解释：*

    这两种情况使用的分布不同，是因为构建置信区间所依赖的统计量及其分布不同：

    1.  *当总体方差 $sigma^2$ 已知时*：
        我们知道样本均值 $overline(X)$ 服从正态分布 $N(mu, sigma^2/n)$。
        因此，标准化后的统计量
        $ Z = (overline(X) - mu) / (sigma / sqrt(n)) $
        服从标准正态分布 $N(0, 1)$。
        由于 $sigma$ 是已知的，我们可以直接使用 $Z$ 统计量和标准正态分布（通常称为 Z 分布）的分位数 $z_(alpha/2)$ 来构造置信区间。

    2.  *当总体方差 $sigma^2$ 未知时*：
        我们无法直接使用 $sigma$。我们需要用样本标准差 $S$ 来估计 $sigma$。
        此时，我们构造的统计量是
        $ T = (overline(X) - mu) / (S / sqrt(n)) $
        这个统计量不再服从标准正态分布，而是服从自由度为 $n-1$ 的 *t 分布*（Student's t-distribution）。
        t 分布考虑了使用样本标准差 $S$ 替代总体标准差 $sigma$ 所带来的额外不确定性。t 分布的形状与标准正态分布相似，但尾部更厚，这意味着在相同的置信水平下，t 分布的分位数 $t_(alpha/2, n-1)$ 通常会比 $z_(alpha/2)$ 更大（尤其是在样本量 $n$ 较小时），从而得到更宽的置信区间，以反映这种不确定性。
        因此，当 $sigma^2$ 未知时，我们必须使用 t 分布的分位数 $t_(alpha/2, n-1)$ 来构造置信区间。

    总结：使用 Z 分布还是 t 分布，关键在于总体方差 $sigma^2$ 是否已知。已知用 Z 分布，未知（需要用样本方差 $S^2$ 估计）用 t 分布。
  ]

