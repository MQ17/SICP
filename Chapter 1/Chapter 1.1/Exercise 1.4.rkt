#lang sicp

;;; Exercise 1.4
;; Chooses the operation based on whether b>0
;; Performs a+abs(b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -5)