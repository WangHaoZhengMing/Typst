// Set document properties
#set document(
  title: "Master Theorem: A Powerful Tool for Analyzing Recurrences",
  author: "AI Assistant",
  // date: datetime.today().display("[day] [month repr:long] [year]")
)
#set text(size: 14pt, lang: "en") // Set language for potential hyphenation rules

// Import math functions if needed (basic ones work without)
// #import std.math: *

// Main title
#heading(level: 1)[Master Theorem: A Powerful Tool for Analyzing Recurrences]

// Introduction
The Master Theorem provides a "cookbook" method for determining the asymptotic time complexity (using Big O, Big Omega, or Big Theta notation) of recurrence relations that arise frequently in the analysis of divide-and-conquer algorithms. These recurrences typically take the form:

$ [ T(n) = a T(n/b) + f(n) ] $

where:
- $n$ is the size of the problem.
- $a >= 1$ is the number of subproblems generated in each recursive step.
- $n/b$ is the size of each subproblem, assuming for simplicity that $n$ is a power of $b$. Here, $b > 1$.
- $f(n)$ represents the cost of the work done outside the recursive calls. This includes the cost of dividing the problem into subproblems and the cost of combining the solutions of the subproblems. $f(n)$ must be an asymptotically positive function.

The theorem works by comparing the function $f(n)$ (the cost of the work at each level) with the function $n^(log_b a)$ (which relates to the number of leaves in the recursion tree). The result of this comparison determines which part of the algorithm dominates the overall complexity.

// Statement of the Theorem
#heading(level: 2)[The Theorem]

Let $T(n)$ be defined by the recurrence $T(n) = a T(n/b) + f(n)$, where $a >= 1$, $b > 1$ are constants, and $f(n)$ is an asymptotically渐近地 positive function. We compare $f(n)$ with $n^(log_b a)$. There are three cases:

1.  *Case 1:* If $f(n) = O(n^(log_b a - epsilon))$ for some constant $epsilon > 0$, then $T(n) = Theta(n^(log_b a))$.
    #parbreak()
    _Interpretation:_ The cost is dominated by the work done at the leaves of the recursion tree. The growth rate of $f(n)$ is polynomially slower than $n^(log_b a)$.

2.  *Case 2:* If $f(n) = Theta(n^(log_b a))$, then $T(n) = Theta(n^(log_b a) log n)$.
    #parbreak()
    _Interpretation:_ The cost is roughly the same at each level of the recursion tree. The total cost is the cost at one level times the number of levels (which is logarithmic).
    #parbreak()
    *Extended Case 2:* If $f(n) = Theta(n^(log_b a) log^k n)$ for some constant $k >= 0$, then $T(n) = Theta(n^(log_b a) log^(k+1) n)$. The basic Case 2 corresponds to $k=0$.

3.  *Case 3:* If $f(n) = Omega(n^(log_b a + epsilon))$ for some constant $epsilon > 0$, *and* if the *regularity condition* $a f(n/b) <= c f(n)$ holds for some constant $c < 1$ and all sufficiently large $n$, then $T(n) = Theta(f(n))$.
    #parbreak()
    _Interpretation:_ The cost is dominated by the work done at the root (or the initial calls) of the recursion tree. The growth rate of $f(n)$ is polynomially faster than $n^(log_b a)$, and the cost decreases sufficiently rapidly down the tree (regularity condition).

*Important Note:* The $epsilon$ in Cases 1 and 3 is crucial. It signifies that $f(n)$ must be *polynomially* smaller (Case 1) or *polynomially* larger (Case 3) than $n^(log_b a)$. There are gaps between the cases where the theorem, in its basic form, does not apply (e.g., if $f(n)$ is larger, but not polynomially larger).

// Examples
#heading(level: 2)[Examples]

Let's apply the Master Theorem to some common recurrences.

#heading(level: 3)[Example 1: Case 1 (Leaf Dominated)]
Consider the recurrence $T(n) = 8 T(n/2) + n^2$.
- Here, $a = 8$, $b =2$, and $f(n) = n^2$. 
- We calculate the critical exponent: $log_b a = log_2 8 = 3$.
- The critical function is $n^(log_b a) = n^3$.
- We compare $f(n) = n^2$ with $n^3$.
- We need to check if $f(n) = O(n^(log_b a - epsilon))$. Is $n^2 = O(n^(3 - epsilon))$ for some $epsilon > 0$?
- Yes, we can choose $epsilon = 1$. Since $n^2 = O(n^(3-1)) = O(n^2)$, the condition holds.
- Therefore, by Case 1, $T(n) = Theta(n^(log_b a)) = Theta(n^3)$.

#heading(level: 3)[Example 2: Case 2 (Balanced)]
Consider the recurrence for Merge Sort: $T(n) = 2 T(n/2) + n$.
- Here, $a = 2$, $b = 2$, and $f(n) = n$.
- We calculate the critical exponent: $log_b a = log_2 2 = 1$.
- The critical function is $n^(log_b a) = n^1 = n$.
- We compare $f(n) = n$ with $n$.
- We need to check if $f(n) = Theta(n^(log_b a))$. Is $n = Theta(n)$?
- Yes, this is true.
- Therefore, by Case 2, $T(n) = Theta(n^(log_b a) log n) = Theta(n log n)$.

#heading(level: 3)[Example 3: Case 3 (Root Dominated)]
Consider the recurrence $T(n) = 4 T(n/2) + n^3$.
- Here, $a = 4$, $b = 2$, and $f(n) = n^3$.
- We calculate the critical exponent: $log_b a = log_2 4 = 2$.
- The critical function is $n^(log_b a) = n^2$.
- We compare $f(n) = n^3$ with $n^2$.
- We need to check if $f(n) = Omega(n^(log_b a + epsilon))$. Is $n^3 = Omega(n^(2 + epsilon))$ for some $epsilon > 0$?
- Yes, we can choose $epsilon = 1$ (or any $0 < epsilon <= 1$). $n^3 = Omega(n^{2+1}) = Omega(n^3)$. The condition holds.
- Now, we must also check the *regularity condition*: $a f(n/b) <= c f(n)$ for some $c < 1$.
  - $a f(n/b) = 4 * (n/2)^3 = 4 * (n^3 / 8) = (1/2) n^3$.
  - We need $(1/2) n^3 <= c n^3$ for some $c < 1$.
  - We can choose $c = 1/2$. Since $1/2 < 1$, the regularity condition holds.
- Therefore, by Case 3, $T(n) = Theta(f(n)) = Theta(n^3)$.

// Limitations
#heading(level: 2)[Limitations of the Master Theorem]

The Master Theorem is powerful but does not apply to all recurrences of the form $T(n) = a T(n/b) + f(n)$. Here are some common situations where it might not apply:

- *Gaps between Cases:* The function $f(n)$ might fall into the gaps between the cases. For example, if $f(n) = n^(log_b a) / log n$, it is asymptotically smaller than $n^(log_b a)$, but not polynomially smaller, so Case 1 does not apply.
- *Regularity Condition Failure:* In Case 3, the regularity condition $a f(n/b) <= c f(n)$ (for some $c < 1$) must hold. Some functions $f(n)$ that are polynomially larger than $n^(log_b a)$ might fail this condition. For instance, $T(n) = 2T(n/2) + n log n$ fails the basic theorem (but fits the extended Case 2). A recurrence like $T(n) = T(n/2) + n(2 - cos(n))$ might fail regularity due to oscillation.
- *Non-constant Parameters:* The values $a$ and $b$ must be constants.
- *Non-positive $f(n)$:* The function $f(n)$ must be asymptotically positive.
- *$b$ not greater than 1:* The subproblem size must shrink ($b > 1$).
- *Not of the precise form:* The recurrence might not exactly fit the $a T(n/b) + f(n)$ structure (e.g., $T(n) = T(n/2) + T(n/3) + n$).

In situations where the Master Theorem does not apply, other methods like the Akra-Bazzi theorem (a generalization), recursion tree analysis, or substitution method must be used.

// Conclusion
#heading(level: 2)[Conclusion]

The Master Theorem is an invaluable technique for quickly analyzing the performance of many divide-and-conquer algorithms. By comparing the cost of the recursive calls (captured by $n^(log_b a)$) with the cost of the non-recursive work ($f(n)$), it allows us to directly determine the overall asymptotic complexity based on three distinct cases: leaf-dominated, balanced, or root-dominated complexity. While it's essential to be aware of its limitations and the conditions under which each case applies (especially the regularity condition for Case 3), it remains a cornerstone of algorithm analysis.