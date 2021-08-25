#lang sicp

;;;Exercise 1.16
(define (square n) (* n n))

(define (exp b n)
  (define (exp-iter b n a)
    (cond
        ((= n 0) a)
        ((even? n) (exp-iter (square b) (/ n 2) a))
         (else     (exp-iter b (dec n) (* b a)))))
  (exp-iter b n 1)
 )
    
(exp 3 5)