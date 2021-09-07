#lang racket

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list items)
  (if (null? items)
      null
      (cons (sqr (car items)) (square-list (cdr items)))))

(define (square-list2 items)
  (map sqr items))

(define items (list 1 2 3 4 5))
(square-list items)
(square-list2 items)