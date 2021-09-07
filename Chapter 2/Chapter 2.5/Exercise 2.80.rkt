#lang racket
(require "Arithmetic.rkt")
;(put '=zero? '(scheme-number)
;     (lambda (x) (= x 0)))
;(put '=zero? '(rational)
;     (lambda (x) (= (numer x) 0)))
;(put '=zero? '(compex)
;     (lambda (x) (and (= (real-part x) 0) (= (imag-part x) 0)))) ;could also repurpose equ?

(=zero? 0)
(=zero? 1)
(=zero? (make-rational 0 3))
(=zero? (make-rational 1 3))
(=zero? (make-complex-from-real-imag 0 0))
(=zero? (make-complex-from-mag-ang 1 3))