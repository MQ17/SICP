#lang sicp

(define (cont-frac num den k)
  (define (cont-frac-iter num den k prev)
;    (display (num k))
;    (newline)
;    (display (den k))
    (if (= k 0)
        prev
        (cont-frac-iter num den (dec k) (/ (num k) (+ (den k) prev)))))
  (cont-frac-iter num den (dec k) (/ (num k) (den k))))

(define (exp x y)
  (if (= y 1)
      x
      (* x (exp x (dec y)))))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))


(tan-cf 2 300.0)