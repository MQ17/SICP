#lang racket


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;only adjoin-set changes
(define (adjoin-set x set)
      (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)    
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))

(define set1 '(2 1 2 3 4 5 6))
(define set2 '(4 2 4 6 8))

set1
set2
(intersection-set set1 set2)
(union-set set1 set2)

;by doing this, you are making adjoin-set a constant time operation, which makes union more efficient