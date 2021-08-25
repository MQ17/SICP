#lang sicp



(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;; Test using integral
(define (cube x) (* x x x))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (coeff k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  (define (y k) (f (+ a (* k h))))
  (define (function k) (* (coeff k) (y k)))
                      
  (* (/ h 3)(sum function 0 inc n)))

(integral cube 0.0 1.0 1000.0)
    