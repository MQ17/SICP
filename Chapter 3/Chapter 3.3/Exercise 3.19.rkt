#lang sicp
;literally tortoise hair problem
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (loop? x)
  (define (safe-cdr x)
    (if (or (null? x) (eq? x false))
        false
        (cdr x))) 
  (define (find-intersection tortoise hare)
    (cond ((eq? tortoise hare) true)
          ((eq? hare false) false)
          (else (find-intersection (cdr tortoise) (safe-cdr (safe-cdr hare))))))
  (find-intersection (safe-cdr x) (safe-cdr (safe-cdr x))))
  


(loop? '(a b c))
(loop? (make-cycle '(a b c)))
(loop? (cons 's (make-cycle '(a b c))))