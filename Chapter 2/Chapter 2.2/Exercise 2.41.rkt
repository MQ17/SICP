#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (unique-triplets n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (cons i j))
          (unique-pairs (- i 1))))
   (enumerate-interval 1 n)))


(define (triplet-sum? triplet s)
  (= (+ (car triplet) (cadr triplet) (caddr triplet))s))

(define (make-triplet-sum triplet)
  (list (car triplet) (cadr triplet) (caddr triplet) (+ (car triplet) (cadr triplet) (caddr triplet))))

(define (s-sum-triplets n s)
  (map make-triplet-sum
       (filter (lambda (triplet) (triplet-sum? triplet s)) (unique-triplets n))))

(s-sum-triplets 6 8)


