#lang sicp

(define (or-gate a1 a2 output)
  (let ((~or (make-wire))
        (~a1 (make-wire))
        (~a2 (make-wire)))
    (inverter a1 ~a1)
    (inverter a2 ~a2)
    (and-gate ~a1 ~a2 ~or)
    (inverter ~or output)
    'ok))

;2*inverter+and

  