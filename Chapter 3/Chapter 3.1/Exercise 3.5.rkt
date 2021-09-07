#lang racket

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* (random) range))))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (p x y)))
  
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (* 1.0 (/ trials-passed trials) (- y2 y1) (- x2 x1)))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))))
  
  (iter trials 0))

(define (in-unit-circle x y)
  (<= (+ (sqr x) (sqr y)) 1))

(define pi (estimate-integral in-unit-circle -1 1 -1 1 100000))
pi
  