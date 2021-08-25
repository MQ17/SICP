#lang sicp

;;; Exercise 1.12
(define (pascal r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal (dec r) c) (pascal (dec r) (dec c)))))

(pascal 5 3)