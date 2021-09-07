#lang racket

(define (reverse l)
  (define (reverse-iter l r)
    (if (null? l)
        r
        (reverse-iter (cdr l) (cons (car l) r))))
  (reverse-iter l null))

(define (deep-reverse l)
  (define (reverse-iter l r)
    (cond ((null? l) r)
          ((pair? l) (reverse-iter
                      (cdr l)
                      (cons (reverse-iter (car l) null) r)))
          (else l)))
  (reverse-iter l null))
    

(define x (list (list 1 2) (list 3 4)))

(reverse x)

(deep-reverse x)