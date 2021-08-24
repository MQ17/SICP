#lang sicp

;;; Exercise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
;;; Applicative-Order
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))
; ...

;;; Normal-Order
; (test 0 (p))
; (if (= 0 0) 0 (p)))
; (if #t 0 (p))
; 0

;;; Explanation
; Applicative-order will get stuck in a loop trying to evaluate (p)
; Normal-order will never evaluate (p) since it only needs to output 0