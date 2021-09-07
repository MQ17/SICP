#lang racket


(define (make-monitored f)
  (let ((calls 0))
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) calls)
            ((eq? x 'reset-count) (begin (set calls 0) 0))
            (else (begin (set! calls (+ calls 1)) (f x)))))))
            



(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
(s 'reset-count)
