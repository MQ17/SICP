#lang racket

(define f
  (let ((value 1))
    (lambda (x)
      (set! value (* x))
      value)))

(+ (f 0) (f 1)) ;0
;(+ (f 1) (f 0)) ;1


  