#lang sicp

;;; Exercise 1.3
(define (square-sum a b) (+ (* a a) (* b b)))
(define (larger-square-sum a b c)
  (cond ((and (>= a c) (>= b c)) (square-sum a b))
        ((and (>= a b) (>= c b)) (square-sum a c))
        (else (square-sum b c))
        )
  )

(larger-square-sum 1 2 3)