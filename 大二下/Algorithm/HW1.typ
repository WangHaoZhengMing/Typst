// #set text(font:"PingFang SC")
#let problem(num, body) = {
  heading(
    numbering: none,
    outlined: false,
    [Problem #num],
  )
  body
}


#set heading(numbering: none)

#set text(
  font: ("New Computer Modern", "PingFang SC"),
  size: 11pt,
)
#box(
  radius: 6pt,
  stroke: 2pt,
  inset: 1em,
)[
  #align(center)[
    #text(17pt, weight: "bold")[Homework 2]
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: left,
      [*Course*: Algorithm Design and Analysis], [*Due Date*: 2025/3/23],
      [*Instructor*: Lei Li], [*Semester*: Spring 2025],
    )
  ]]

#grid(
  columns: 2,
  gutter: 1fr,
  [*Student Name*: #underline(stroke: 1pt)[王浩然]], [*Student ID*:#underline(stroke: 1pt)[ 231040100116] ],
)
#v(0.5cm)

#let score-table = table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  inset: 8pt,
  align: center,
  [*Problems*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*Total*],
  [Max. Score], [15], [10], [15], [15], [30], [15], [100],
  [Your Score], [], [], [], [], [], [], [],
)
#figure()[
  #score-table
]



- Remark: In each algorithm design problem, you are expected to design the algorithm, pr\ -ove its correctness and show that it achieves the required running time, unless otherwise stated. However, if the running time and/or correctness are easy to see, brief explanations are sufficient. Specifically, you may use the knowledge taught in class without proofs.

#problem(
  1,
  [
    For each pair of functions $f$ and $g$ in the following table, indicate whether $f=O(g)$, $f=Omega(g)$, $f=Theta(g)$, $f=o(g)$ and $f=omega(g)$ respectively. You only need to give a yes/no answer for each question.
    #text(font: "SF Mono")[
    #figure()[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        [problem], [f(n)], [g(n)], [O], [Ω], [Θ], [o], [ω],
        [(1a)], [$3n^2 + 10$], [$5n^2 - 6n$], [*yes*], [*yes*], [*yes*], [*no*], [*no*],
        [(1b)], [$log_(10) n$], [$5 log_2(n) + 3$], [*yes*], [*yes*], [*yes*], [*no*], [*no*],
        [(1c)], [$10n^2 - n$], [$n^2 log n$], [*yes*], [*no*], [*no*], [*yes*], [*no*],
        [(1d)], [$n^2 - 4n^2 + 10$], [$n^2$], [*yes*], [*yes*], [*yes*], [*no*], [*no*],
        [(1e)], [$2^(3n)$], [$7^n$], [*no*], [*yes*], [*no*], [*no*], [*yes*],
        [(1f)], [$n sin(n)$], [1], [*no*], [*yes*], [*no*], [*no*], [*yes*],
      )]]
  ],
)


#problem(
  2,
  [
    Prove $log_2(ceil(n^(3.5))) = Theta(log_(10) n)$, using the definition of the $cal(O)$-notation.
  ],
)
#text(font:("SF Mono","heiti tc"))[1. 首先，我們知道對於任意 $n >= 1$, $n^(3.5) <= ceil(n^(3.5)) <= n^(3.5) + 1$

2. 因此, $log_2(n^(3.5)) <= log_2(ceil(n^(3.5))) <= log_2(n^(3.5) + 1)$

3. 由對數性質: $log_2(n^(3.5)) = 3.5 log_2(n)$

4. 而 $log_2(n)$ 和 $log_(10)(n)$ 的關係為: $log_2(n) = log_2(10) dot log_(10)(n)$

5. 因此: $3.5 log_2(10) dot log_(10)(n) <= log_2(ceil(n^(3.5))) <= 3.5 log_2(10) dot log_(10)(n) + log_2(n^(3.5) + 1)$

6. 所以存在常數 $c_1 = 3.5 log_2(10)$ 和 $c_2 = 4 log_2(10)$，使得當 $n$ 足夠大時：
   $c_1 dot log_(10)(n) <= log_2(ceil(n^(3.5))) <= c_2 dot log_(10)(n)$

7. 由 $Theta$ 的定義，我們證明瞭 $log_2(ceil(n^(3.5))) = Theta(log_(10) n)$



]

#problem(
  3,
  [
    Assume both $f$ and $g$ are asymptotically渐近地 positive functions. Decide if each of the following three statements is true or false. It it is true, prove it; if it is false, give a counter-example.

    (3a) If $f(n) = O(g(n))$, then $f(n)^2 = O(g(n)^2)$.

    (3b) If $f(n) = O(g(n))$, then $2^(f(n)) = O(2^(g(n)))$

    (3c) If $f(n) = O(g(n))$, and $f(n) >= 2$, $g(n) >= 2$ for every $n >= 2$, then $log f(n) = O(log g(n))$.
  ],
)
#text(font: ("New Computer Modern", "PingFang SC"))[
  // 3a
  #heading(level: 3, [#text(fill: blue)[问题 3a]])
  #par(justify: true)[
    *命题*: 若 $f(n) = O(g(n))$，则 $f(n)^2 = O(g(n)^2)$

    *结论*: #text(fill: green.darken(30%))[正确]
  ]
  
  #block(inset: (left: 1em))[
    *证明*:
    - 由 $f(n) = O(g(n))$，存在 $c > 0$ 和 $n_0$ 使得对所有 $n >= n_0$，有 $f(n) <= c dot g(n)$
    - 两边平方：$f(n)^2 <= c^2 dot g(n)^2$
    - 由于 $c^2$ 为常数且 $f,g$ 都是渐近正函数，所以 $f(n)^2 = O(g(n)^2)$
  ]

  // 3b  
  #heading(level: 3, [#text(fill: blue)[问题 3b]])
  #par(justify: true)[
    *命题*: 若 $f(n) = O(g(n))$，则 $2^(f(n)) = O(2^(g(n)))$

    *结论*: #text(fill: red.darken(30%))[错误]
  ]
  
  #block(inset: (left: 1em))[
    *反例*:
    - 令 $f(n) = 2n$ 且 $g(n) = n$
    - 显然 $f(n) = O(g(n))$，因为 $2n = 2 dot n$
    - 但是 $2^(f(n)) = 2^(2n)$ 且 $2^(g(n)) = 2^n$
    - $2^(2n)/2^n = 2^n$ 当 $n -> infinity$ 时趋向无穷
    - 因此不存在常数 $c$ 使得对所有足够大的 $n$ 都有 $2^(2n) <= c dot 2^n$
  ]

  // 3c
  #heading(level: 3, [#text(fill: blue)[问题 3c]]) 
  #par(justify: true)[
    *命题*: 若 $f(n) = O(g(n))$ 且当 $n >= 2$ 时 $f(n),g(n) >= 2$，则 $log f(n) = O(log g(n))$

    *结论*: #text(fill: green.darken(30%))[正确]
  ]
  
  #block(inset: (left: 1em))[
    *证明*:
    - 由 $f(n) = O(g(n))$，存在 $c > 0$ 和 $n_0$ 使得当 $n >= n_0$ 时 $f(n) <= c dot g(n)$
    - 两边取对数：$log f(n) <= log(c dot g(n)) = log c + log g(n)$
    - 因为 $g(n) >= 2$，所以 $log g(n) > 0$
    - 因此 $log f(n) <= log c + log g(n) <= (log c/log 2 + 1) dot log g(n)$
    - 令 $K = 1 + log c/log 2$，则 $log f(n) <= K dot log g(n)$
    - 所以 $log f(n) = O(log g(n))$
  ]
]

#problem(
  4,
  [
    Consider the following Euclidean algorithm for computing the greatest common divisor of two integers $a,b > 0$:

    *Algorithm* 1 $"Euclid"(a,b)$
    ```
    1: while b > 0 do
    2:   t ← b, b ← a mod b, a ← t
    3: return a
    ```

    (4a) Prove that the algorithm terminates in $O(log a)$ iterations.

    (4b) Show that the $O(log a)$ bound is tight. In other words, prove that there exists a constant $c > 0$ such that for every $n_0 > 0$ there exist two integers $a,b$ such that $a > b > n_0$ and $"Euclid"(a,b)$ takes at least $c log a$ iterations to complete.
  ],
)

    *证明*:
    - 设算法的第 $i$ 次迭代开始时的值为 $(a_i, b_i)$
    - 根据欧几里得除法，有 $a_i = q_i b_i + r_i$，其中 $0 <= r_i < b_i$
    - 因此 $a_(i+1) = b_i$，$b_(i+1) = r_i = a_i mod b_i < b_i = a_(i+1)$
    - 所以 $b_(i+1) < a_(i+1)$ 且 $a_(i+1) = b_i < a_i$
    - 可以证明 $b_(i+2) <= a_i/2$（因为若不然，商必为1，余数必大于一半）
    - 因此每两次迭代，数的大小至少减半
    - 所以迭代次数不超过 $2 log_2 a$，即 $O(log a)$


    *证明*:
    - 考虑斐波那契数列 $F_n$：$F_1 = 1$, $F_2 = 1$, $F_(n+2) = F_(n+1) + F_n$
    - 对于任意 $n_0$，取 $k$ 使得 $F_k > n_0$
    - 令 $a = F_(k+1)$，$b = F_k$
    - 则欧几里得算法在这两个数上的执行过程会产生整个斐波那契数列（倒序）
    - 众所周知 $F_n approx (phi^n)/sqrt(5)$，其中 $phi = (1 + sqrt(5))/2$
    - 因此 $log F_n approx n log phi - log sqrt(5)$
    - 所以算法需要 $k$ 次迭代，而 $k approx log_(phi) (a sqrt(5))$
    - 取 $c = 1/(2 log phi)$，则迭代次数至少为 $c log a$
  


#problem(
  5,
  [
    A cycle in an undirected (directed, resp.) graph $G=(V,E)$ is a sequence of $t >= 3$ ($t >= 2$, resp.) distinct vertices $v_1, v_2, ..., v_t$ such that $(v_i,v_(i+1)) in E$ for every $i=1,2,...,t-1$ and $(v_t,v_1) in E$.

    Given a undirected/directed graph $G=(V,E)$ with $n=|V|$ and $m=|E|$ using the linked-list representation, the goal is to design an $O(n+m)$-time algorithm that decides if $G$ contains a cycle, and outputs an arbitrary one if yes.

    There are three sub-problems here:

    (5a) Solve the problem for undirected graphs.

    (5b) Solve the problem for directed graphs using depth-first-search.

    (5c) Solve the problem for directed graphs by extending the topological sort algorithm.
  ],
)

#problem(
  6,
  [
    In class, we mentioned that the cut-vertices of a graph $G=(V,E)$ can be found in $O(n+m)$-time. Your goal is to give the algorithm. For your convenience, a pseudo-code for or a description of the algorithm is sufficient. You will get a full score if your algorithm is correct and has $O(n+m)$ running time.
  ],
)
