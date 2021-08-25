#lang sicp

(define (double func)
  (lambda (x) (func (func x))))

(((double double) inc) 5) ;double double is quadruple
(((double (double double)) inc) 5) ;quadruple quadruple is x16uple so 21