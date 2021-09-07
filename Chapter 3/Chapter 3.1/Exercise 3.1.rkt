#lang racket

(define (make-accumulator value)
  (lambda (augend)
    (begin (set! value (+ value augend))
           value)))

(define A (make-accumulator 5))
(A 10)
(A 10)