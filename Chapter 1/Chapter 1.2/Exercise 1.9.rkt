#lang sicp

;;;Exercise 1.9
(define (+-recursive ab)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(define (+-iterative a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;first one is recursive because increments keep piling up
;second one is iterative because it modifies the state variables