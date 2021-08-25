#lang sicp

;;;Exercise 1.22
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

;; Output schenanegans
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display ": ")
  (display elapsed-time))

(define (search-for-primes lower count)
  (define (iter n count)
    (cond ((> count 0) (timed-prime-test n) (iter (+ n 2) (if (prime? n) (dec count) count)))))
  (iter (if (odd? lower) lower (+ lower 1)) count))

(search-for-primes 100000000000 3)
(search-for-primes 1000000000000 3)
(search-for-primes 10000000000000 3)