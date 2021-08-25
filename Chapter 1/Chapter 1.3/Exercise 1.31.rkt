#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (product identity 2 inc n))

(define (pi)
  (define (inc-if condition n)
    (if (condition n)
        (inc n)
         n))
    
  (define (fraction n) (/ (inc-if odd? n) (inc-if even? n)))
  (* 4.0 (product fraction 2 inc 10001)))

(factorial 4)
(pi)