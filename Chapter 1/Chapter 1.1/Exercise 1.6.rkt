#lang sicp

;;; Exercise 1.6

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;;; Explanation
; The program will get stuck in an infinite loop
; new-if is not a special form so it will try to evaluate sqrt-iter forever
