#lang sicp

;;; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; A(0,A(0,... = 2*2*2...2 = 2^10 = 1024
(A 2 4) ; A(1,A(1,A(1,A(1,1)))) =  2^2^2^2 = 2^^4 = 65536
(A 3 3) ; A(2,A(2,A(2,1))) = 2^^2^^2 = 2^^4 = 65536

(define (f n) (A 0 n)) ; 2*n

(define (g n) (A 1 n)) ;2^n

(define (h n) (A 2 n)) ;2^2^2... n times or 2^^n

(define (k n) (* 5 n n)) ; 5n^2