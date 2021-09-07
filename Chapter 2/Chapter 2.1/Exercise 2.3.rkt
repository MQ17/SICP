#lang racket


(define (make-point x y)
  (cons x y))

(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment start end)
  (cons start end))

(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (print-segment s)
  (display "[")
  (print-point (start-segment s))
  (display ", ")
  (print-point (end-segment s))
  (display "]")
  (newline))

(define (make-rectangle segment l) ;the other segment is segment rotated 90 degrees of length l
  (cons segment l))

(define (distance p1 p2) (sqrt (+
                                (sqr (- (y-point p2) (y-point p1)))
                                (sqr (- (x-point p2) (y-point p1))))))
(define (length1 x) (distance (start-segment (car x)) (end-segment (car x))))
(define (length2 x) (cdr x))
; I could hypothetically define procedures that return the points here but nah

(define (area x) (* (length1 x) (length2 x)))
(define (perimeter x) (* 2 (+ (length1 x) (length2 x))))
(define r (make-rectangle (make-segment (make-point 0 0) (make-point 1 1)) 3))

(area r)
(perimeter r)