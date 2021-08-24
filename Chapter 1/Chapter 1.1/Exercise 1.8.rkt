#lang sicp

;;; Exercise 1.8
(define (square x) (* x x))
(define (cube x) (* x x x))

(define (cubr-iter guess prev x)
  (if (good-enough? guess prev x)
      guess
      (cubr-iter (improve guess x) guess x)))

(define (good-enough? guess prev x)
  (< (abs (- guess prev)) 0.001))

(define (improve y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cubr x) (cubr-iter 1.0 2.0 x))

(cubr 27)