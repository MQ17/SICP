#lang racket

;oops, my first thought process was iterative, which gives the answer reversed
(define (same-parity-iterative . l)
  (define (same-parity-iter l answer)
    (cond ((null? l) answer)
          ((= (remainder (- (car l) (car answer)) 2) 0) (same-parity-iter
                                                           (cdr l)
                                                           (cons (car l) answer)))
          (else (same-parity-iter
                 (cdr l)
                  answer))))
  (same-parity-iter (cdr l) (list (car l))))

(define (same-parity . l)
  (define (same-parity-iter l check)
    (cond ((null? l) null)
          ((check (car l)) (cons (car l) (same-parity-iter (cdr l) check)))
          (else (same-parity-iter (cdr l) check))))
  (same-parity-iter l (if (even? (car l)) even? odd?)))

(same-parity 1 2 3 4 5 6 7)