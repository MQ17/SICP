#lang racket
(#%require sicp-pict)

(define (vector x y)
  (cons x y))

(define (segment start end)
  (cons start end))