#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a
;lots of repetition, but I made b into english basically

(define (left-branch x) (car x))
(define (right-branch x) (car (cdr x)))

(define (branch-length x) (car x))
(define (branch-structure x) (car (cdr x)))

(define (left-length x) (branch-length (left-branch x)))
(define (right-length x) (branch-length (right-branch x)))

(define (left-structure x) (branch-structure (left-branch x)))
(define (right-structure x) (branch-structure (right-branch x)))



;b and c
;I combined them because I didn't want to repeat weight operations
;idk why I optimized for that
(define (balanced? x) (car (balance-n-weight x)))
(define (weight x) (car (cdr (balance-n-weight x))))

(define (balance-n-weight mobile)
  (if (pair? mobile)
      (list
       (and (balanced? (left-structure mobile))
            (balanced? (right-structure mobile))
            (= (* (weight (left-structure mobile)) (left-length mobile))
               (* (weight (right-structure mobile)) (right-length mobile))))
       (+ (weight (left-structure mobile)) (weight (right-structure mobile))))
      
      (list true mobile)))

(define x
  (make-mobile
   (make-branch 10 8)
   (make-branch 10
                (make-mobile
                 (make-branch 4 4)
                 (make-branch 3 4)))))

(balance-n-weight x)
(balanced? x)
(weight x)

;d
;I'd just have to change the selectors
