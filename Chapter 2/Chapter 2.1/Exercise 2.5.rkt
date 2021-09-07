#lang racket

(define (cond a b)
  (*
   (expt 2 a)
   (expt 3 b)))

(define (car x)
  (if (= (remainder x 3) 0)
      (car (/ x 3))
      (log x 2)))

(define (cdr x)
  (if (= (remainder x 2) 0)
      (cdr (/ x 2))
      (log x 3)))

(define x (cond 3 4))
(car x)
(cdr x)