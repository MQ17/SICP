#lang sicp

;;; Exercise 1.24
(define (prime? n) (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (dec times)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n) (* n n))

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

(define (next n) ; next
  (if (odd? n) (+ n 2) 3))

(search-for-primes 10000000 3)
(search-for-primes 100000000 3)
(search-for-primes 1000000000 3)

;;roughly logarithmic growth? times vary quite a bit within each order of magnitude