#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display guess)
    (display " ")
    (display count)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next 
          (try next (inc count)))))
  (try first-guess 0))

(define (f x) (/ (log 1000) (log x)))
(fixed-point f 5)

(define (average x y) (/ (+ x y) 2))
(define (g x) (average (/ (log 1000) (log x)) x))
(fixed-point g 5)

