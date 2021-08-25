#lang sicp
(define (square n) (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

;; filtered accumulate
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))

;; sum of squares of primes
(define (prime-square-sum a b)
  (filtered-accumulate prime? + 0 square a inc b))

(prime-square-sum 2 5)

;;product of positive integers relatively prime to n


(define (product-relative-prime n)
  (define (relative-prime i) (= (gcd i n) 1))
  (define (identity x) x) 
  (filtered-accumulate relative-prime * 1 identity 2 inc (dec n)))

(product-relative-prime 10)

  