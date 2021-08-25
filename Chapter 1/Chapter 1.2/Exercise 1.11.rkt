#lang sicp

;;;Exercise 1.11
(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+
               (f (- n 1))
               (* 2 (f (- n 2)))
               (* 3 (f (- n 3)))))))

(define (f-iter a b c i n)
  (define (next)
    (+ (* 3 a) (* 2 b) c))

  (if (= i n)
      a
      (f-iter b c (next) (+ i 1) n)))


(define (f n) (f-iter 0 1 2 0 n))

(f 10)
