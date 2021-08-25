#lang sicp

;;;Exercise 1.17
(define (double n) (+ n n))
(define (* a b)
  (cond
    ((= b 0) 0)
    ((even? b) (double (* a (/ b 2))))
    (else (+ a (* a (dec b))))))

(* 10 10)