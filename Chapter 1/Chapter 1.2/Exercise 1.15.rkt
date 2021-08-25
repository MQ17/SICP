#lang sicp

;;; Exercise 1.15

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; Each time it calls sin with a third of the angle
; 12.15 => 4.05 => 1.35 => 0.45 => 0.15 => 0.05
; p is evaluated 5 times

;for an additional procedure call, the input has to triple, so O(log(n)) for both space and time