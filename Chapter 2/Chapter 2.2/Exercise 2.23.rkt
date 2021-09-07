#lang racket

; can also use "begin"
(define (for-each proc items) 
    (proc (car items)) 
    (if (null? (cdr items))
        (display "")
        (for-each proc (cdr items)))) 


(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

(define (test x)
  (begin
    (display "a")
    x
    (+ x 1)))

(test 5)