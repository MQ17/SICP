#lang sicp

;;; Exercise 1.7
(define (square x) (* x x))

;; Old code
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))
;
;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess )
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))



(define (sqrt x)
  (sqrt-iter 1.0 2.0 x))

(sqrt 0.0001)
(sqrt 0.01)
(sqrt 1)
(sqrt 100)
(sqrt 10000)
(sqrt 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999)

;;; Explanation
; Error: 2ex + e^2 < 0.001
; Answers close to 0 have larger error
; Large answer require very small error
;   (May not terminate if number representation is not precise enough)

