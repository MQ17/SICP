#lang racket
(define (average x y) (/ (+ x y) 2))

(define (make-center-percent c p)
  (let ((width (* c (/ p 100))))
    (make-interval (- c width) (+ c width))))

(define (center x) (average (car x) (cdr x)))
(define (percent x) (/ (- (car x) (center x)) (center x)))
