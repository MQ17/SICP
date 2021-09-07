#lang racket

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subset) (cons (car s) subset)) rest)))))
;The subsets of a set is the sum of all subsets without an element and all the elements with that element

(subsets (list 1 2 3))
