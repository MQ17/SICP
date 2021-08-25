#lang sicp

;;;Exercise 1.18
(define (double n) (+ n n))
(define (half n) (/ n 2))

(define (* a b)
  (define (*-iter a b k)
    (cond
      ((= b 0) k)
      ((even? b) (*-iter (double a) (half b) k))
      (else      (*-iter a (dec b) (+ k a)))))
  (*-iter a b 0)
)

(* 10 10)