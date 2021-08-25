#lang sicp

(define (cont-frac num den k)
  (define (cont-frac-iter num den k prev)
    (if (= k 0)
        prev
        (cont-frac-iter num den (dec k) (/ (num k) (+ (den k) prev)))))
  (cont-frac-iter num den (dec k) (/ (num k) (den k))))

(define (denominator i)
  (if (= (remainder i 3) 2)
      (/ (+ (* 2 i) 2) 3)
      1))
(cont-frac (lambda (i) 1.0)
            denominator
            10)