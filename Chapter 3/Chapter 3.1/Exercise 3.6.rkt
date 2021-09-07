#lang racket

(define (rand-update x) 
  (let ((a 27) (b 26) (m 127)) 
    (modulo (+ (* a x) b) m)))

(define (rng seed)
  (lambda (symbol)
    (cond ((eq? symbol 'generate) (begin
                                    (set! seed (rand-update seed))
                                    seed))
          ((eq? symbol 'reset) (lambda (new-seed)
                                 (set! seed new-seed)
                                 seed))
          (else (display "error")))))

(define r (rng 3))
(r 'generate)
(r 'generate)
(r 'generate)
((r 'reset) 3)
(r 'generate)
(r 'generate)
(r 'generate)
((r 'reset) 8)
(r 'generate)
(r 'generate)
(r 'generate)
           