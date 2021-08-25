#lang sicp

;(define (cont-frac num den k n)
;  (if (= k n)
;      (/ (num k) (den k))
;      (/ (num n) (+ (den n) (cont-frac num den k (inc n))))))
; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            11
;            1)
(define (cont-frac num den k)
  (define (cont-frac-iter num den k prev)
    (if (= k 0)
        prev
        (cont-frac-iter num den (dec k) (/ (num k) (+ (den k) prev)))))
  (cont-frac-iter num den (dec k) (/ (num k) (den k))))

 (cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            11)


