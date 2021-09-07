#lang racket
(#%require sicp-pict)

(define (vector x y)
  (cons x y))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))


(define (add-vect u v)
  (cons (+ (xcor-vect u) (xcor-vect v)) (+ (ycor-vect u) (ycor-vect v))))

(define (sub-vect u v)
  (cons (- (xcor-vect u) (xcor-vect v)) (- (ycor-vect u) (ycor-vect v))))

(define (scale-vect k u)
  (cons (* k (xcor-vect u)) (* k (ycor-vect u)))) 


