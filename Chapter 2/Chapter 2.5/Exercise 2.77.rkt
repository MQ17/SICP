#lang racket
(require "Arithmetic.rkt")

(define z (make-complex-from-real-imag 1 1))
(magnitude z)

;As alyssa said, the selectors were never defined for complex-numbers
;Chain
;(Apply-generic 'magnitude z-complex) ;looks up the definition and sees that it means
;(Apply-generic 'magnitude z-rectangular);this except one tag down
;sqrt(2)