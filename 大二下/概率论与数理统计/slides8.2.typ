#import "@preview/touying:0.6.1": *
#import "@preview/lilaq:0.2.0" as lq
#import themes.dewdrop: *
#set text(lang: "zh", font: ("PingFang SC")) // Use a suitable Chinese font
#import "@preview/numbly:0.1.0": numbly

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution, // Footer text
  navigation: "mini-slides", // Or other navigation options
)
#outline-slide()
// Set institution info for the footer
#let s = state("institution", "")
#s.update(institution => [数理统计])

#set par(first-line-indent: 0em) // Often no indent needed in slides
== 1.1 单个正态总体#text(fill: green)[方差已知]的均值检验 

问题: 总体 $X tilde N(mu, sigma^2)$, $sigma^2$ 已知

假设: $H_0: mu = mu_0; space H_1: mu != mu_0$  #text(fill: green)[双边检验]

构造U统计量: #h(1em) $ U = (overline(X) - mu_0) / (sigma / sqrt(n)) ~ N(0, 1) $ #h(1em) (#text(fill: blue)[$H_0$为真的前提下])

由 $ P { abs( (overline(X) - mu_0) / (sigma / sqrt(n)) ) >= u_(alpha/2) } = alpha $ #h(1em) 确定拒绝域 $ abs(U) >= u_(alpha / 2) $

如果统计量的观测值 $ abs(U) = abs( (overline(x) - mu_0) / (sigma / sqrt(n)) ) >= u_(alpha / 2) $

则#text(fill: red)[拒绝]原假设; 否则#text(fill: green)[接受]原假设

=== 例1
由经验知某零件的重量 $X tilde N(mu, sigma^2)$, $mu=15$, $sigma=0.05$; 技术革新后, 抽出6个零件, 测得重量为 (单位: 克) 14.7, 15.1, 14.8, 15.0, 15.2, 14.6. 已知方差不变, 试统计推断, 平均重量是否仍为15克? ($alpha=0.05$)

*解*
#par(first-line-indent: 2em)[
由题意可知: 零件重量 $X tilde N(mu, sigma^2)$, 且技术革新前后的方差不变 $sigma^2 = 0.05^2$. 要求对均值进行检验, 采用U检验法.
]

假设: #h(1em) $ H_0: mu = 15; space H_1: mu != 15 $

构造U统计量, 得 (临界值)

$ u_(alpha/2) = u_(0.025) = 1.96 $

(接上页: $X tilde N(15, 0.05^2)$, $n=6$, $alpha=0.05$)
#align(center)[$H_0: mu=15$ vs $H_1: mu != 15$, $u_(0.025)=1.96$]

而样本均值为 $ overline(x) = (14.7 + 15.1 + 14.8 + 15.0 + 15.2 + 14.6) / 6 = 89.4 / 6 = 14.9 $


故U统计量的观测值为

$ abs(U) = abs( (overline(x) - 15) / (sigma / sqrt(n)) ) = abs( (14.9 - 15) / (0.05 / sqrt(6)) )  = abs( -0.1 / (0.05 / 2.449) ) = abs( -0.1 / 0.0204 ) approx 4.9 $


因为 $4.9 > 1.96$, 即观测值落在#text(fill: red)[拒绝域]内.

所以#text(fill: red)[拒绝]原假设 $H_0$. (即认为平均重量不再是15克)

== 1.2 单个正态总体#text(fill: green)[方差未知]的均值检验 #h(2em) #text(fill: blue)[T检验]

问题: 总体 $X tilde N(mu, sigma^2)$, $sigma^2$ 未知

假设: $H_0: mu = mu_0; space H_1: mu != mu_0$ #h(4em) #text(fill: green)[双边检验]

构造T统计量: #h(1em) $ T = (overline(X) - mu_0) / (S / sqrt(n)) ~ t(n-1) $

由 $ P { abs( (overline(X) - mu_0) / (S / sqrt(n)) ) >= t_(alpha/2)(n-1) } = alpha $

确定拒绝域 $ abs(T) >= t_(alpha / 2)(n-1) $

如果统计量的观测值 $ abs(T) = abs( (overline(x) - mu_0) / (s / sqrt(n)) ) >= t_(alpha / 2)(n-1) $

则#text(fill: red)[拒绝]原假设; 否则#text(fill: green)[接受]原假设

=== 例2
化工厂用自动包装机包装化肥, 每包重量服从正态分布, 额定重量为100公斤. 某日开工后, 为了确定包装机这天的工作是否正常, 随机抽取9袋化肥, 称得平均重量为99.978, #text(fill: blue)[样本]均方差为1.212 (即 $s^2 = 1.212$), 能否认为这天的包装机工作正常? ($alpha=0.1$)

*解*
#par(first-line-indent: 2em)[
由题意可知: 化肥重量 $X tilde N(mu, sigma^2)$, $mu_0 = 100$. 方差未知, 要求对均值进行检验, 采用T检验法.
]

假设: #h(1em) $ H_0: mu = 100; space H_1: mu != 100 $

构造T统计量, 得 (临界值, $alpha/2 = 0.05$, $n-1 = 8$)

#align(center)[$ t_(alpha/2)(n-1) = t_(0.05)(8) = 1.860 $] // Common value, sometimes written as 1.86


(接上页: $X tilde N(mu, sigma^2)$, $mu_0=100$, $n=9$, $overline(x)=99.978$, $s^2=1.212$, $alpha=0.1$)
#align(center)[$H_0: mu=100$ vs $H_1: mu != 100$, $t_(0.05)(8)=1.860$]



而样本均值、#text(fill: blue)[样本标准差]为 $ overline(x) = 99.978 , s = sqrt(1.212) approx 1.101 $


故T统计量的观测值为
#align(center)[
$ abs(T) = abs( (overline(x) - mu) / (s / sqrt(n)) ) = abs( (99.978 - 100) / (1.101 / sqrt(9)) ) $
$ = abs( -0.022 / (1.101 / 3) ) = abs( -0.022 / 0.367 ) approx 0.0599 $
]

因为 $0.0599 < 1.860$, 即观测值落在#text(fill: green)[接受域]内.

所以#text(fill: green)[接受]原假设 $H_0$, 即可认为这天的包装机工作正常.

== 1.3 单个正态总体均值的#text(fill: green)[单边检验]

在实际生产生活中有时候需要检验的问题写成以下的形式, 看来更为合理:

#align(center)[$ H_0: mu = mu_0, space H_1: mu > mu_0 $]

(或 $H_0: mu <= mu_0, space H_1: mu > mu_0$)

取显著性水平为 $alpha$, 现在来求这个问题的拒绝域.

较合理的检验法应是: 若观测值 $overline(x)$ 与 $mu_0$ 的差 $overline(x) - mu_0$ #text(fill: red)[过分大], 即 $overline(x) - mu_0 > k$, 则我们#text(fill: red)[拒绝] $H_0$ 而接受 $H_1$.

因此拒绝域的形式为 $overline(x) - mu_0 >= k$ (或相应的统计量形式, k待定).
#v(100%)
#text(fill: green)[方差已知时] ($H_1: mu > mu_0$)

$ P { (overline(X) - mu_0) / (sigma / sqrt(n)) >= u_alpha } = alpha $
#h(3em) 拒绝域为 $ U >= u_alpha $
#text(fill: green)[方差未知时] ($H_1: mu > mu_0$)
$ P { (overline(X) - mu_0) / (S / sqrt(n)) >= t_alpha(n-1) } = alpha $
#h(3em) 拒绝域为 $ T >= t_alpha(n-1) $

(注: 如果是 $H_1: mu < mu_0$, 拒绝域为 $U <= -u_alpha$ 或 $T <= -t_alpha(n-1)$)
#v(100%)
=== 例3
某种电子元件的寿命 $X$ (以小时计) 服从正态分布, $sigma^2$ 未知, 平均寿命为225小时 ($mu_0=225$). 改进工艺后, 现测得16只元件的寿命如下:
#grid(
    columns: 8, rows: 2, gutter: 15pt,
    [159], [280], [101], [212], [224], [379], [179], [264],
    [222], [362], [168], [250], [149], [260], [485], [170],
)

问是否有理由认为元件的平均寿命提高了 (取显著性水平为0.05) ?

#slide[
  *解*: 按题意需检验
  #align(center)[$ H_0: mu = 225, space H_1: mu > 225 $]
  
  取 $alpha = 0.05$. 由公式知#text(fill: green)[右边]检验问题的拒绝域为
  #align(center)[$ t = (overline(x) - mu_0) / (s / sqrt(n)) >= t_alpha(n-1) $]
  
  现在 $n=16$, $t_alpha(n-1) = t_(0.05)(15) = 1.753$.
  
  又算得 (根据P10数据): $overline(x) = 241.5$, $s = 98.7259$.
  
  即得
  #align(center)[$ t = (241.5 - 225) / (98.7259 / sqrt(16)) = 16.5 / (98.7259 / 4) = 16.5 / 24.68 approx 0.6685 $]
  
  $0.6685 < 1.753$.
  
  t 不落在拒绝域, 故#text(fill: green)[接受] $H_0$, 即认为元件的平均寿命#text(fill: red)[没有提高].
]

== 2、单个正态总体方差的假设检验

设总体 $X tilde N(mu, sigma^2)$, $mu, sigma^2$ 均属未知.

$x_1, x_2, ..., x_n$ 是来自X的样本, 要求检验假设 (显著性水平为 $alpha$ ):

#align(center)[$ H_0: sigma^2 = sigma_0^2, space H_1: sigma^2 != sigma_0^2 $]

$sigma_0^2$ 为已知常数.

由于 $s^2$ 是 $sigma^2$ 的无偏估计, 当 $H_0$ 为真时, 比值
#align(center)[$ s^2 / sigma_0^2 $]
一般来说应在1附近摆动, 而不应过分大于1 或过分小于1.

由于当 $H_0$ 为真时, $(n-1)s^2 / sigma_0^2 ~ chi^2(n-1)$.

我们取
#align(center)[$ chi^2 = ((n-1) S^2) / sigma_0^2 $]
作为检验统计量.

如上所说, 知道上述检验问题的拒绝域具有以下的形式:

#align(center)[
$ chi^2 = ((n-1) s^2) / sigma_0^2 <= k_1 quad "或" quad chi^2 = ((n-1) s^2) / sigma_0^2 >= k_2 $
]

习惯上取 (双边等尾)
#align(center)[
$ k_1 = chi^2_(1 - alpha/2)(n-1), space k_2 = chi^2_(alpha/2)(n-1) $
]

于是得拒绝域为
#align(center)[
$ ((n-1) S^2) / sigma_0^2 <= chi^2_(1 - alpha/2)(n-1) quad "或" quad ((n-1) S^2) / sigma_0^2 >= chi^2_(alpha/2)(n-1) $
]

上述检验法为 #text(fill: blue)[$chi^2$ 检验法].

关于方差的#text(fill: green)[单边检验法]得到的拒绝域已在 (8.3.3) 中给出.
#v(100%)
=== 例4
某厂生产的某种型号的电池, 其寿命长期以来服从方差 $sigma^2 = 5000$ $小 时^2$ 的正态分布. 现有一批这种电池, 从它的生产情况来看, 寿命的波动性有所改变. 现随机取26只电池, 测出其寿命的样本方差 $s^2 = 9200$ $小 时^2$. 问根据这一数据能否推断这批电池的寿命的波动性较以往的有显著的变化 (取 $alpha = 0.02$) ?

*解*: $ H_0: sigma^2 = sigma_0^2 = 5000, space H_1: sigma^2 != 5000 $

拒绝域为
#align(center)[
$ ((n-1) S^2) / sigma_0^2 <= chi^2_(1 - alpha/2)(n-1) quad "或" quad ((n-1) S^2) / sigma_0^2 >= chi^2_(alpha/2)(n-1) $
]

$ alpha = 0.02, n = 26$. $n-1=25$. $alpha/2 = 0.01$. $1-alpha/2 = 0.99$.
#v(0.5em)
查表: $chi^2_(0.99)(25) = 11.524$, $chi^2_(0.01)(25) = 44.314$

由观察值 $s^2 = 9200$ 得检验统计量的值:
#align(center)[
$ chi^2 = ((n-1) s^2) / sigma_0^2 = (25 times 9200) / 5000 = 230000 / 5000 = 46 $
]

$ 46 > 44.314 $ #h(1em) (#text(fill: red)[落在右侧拒绝域])

以#text(fill: red)[拒绝] $H_0$, 认为这批电池寿命波动性较以往的有显著的变化.

== 三、小结

在这一节中我们学习了正态总体均值和方差 的检验法, 有以下两种: #text(fill: green)[单侧检验] 以及 #text(fill: green)[双侧检验].

- 均值检验:
  - $sigma^2$ 已知: U检验
  - $sigma^2$ 未知: T检验
- 方差检验:
  - $chi^2$ 检验

选择单侧或双侧取决于具体问题和备择假设 $H_1$.

== 四、课堂练习

1) 设某产品的某项质量指标服从正态分布, 已知它的标准差为150. 现从一批产品中 随机抽取了26个, 测得该项指标的平均值为 1637. 问能否认为这批产品的该项指标值为 1600 (显著性水平为 0.05) ?

*解* (练习1)
由题意需检验 $ H_0: mu = 1600, space H_1: mu != 1600 $

拒绝域为 (双边U检验): $ abs(Z) >= z_(alpha/2) $

已知 $n=26$, $overline(x)=1637$, $sigma=150$, $alpha=0.05$.
#v(0.5em)
临界值 $z_(alpha/2) = z_(0.025) = 1.96$.

计算检验统计量的值:
#align(center)[
$ abs(Z) = abs( (overline(x) - mu_0) / (sigma / sqrt(n)) ) = abs( (1637 - 1600) / (150 / sqrt(26)) )  = abs( 37 / (150 / 5.099) ) = abs( 37 / 29.417 ) approx 1.258 $
]

$1.258 < 1.96$.

#text(fill: green)[接受]假设 $H_0$. 能认为该项指标值为 1600.

== 四、课堂练习 (2)

2) 某台机器加工某种零件, 规定零件长度为100cm. 每天定时检查机器运行情况, 某日抽取10个零件, 测得平均长度为101cm, 样本标准差为2cm. 设加工的零件长度服从正态分布, 问该日机器工作是否正常 (显著性水平取 0.05) ?

*解* (练习2)
已知 $overline(x) = 101, n = 10, s = 2, alpha = 0.05$.

由题意需检验 $ H_0: mu = 100, space H_1: mu != 100 $

拒绝域为 (双边T检验): $ abs(t) >= t_(alpha/2)(n-1) $

$n-1=9$. 临界值 $t_(alpha/2)(n-1) = t_(0.025)(9) = 2.262$.

计算检验统计量的值:
#align(center)[
$ abs(t) = abs( (overline(x) - 100) / (s / sqrt(n)) ) = abs( (101 - 100) / (2 / sqrt(10)) )  = abs( 1 / (2 / 3.162) ) = abs( 1 / 0.632 ) approx 1.58 $ // Corrected calculation
]

$1.58 < 2.262$.

#text(fill: green)[接受] $H_0$. (认为机器工作正常)

== 作业
#v(2em)
P173 习题八 8.2, 8.8