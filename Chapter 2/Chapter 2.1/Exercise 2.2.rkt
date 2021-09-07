#lang sicp

(define (make-point x y)
  (cons x y))

(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment start end)
  (cons start end))

(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (print-segment s)
  (display "[")
  (print-point (start-segment s))
  (display ", ")
  (print-point (end-segment s))
  (display "]")
  (newline))

(define segment (make-segment (make-point 0 0) (make-point 10 3)))
(print-segment segment)