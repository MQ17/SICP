#lang racket
(#%require sicp-pict)

(define (split primary secondary)
  (lambda (painter n)
  (if (= n 0)
      painter
      (let ((smaller ((split primary secondary) painter (- n 1))))
        (primary painter (secondary smaller smaller))))))

(define right-split  (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 3))
(paint (up-split einstein 3))