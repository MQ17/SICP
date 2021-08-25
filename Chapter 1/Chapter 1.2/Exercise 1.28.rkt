#lang sicp

;;; Exercise 1.28
;Cdoe taken from http://community.schemewiki.org/?sicp-ex-1.28
(define (square n) (* n n))

(define (prime? n) (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (dec times)))
        (else false)))

(define (miller-rabin-test n)
  (define (try-it a)
    (define (check-it x)
      (and (not (= x 0)) (= x 1)))
    (check-it (miller-rabin-expmod a (dec n) n)))
  (try-it (inc (random (dec n)))))

(define (miller-rabin-expmod base exp m)
  (define (squaremod-with-check x)
    (define (check-nontrivial-sqrt x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (check-nontrivial-sqrt x (remainder (square x) m)))
    (cond ((= exp 0) 1) 
         ((even? exp) (squaremod-with-check 
                       (miller-rabin-expmod base (/ exp 2) m))) 
         (else 
          (remainder (* base (miller-rabin-expmod base (- exp 1) m)) 
                     m))))  

(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)
(prime? 6)
(prime? 7)
(newline)
(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)