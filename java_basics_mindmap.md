Okay, let's break down this problem step by step.  We'll use the Poisson approximation to the binomial distribution to solve this.

**1. Define the Random Variable**

Let X be the random variable representing the number of devices that are faulty at any given time.

**2. Justification for Using Poisson Approximation**

*   We have a large number of independent trials (180 devices).
*   The probability of failure for each device is small (0.01).
*   Therefore, the Poisson distribution is a good approximation to the binomial distribution.

**3. Calculate the Mean (λ)**

The mean (λ) of the Poisson distribution represents the average number of faulty devices. It's calculated as:

λ = n * p = 180 * 0.01 = 1.8

**4. Define the Event of Interest**

We want to find the minimum number of repair personnel (let's call it 'k') such that the probability that all faulty devices can be repaired (i.e., there are enough repair people) is at least 0.99.

This means we want:

P(X ≤ k) ≥ 0.99

**5. Use the Poisson Cumulative Distribution Function (CDF)**

The Poisson CDF gives us the probability that the random variable X is less than or equal to a certain value k.  The formula is:

$$P(X ≤ k) = Σ [ (e^{-λ} * λ^i) / i! ]    (sum from i = 0 to k)$$

where:
*   λ is the mean (1.8)
*   i is the number of faults (0, 1, 2, ..., k)
*   e is the base of the natural logarithm (approximately 2.71828)
*   i! is the factorial of i

**6. Find the Minimum Value of k**

We need to find the smallest integer value of 'k' such that P(X ≤ k) ≥ 0.99. We can do this by calculating P(X ≤ k) for increasing values of k until the condition is met.

*   **k = 0:**  P(X ≤ 0) = (e^(-1.8) * 1.8^0) / 0! = e^(-1.8) ≈ 0.1653

*   **k = 1:**  P(X ≤ 1) = P(X ≤ 0) + (e^(-1.8) * 1.8^1) / 1!  ≈ 0.1653 + (0.1653 * 1.8) ≈ 0.1653 + 0.2975 ≈ 0.4628

*   **k = 2:**  P(X ≤ 2) = P(X ≤ 1) + (e^(-1.8) * 1.8^2) / 2! ≈ 0.4628 + (0.1653 * 3.24) / 2 ≈ 0.4628 + 0.2679 ≈ 0.7307

*   **k = 3:**  P(X ≤ 3) = P(X ≤ 2) + (e^(-1.8) * 1.8^3) / 3! ≈ 0.7307 + (0.1653 * 5.832) / 6 ≈ 0.7307 + 0.1607 ≈ 0.8914

*   **k = 4:**  P(X ≤ 4) = P(X ≤ 3) + (e^(-1.8) * 1.8^4) / 4! ≈ 0.8914 + (0.1653 * 10.4976) / 24 ≈ 0.8914 + 0.0724 ≈ 0.9638

*   **k = 5:** P(X ≤ 5) = P(X ≤ 4) + (e^(-1.8) * 1.8^5) / 5! ≈ 0.9638 + (0.1653 * 18.8957) / 120 ≈ 0.9638 + 0.0261 ≈ 0.9899

*   **k = 6:** P(X ≤ 6) = P(X ≤ 5) + (e^(-1.8) * 1.8^6) / 6! ≈ 0.9899 + (0.1653 * 34.0123) / 720 ≈ 0.9899 + 0.0078 ≈ 0.9977

So, when k = 5, P(X ≤ 5) ≈ 0.9899, which is less than 0.99, but when k = 6, P(X ≤ 6) ≈ 0.9977, which is greater than or equal to 0.99.

**7. Answer**

Therefore, at least **6** repair personnel should be equipped to ensure that the probability of timely repair is not less than 0.99.