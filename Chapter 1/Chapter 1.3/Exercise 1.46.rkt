#lang sicp

(define (improvement good-enough? improve)
  (define (test guess) (if (good-enough? guess)
                      guess
                      (test (improve guess))))
  test)

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))



(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((improvement good-enough? improve) 1.0))

(sqrt 4)

(define (fixed-point f)
  (define (good-enough? guess)
    (< (abs (- (f guess) guess)) 0.001))
  (define (improve guess)
    (average guess (f guess)))
  ((improvement good-enough? improve) 1.0))

(fixed-point (lambda (x) (- (square x) x 1)))
