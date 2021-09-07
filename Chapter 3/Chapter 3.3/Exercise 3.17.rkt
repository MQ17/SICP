#lang racket
(define (in x l)
  (cond ((null? l) false)
        ((eq? x (car l)) true)
        (else (in x (cdr l)))))

(define (count-pairs x)
  (define counted-list null)
  (define (count-pairs-iter x)
    (cond ((not (pair? x))  0)
          ((in x counted-list) 0)
          (else
           (set! counted-list (cons x counted-list))
           (+ (count-pairs-iter (car x))
              (count-pairs-iter (cdr x))
              1))))
  (count-pairs-iter x))



(count-pairs (list 'a 'b 'c))
(define x (cons 'a 'b))

(count-pairs (cons x x))

(count-pairs (cons 'a (cons x x)))
(define y (cons x x))
(count-pairs (cons y y))