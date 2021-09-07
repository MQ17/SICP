#lang racket
(require "Arithmetic.rkt")

;installed in arithmetic
;(put 'equ '(scheme-number scheme-number)
;       (lambda (x y) (tag (= x y))))
;
;(define (equ? x y)
;  (= (* (numer x) (denom y))
;     (* (denom x) (numer y))))
;(put 'equ? '(rational rational)
;     equ?)
;
;(define (equ? z1 z2)
;  (and (= (real-part z1) (real-part z2)) (= (imag-part z1) (imag-part z2))))
;(put 'eq '(complex complex)
;     equ?)
(define x (make-complex-from-real-imag 0 1))
(define y (mul x (make-complex-from-mag-ang 1 0)))
(define z (add y (make-complex-from-real-imag 0 0)))
x
y
;z
(equ? x y) ; stupid floating point errors
(equ? '(complex rectangular 6.123031769111886e-17 . 1.0) y)
(equ? 1 1)
(equ? (make-rational 1 2) (make-rational 2 4))
