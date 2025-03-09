#import "temple.typ": *
#import "@preview/cetz:0.3.1": *
#import "@preview/cetz-plot:0.1.0": plot
#import "@preview/cetz-venn:0.1.3"
#set page(fill: white)

#let C(x, y) = $C^#y _#x$
#let vphantom(body) = hide(context {
  let width = measure(body).width
  body
  h(-width)
})
#set text(
  font: ( "PingFang SC"),
  // size: 10.5pt,
  // fill: dark_gray,
  // spacing: 130%,
)
#question_counter.update(1)

#problem("1.8")[
  设 $A，B，C$ 为事件，且 $P(A) = 0.2, P(B) = 0.3, P(C) = 0.5, P(A B) = 0, P(A C) = 0.1, P(B C) = 0.2$，求事件 $A，B，C$ 中至少有一个发生的概率.
]
#solution[
  我们设 $P(Q)$ 是 $A, B, C$ "至少有一个发生"的概率,
  利用概率的加法公式求解 $P(Q)$：
  $
    P(Q) &= P(A union B union C) \
    &= P(A) + P(B) + P(C) - P(A inter B) - P(A inter C) - P(B inter C) + P(A inter B inter C)
  $

  根据题目条件：
  $ P(A inter B) = 0 $
  $ P(A inter C) = 0.1 $
  $ P(B inter C) = 0.2 $

  还需要求 $P(A inter B inter C)$. 由于 $P(A inter B) = 0$，所以 $A$ 与 $B$ 不相容，因此：
  $ P(A inter B inter C) = 0 $

  代入计算：
  $ P(Q) = 0.2 + 0.3 + 0.5 - 0 - 0.1 - 0.2 + 0 = 0.7 $

  因此，事件 A，B，C 中至少有一个发生的概率为 0.7
]

#problem("1.9")[
  计算下列各题:
  #set enum(numbering: "(1)")
  + 设 $P(A) = 0.5, P(B) = 0.3, P(A union B) = 0.6, 求 P(A overline(B))$;
  + 设 $P(A) = 0.8, P(A -B)= 0.4, 求 P(overline(A B))$;
  + 设 $P(A B) = P(overline(A) #h(0.1em) overline(vphantom(A) B)),P(A) =0.3 ,求 P(B)$
]
#solution[
  #set enum(numbering: "(1)")
  + 画出维恩图，根据题意，我们有：
    #grid(
      columns: (60%, 40%),
      gutter: 10pt,
      [$ P(A) = 0.5, P(B) = 0.3, P(A union B) = 0.6 $
        由维恩图可知：
        $ P(A union B) = P(A) + P(B) - P(A inter B) $
        $ P(A inter B) = P(A) + P(B) - P(A union B) = 0.2 $
        $ P(A overline(B)) = P(A) - P(A inter B) = 0.3 $],
      [#canvas({
          cetz-venn.venn2(
            name: "venn",
            a-fill: gray,
            ab-fill: gray,
            not-ab-fill: light_blue,
          )
        })],
    )
    　です
  + 画出维恩图，根据题意，我们有：
    #grid(
      columns: (60%, 40%),
      gutter: 10pt,
      [$ P(A) = 0.8, P(A -B)= 0.4 $
        由维恩图可知：
        $ P(A -B) = P(A) - P(A inter B) = 0.4 $
        $ P(A inter B) = P(A) - P(A -B) = 0.4 $
        $ P(overline(A B)) = 1 - P(A inter B) = 0.6 $],
      [#canvas({
          cetz-venn.venn2(
            name: "venn",
            a-fill: gray,
            not-ab-fill: light_blue,
          )
        })],
    )
  + 我们使用公式:
    $ P(overline(A)) = 1-P(A)=0.7 $
    使用 Venn 图我们可以理解:
    $ P(overline(A) inter overline(B))= 1 - P(A union B) $
    由题意知:
    $ underline(P(A inter B) = P(overline(A) inter overline(B)))= 1- P(A union B) $
    由并集的概率公式:
    $ P(A union B)=P(A)+P(B)-P(A inter B) $
    代入计算:
    $ P(A union B)=0.3+P(B)-0.3=0.7 $
]

#problem("")[
  设 $A，B$ 为事件，且 $P(A) = 0.6, P(B) = 0.4, P(A|B) = 0.5$，计算下面两式:
  #set enum(numbering: "(1)")
  + $P(A union B)$
  + $P(overline(A) union B)$
]
#solution[
  #set enum(numbering: "(1)")
  + 由条件概率的定义:
  $ P(A|B)= P(A B) / P(B) = P(A inter B) / 0.4 = 0.5 $
  $ P(A union B)=A + B - P(A inter B)= 0.8 $
  #grid(
    columns: (60%, 40%),
    gutter: 10pt,
    [(2) 由 Venn 可得:

      图中的阴影部分为所求的量
      $ 1-(P(A)-P(A inter B))=0.8 $],
    [#canvas({
        draw.scale(0.76)
        cetz-venn.venn2(
          name: "venn",
          a-fill: gray,
          not-ab-fill: gray,
        )
      })],
  )
]

#problem("")[
  设 $A，B$ 为事件，$P(B)= 1/3, P(overline(A)|overline(B))=1/4, P(overline(A)|B)=1/5,$计算 (1) $P(A B)$ (2) $P(A)$.
]
#solution[
  // $ P(overline(A)inter overline(B))=1/6 space, P(overline(A)inter B)=1/15 $
  #grid(
    columns: (60%, 40%),
    gutter: 10pt,
    [(1) 由条件概率的定义:
      $ P(overline(A)|overline(B))=P(overline(A) inter overline(B)) / P(overline(B))=1 / 4 $
      $ P(overline(A) inter overline(B))=1 / 6 $
      $ P(overline(A) inter B)=1 / 15 $
      $ P(overline(A) inter overline(B))= 1-[P(A)+ P(B)-P(A)inter P(B)] $
      $ P(overline(A)inter B )= P(B)-P(A)inter P(B) $
      两式结合:
      $ P(A inter B)=4 / 15 $
      $ P(A) = 5 / 6 -1 / 15 $
    ],
    [
      #canvas({
        // h(4cm)
        draw.scale(0.76)
        cetz-venn.venn2(
          name: "venn",
          a-fill: gray,
          not-ab-fill: gray,
        )
      })],
  )
]

#problem("")[
  设男女两性人口之比为 $51 : 49$ ， 男性中的 $5%$ 是色盲患者，女性中的 $2.5%$ 是色盲
  患者.今从人群中随机地抽取一人，恰好是色盲患者，求此人为男性的概率.
]
#solution[
  设事件 $A$ 为男性，事件 $B$ 为色盲患者，求 $P(A|B)$.
  由题意：
  设男生人数为 $51x$，女生人数为 $49x$，则男生色盲人数为 $0.05 times 51x$，女生色盲人数为 $0.025 times 49x$.
  可以得到：
  $ P = (51x times 5%) / (51.5%+49x times 2.5%) approx 67.6757% $
]

// #pagebreak()
#problem("")[
  在四次独立试验中，事件 $A$ 至少发生一次的概率为 $0.5904$ ， 求在三次独立试验中，
  事件 A 发生一次的概率.
]
#solution[
设事件 $A$ 在单次试验中发生的概率为 $p$，那么事件 $A$ 不发生的概率为
$1 - p$。

在四次独立试验中，事件 $A$ 一次也不发生的概率是：
$ P (upright("一次也不发生")) = (1 - p)^4 $ 而事件 $A$
至少发生一次的概率是补事件的概率：
$ P (upright("至少一次")) = 1 - P (upright("一次也不发生")) = 1 - (1 - p)^4 $
根据题目，已知 $P (upright("至少一次")) = 0.5904$，所以：
$ 1 - (1 - p)^4 = 0.5904 $

所以： $ 1 - p = 0.8 $ $ p = 1 - 0.8 = 0.2 $ 因此，事件 $A$
在单次试验中发生的概率为 $p = 0.2$。

在三次独立试验中，事件 $A$ 发生一次的概率：

二项分布的概率公式为： $ P (X = k) = #C("n","k") p^k (1 - p)^(n - k) $
这里 $n = 3$，$k = 1$，$p = 0.2$：
$ P (X = 1) = binom(3, 1) (0.2)^1 (1 - 0.2)^(3 - 1) $ 
代入： $ P (X = 1) = 3 times 0.2 times 0.64 = 0.6 times 0.64 = 0.384 $

  
]
