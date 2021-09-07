#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map (lambda (seq) (car seq)) seqs)) 
            (accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

;dunno why I used accumulate first
;(define (matrix-*-matrix m n)
;  (accumulate (lambda (x y) (cons
;                             (matrix-*-vector (transpose n) x)
;                             y))
;              null
;              m))
(define (matrix-*-matrix m n)
  (map (lambda (x) (matrix-*-vector (transpose n) x)) m))

(define (transpose m)
  (accumulate-n cons null m))

(define m '((1 2 3 4) (5 6 7 8) (9 10 11 12)))
(define n '((1 2) (3 4) (5 6) (7 8)))
 
(define v '(1 2 3 4))
(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m n)