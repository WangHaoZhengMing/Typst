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
    #figure()[
      #table(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        [problem], [f(n)], [g(n)], [O], [Ω], [Θ], [o], [ω],
        [(1a)], [$3n^2 + 10$], [$5n^2 - 6n$], [], [], [], [], [],
        [(1b)], [$log_(10) n$], [$5 log_2(n) + 3$], [], [], [], [], [],
        [(1c)], [$10n^2 - n$], [$n^2 log n$], [], [], [], [], [],
        [(1d)], [$n^2 - 4n^2 + 10$], [$n^2$], [], [], [], [], [],
        [(1e)], [$2^(3n)$], [$7^n$], [], [], [], [], [],
        [(1f)], [$n sin(n)$], [1], [], [], [], [], [],
      )]
  ],
)


#problem(
  2,
  [
    Prove $log_2(ceil(n^(3.5))) = Theta(log_(10) n)$, using the definition of the $cal(O)$-notation.
  ],
)

#problem(
  3,
  [
    Assume both $f$ and $g$ are asymptotically positive functions. Decide if each of the following three statements is true or false. It it is true, prove it; if it is false, give a counterexample.

    (3a) If $f(n) = O(g(n))$, then $f(n)^2 = O(g(n)^2)$.

    (3b) If $f(n) = O(g(n))$, then $2^(f(n)) = O(2^(g(n)))$

    (3c) If $f(n) = O(g(n))$, and $f(n) >= 2$, $g(n) >= 2$ for every $n >= 2$, then $log f(n) = O(log g(n))$.
  ],
)

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
