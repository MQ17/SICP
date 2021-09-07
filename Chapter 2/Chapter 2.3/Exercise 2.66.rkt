#lang racket

(define (record tree) (car tree))
(define (key tree) (caar tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= given-key (key set-of-records)) (record set-of-records))
        ((< given-key (key set-of-records))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key set-of-records))
         (lookup given-key (right-branch set-of-records)))))