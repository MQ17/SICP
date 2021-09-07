#lang sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (loop? x)
  (define encountered nil)
  (define (helper x)
    
    (cond ((memq x encountered) true)
          ((null? x) false)
          (else (set! encountered (cons x encountered))
                (helper (cdr x))))) 
  (helper x))

(loop? '(a b c))
(loop? (make-cycle '(a b c)))
(loop? (cons 's (make-cycle '(a b c))))



