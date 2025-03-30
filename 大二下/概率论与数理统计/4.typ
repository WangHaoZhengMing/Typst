#set text(font: "pingfang sc")
#set page(paper: "a4", margin: (x: 1.8cm, y: 1.8cm))
#set math.equation(numbering: "(1)")
+ 设从学校乘汽车到火车站的途中有 3 个交通岗，在各交通岗遇到红灯是相互独立的，其概率均为 0.4。求途中遇到红灯次数的期望。

  设在途中遇到红灯的次数为随机变量 $X$。因为每个交通岗遇到红灯是相互独立的，且概率相同，所以 X 服从参数为 $n=3, p=0.4$ 的二项分布，即：

  $ X ~ B(3, 0.4) $

  根据二项分布的期望公式：
  $E(X) = n p = 3 × 0.4 = 1.2$

  途中遇到红灯次数的期望为 1.2 次。
+ 某地抽样调查结果表明，考生的外语成绩 $X$ (百分制)近似服从正态分布，平均成绩为 72 分， 96 分以上的考生占考生总数的 $2.3%$. 求考生外语成绩在 60 分至 84 分之间的概率.

  我们已知考生的外语成绩 $X$ 近似服从正态分布，均值为 $mu = 72$，且
  $P \( X > 96 \) = 0.023$。需要求的是
  $P \( 60 lt.eq X lt.eq 84 \)$。由于正态分布的性质，我们需要先确定标准差
  $sigma$，然后利用标准正态分布表计算概率。

  - 步骤 1：确定标准差 $sigma$
  根据题目，$P \( X > 96 \) = 0.023$。将其转化为标准正态变量
  $Z = frac(X - mu, sigma)$，我们有：
  $ P (Z > frac(96 - 72, sigma)) = P (Z > 24 / sigma) = 0.023 $
  在标准正态分布中，$P \( Z > z \) = 0.023$ 对应的 $z$
  值可以通过查表得到。标准正态分布表显示，$P \( Z > 1.995 \) approx 0.023$（更精确的值是
  $z approx 2$ 时 $P \( Z > 2 \) = 0.0228$，但我们取 $z = 1.995$
  作为近似）。因此： $ 24 / sigma = 1.995 $ 解得：
  $ sigma = 24 / 1.995 approx 12.03 $ 为简化计算，假设 $z = 2$（因为
  $0.0228 approx 0.023$ 在实际应用中常取近似），则：
  $ sigma = 24 / 2 = 12 $ 我们采用 $sigma = 12$
  进行后续计算，因为它与题目条件非常接近，且便于手算。

  - 步骤 2：计算 $P \( 60 lt.eq X lt.eq 84 \)$ 将 $X = 60$ 和 $X = 84$ 转化为标准正态变量：
    - 当 $X = 60$ 时：
    $ Z = frac(60 - 72, sigma) = frac(- 12, 12) = - 1 $
    - 当 $X = 84$ 时：
    $ Z = frac(84 - 72, sigma) = 12 / 12 = 1 $ 因此：
  $ P \( 60 lt.eq X lt.eq 84 \) = P \( - 1 lt.eq Z lt.eq 1 \) $
  由于正态分布的对称性：
  $
    P \( - 1 lt.eq Z lt.eq 1 \) = P \( Z lt.eq 1 \) - P \( Z < - 1 \) = P \( Z lt.eq 1 \) - \( 1 - P \( Z lt.eq 1 \) \) = 2 P \( Z lt.eq 1 \) - 1
  $
  查标准正态分布表，$P \( Z lt.eq 1 \) = 0.8413$，所以：
  $ P \( - 1 lt.eq Z lt.eq 1 \) = 2 times 0.8413 - 1 = 1.6826 - 1 = 0.6826 $

  - 考生外语成绩在 60 分至 84 分之间的概率约为：
  $ #box(stroke: black, inset: 3pt, [$0.6826$]) $
+ 设随机变量 $X$ 的概率密度函数为 $ f(x)=cases(
  e^(-x)\,x>0,space 0\,space space x<=0
) $ 分别求 $Y=2X$ 的期望和 $Y=e^(-2x)$ 的期望.

  对于 $Y=2X$，由期望的数乘性质可得：
  $ E(Y) = E(2X) = 2E(X) $
  原随机变量的期望为：
  $ E(X) = integral_(0)^(+oo) x e^(-x) dif x = integral_(0)^(+oo) x e^(-x) dif x = 1 $
  因此 $E(Y) = 2$

  对于 $Y=e^(-2x)$，由定义：
  $
    E(Y) = E(e^(-2x)) = integral_(0)^(+oo) e^(-2x) e^(-x) dif x = integral_(0)^(+oo) e^(-3x) dif x = [-1 / 3 e^(-3x)]_(0)^(+oo) = 1 / 3
  $
+ 设二维随机向量 $(X， Y)$ 服从圆域 $D = {(x, y) : x^2 + y^2 <= R^2}$ 上的均匀分布，求 $E(sqrt(X^2+Y^2)) $

  我们需要计算二维随机向量 $(X, Y)$ 在圆域 $D = {(x, y) : x^2 + y^2 <= R^2}$ 上均匀分布时的期望 $E(sqrt(X^2 + Y^2))$。
  这里 $sqrt(X^2 + Y^2)$ 表示点 $(X, Y)$ 到原点的距离，即随机变量的径向长度。以下逐步推导：

  - 步骤 1：理解均匀分布和概率密度函数
    由于 $(X, Y)$ 在圆域 $D$ 上均匀分布，圆的面积为 $pi R^2$。均匀分布的概率密度函数 (PDF) 为：
    $
      f_(X,Y)(x,y) = cases(
      1/(pi R^2) \, & x^2 + y^2 <= R^2,
      0 & "otherwise"
    )
    $

  - 步骤 2：计算期望
    设 $Z = sqrt(X^2 + Y^2)$，$Z$ 的取值范围是 $[0, R]$。
    根据期望的定义：
    $
      E(sqrt(X^2 + Y^2)) = E(Z) = integral_D sqrt(x^2 + y^2) f(x,y) dif x dif y
    $

  - 步骤 3：极坐标转换
    令 $x = r cos theta$，$y = r sin theta$
    则 $x^2 + y^2 = r^2$，$dif x dif y = r dif r dif theta$
    积分区域转换为 $0 <= r <= R$，$0 <= theta <= 2pi$
    $
      E(Z) &= integral_0^(2pi) integral_0^R sqrt(r^2) (1) / (pi R^2) r dif r dif theta \
      &= 1 / (pi R^2) integral_0^(2pi) integral_0^R r^2 dif r dif theta \
      &= 1 / (pi R^2) integral_0^(2pi) [r^3 / 3]_0^R dif theta \
      &= 1 / (pi R^2) integral_0^(2pi) R^3 / 3 dif theta \
      &= R / (3pi) integral_0^(2pi) dif theta \
      &= R / (3pi) [2pi] \
      &= 2R / 3
    $

  因此，$ E(sqrt(X^2 + Y^2)) = #box(stroke: black, inset: 3pt, [$2R/3$]) $
+ 设二维随机向量 $(X， Y)$ 的概率密度函数$ f(x,y) = cases(
  (1+x y)/4 \,& -1<x<1\, -1<y<1,
  0\, & "其它"
) $ 求 $V a r(X)$ 和 $V a r(Y)$.

  要求 $V a r(X) 和 V a r(Y)$，需要分别计算 $E(X), E(X^2), E(Y), E(Y^2)$，然后使用公式$ V a r(X) = E(X^2) - [E(X)]^2$
  $ V a r(X) = E[(X - E[X])^2] = E[X^2] - (E[X])^2 $
  首先求 $E(X)$:
  $
    E(X) &= integral_(-1)^1 integral_(-1)^1 x (1+x y) / 4 dif y dif x \
    &= 1 / 4 integral_(-1)^1 x [y + x y^2 / 2]_(-1)^1 dif x \
    &= 1 / 4 integral_(-1)^1 x (2) dif x \
    &= 1 / 4 [x^2]_(-1)^1 = 0
  $

  类似地，由对称性可知 E(Y) = 0

  接下来求 $E(X^2)$:
  $
    E(X^2) &= integral_(-1)^1 integral_(-1)^1 x^2 (1+x y) / 4 dif y dif x \
    &= 1 / 4 integral_(-1)^1 x^2 [y + x y^2 / 2]_(-1)^1 dif x \
    &= 1 / 4 integral_(-1)^1 x^2 (2) dif x \
    &= 1 / 2 [x^3 / 3]_(-1)^1 = 1 / 3
  $

  同样由对称性，$E(Y^2) = 1/3$

  因此：
  $ V a r(X) = E(X^2) - [E(X)]^2 = 1 / 3 - 0 = 1 / 3 $
  $ V a r(Y) = E(Y^2) - [E(Y)]^2 = 1 / 3 - 0 = 1 / 3 $

  所以：$ V a r(X) = V a r(Y) = #box(stroke: black, inset: 3pt, [$1/3$]) $
+ 设二维随机向量 $(X， Y)$ 的概率密度函数为$ f(x,y) = cases(
  e^(-(x+y))\,&x>0\,y>0,
  0\,&"其它"\,
  ) $求 $C o v(X,Y)$ 和 $rho_(X Y)$

  $ C o v(X,Y) = E[(X - E[X])(Y - E[Y])] = E[X Y] - E[X]E[Y] $

  首先计算 $E[X]$：
  $
    E[X] &= integral_0^(+oo) integral_0^(+oo) x e^(-(x+y)) dif y dif x \
    &= integral_0^(+oo) x e^(-x) [- e^(-y)]_0^(+oo) dif x \
    &= integral_0^(+oo) x e^(-x) dif x = 1
  $

  由对称性，$E[Y] = 1$

  计算 $E[X Y]$：
  $
    E[X Y] &= integral_0^(+oo) integral_0^(+oo) x y e^(-(x+y)) dif y dif x \
    &= integral_0^(+oo) x e^(-x) (integral_0^(+oo) y e^(-y) dif y) dif x \
    &= integral_0^(+oo) x e^(-x) dif x × integral_0^(+oo) y e^(-y) dif y \
    &= 1 × 1 = 1
  $

  因此：
  $ C o v(X,Y) = E[X Y] - E[X]E[Y] = 1 - 1 × 1 = 0 $

  相关系数：
  $ rho_(X Y) = (C o v(X,Y))/(sqrt(V a r(X)V a r(Y))) = 0 $

  答案为：$ C o v(X,Y) = #box(stroke: black, inset: 3pt, [0]) $$ rho_(X Y) = #box(stroke: black, inset: 3pt, [0]) $
+ 设 $V a r(X) = 25, V a r(Y) = 36, rho_(X Y) = 0.4$，求 $V a r(X + Y)$ 和 $V a r(X - Y)$

  由方差公式：
  $ V a r(X plus.minus Y) = V a r(X) + V a r(Y) plus.minus 2C o v(X,Y) $

  已知 $C o v(X,Y) = rho_(X Y) sqrt(V a r(X)V a r(Y)) = 0.4 sqrt(25 × 36) = 12$

  所以：
  $ V a r(X + Y) = 25 + 36 + 2 × 12 = #box(stroke: black, inset: 3pt, [85]) $
  $ V a r(X - Y) = 25 + 36 - 2 × 12 = #box(stroke: black, inset: 3pt, [37]) $
