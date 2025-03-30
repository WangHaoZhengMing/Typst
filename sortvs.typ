// Set document properties
#set document(
  title: "Quicksort vs. Mergesort: A Comparison",
  author: "AI Assistant",
  // date: datetime.today().display("[day] [month repr:long] [year]")
)
#set text(size: 11pt, lang: "en",font: "PingFang SC")

// Import table function
// #import table from "@preview/table:0.0.4"

// Main title
#heading(level: 1)[Quicksort vs. Mergesort: A Comparison]

// Introduction
Quicksort and Mergesort are two of the most well-known and widely used comparison-based sorting algorithms. Both employ the *divide-and-conquer* paradigm, breaking down the problem of sorting an array into smaller, more manageable subproblems. However, they differ significantly in their approach to dividing and combining, leading to distinct performance characteristics, space requirements, and stability properties. This document provides a comparative analysis of these two fundamental algorithms.

// Quicksort Section
#heading(level: 2)[Quicksort]

#heading(level: 3)[Algorithm Overview]
Quicksort works as follows:
1.  *Divide:* Choose an element from the array, called the *pivot*. Rearrange the array (partition) so that all elements smaller than or equal to the pivot come before it, and all elements greater than the pivot come after it. After partitioning, the pivot is in its final sorted position.
2.  *Conquer:* Recursively apply Quicksort to the subarray of elements smaller than the pivot and the subarray of elements larger than the pivot.
3.  *Combine:* Trivial. Since the subarrays are sorted in place and the pivot is already in its correct position, no explicit combining step is needed.

The efficiency of Quicksort heavily depends on the choice of the pivot and the resulting balance of the partitions.

#heading(level: 3)[Performance]
-   *Time Complexity:*
    -   *Best Case:* $O(n log n)$. Occurs when the pivot selection consistently divides the array into roughly equal halves. Recurrence: $T(n) = 2T(n/2) + O(n)$.
    -   *Average Case:* $O(n log n)$. With randomized pivots or good pivot selection strategies (like median-of-three), Quicksort performs extremely well on average.
    -   *Worst Case:* $O(n^2)$. Occurs when the pivot selection consistently leads to highly unbalanced partitions (e.g., choosing the smallest or largest element as pivot in an already sorted or reverse-sorted array). Recurrence: $T(n) = T(n-1) + O(n)$.
-   *Space Complexity:*
    -   Typically $O(log n)$ auxiliary space (average case) due to the recursion call stack depth.
    -   Can reach $O(n)$ auxiliary space in the worst case (unbalanced recursion).
    -   It is considered an *in-place* algorithm because the sorting happens within the original array, requiring minimal *additional* storage proportional to $n$ (ignoring the stack).

#heading(level: 3)[Properties]
-   *In-Place:* Yes (typically, depends on partition implementation and stack depth).
-   *Stable:* No. The relative order of equal elements is generally not preserved during partitioning.
-   *Cache Locality:* Generally good, as the partitioning step involves sequential access patterns.

// Mergesort Section
#heading(level: 2)[Mergesort]

#heading(level: 3)[Algorithm Overview]
Mergesort follows a different divide-and-conquer strategy:
1.  *Divide:* Divide the $n$-element sequence to be sorted into two subsequences of $n/2$ elements each.
2.  *Conquer:* Sort the two subsequences recursively using Mergesort.
3.  *Combine:* *Merge* the two sorted subsequences back into a single sorted sequence. This merge step is crucial and involves comparing elements from the two sorted subarrays and placing them into a temporary array in sorted order, then copying back.

#heading(level: 3)[Performance]
-   *Time Complexity:*
    -   *Best Case:* $O(n log n)$.
    -   *Average Case:* $O(n log n)$.
    -   *Worst Case:* $O(n log n)$.
    Mergesort's runtime is consistent because it *always* divides the array into two halves, and the merge step *always* takes $O(n)$ time. Recurrence: $T(n) = 2T(n/2) + O(n)$.
-   *Space Complexity:*
    -   Typically $O(n)$ auxiliary space is required for the temporary array used during the merge step.
    -   Variations exist (e.g., for linked lists) that can reduce space, but standard array-based Mergesort is not in-place.

#heading(level: 3)[Properties]
-   *In-Place:* No (standard implementation).
-   *Stable:* Yes. Standard implementations of the merge step can be designed to preserve the relative order of equal elements.
-   *Cache Locality:* Can be less optimal than Quicksort due to the creation and copying to/from the auxiliary array during the merge step, although sequential access occurs within merge.

// Comparison Summary Section
#heading(level: 2)[Direct Comparison Summary]

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: (left, center, center),
  table.header(
    [*Feature*], [*Quicksort*], [*Mergesort*]
  ),
  [*Algorithm Type*], [Divide & Conquer (Partition)], [Divide & Conquer (Merge)],
  [*Time - Average*], [$O(n log n)$], [$O(n log n)$],
  [*Time - Worst*], [$O(n^2)$], [$O(n log n)$],
  [*Space Complexity*], [$O(log n)$ (Avg Stack)\ $O(n)$ (Worst Stack)], [$O(n)$ (Auxiliary Array)],
  [*In-Place?*], [Yes (typically)], [No (typically)],
  [*Stable?*], [No], [Yes],
  [*Cache Locality*], [Generally Good], [Okay (less than Quicksort)],
  [*Use Case Notes*], [Often faster in practice (lower constant factors). Good for internal memory sorting. Risk of worst-case.], [Guaranteed performance. Good for external sorting or when stability is required. Requires extra memory.],
)

// Conclusion Section
#heading(level: 2)[Conclusion]

Choosing between Quicksort and Mergesort depends on the specific requirements of the application:

-   If *average-case speed* and *minimal memory usage* (in-place) are the primary concerns, and the risk of a rare $O(n^2)$ worst-case is acceptable (often mitigated by good pivot strategies like randomization or Introsort), *Quicksort* is often preferred. Its lower constant factors and better cache locality can make it faster in practice for RAM-based sorting.

-   If *guaranteed $O(n log n)$ performance* is essential (worst-case must be avoided), *stability* is required, or sorting data that doesn't fit entirely in memory (external sorting) is needed, *Mergesort* is generally the better choice, despite its $O(n)$ space requirement.

Modern sorting implementations in standard libraries often use hybrid approaches. For example, Introsort starts with Quicksort but switches to Heapsort if the recursion depth becomes too large (detecting potential $O(n^2)$ behavior), and may switch to Insertion Sort for very small subarrays. This combines the average-case speed of Quicksort with a worst-case guarantee.