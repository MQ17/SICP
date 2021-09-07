#lang racket

;selectors
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;tree to list
(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;list to tree
(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;Union
(define (union-set set1 set2)
  (list->tree (union-list (tree->list set1) (tree->list set2))))

(define (union-list list1 list2)
    (cond
      ((null? list1) list2)
      ((null? list2) list1)
      (else
       (let
           ((x1 (car list1))
            (x2 (car list2)))
         (cond
           ((= x1 x2) (cons x1 (union-list (cdr list1) (cdr list2))))
           ((< x1 x2) (cons x1 (union-list (cdr list1) list2))) 
           ((< x2 x1) (cons x2 (union-list (cdr list2) list1))))))))

;Intersection
(define (intersection-set set1 set2)
  (list->tree (intersection-list (tree->list set1) (tree->list set2))))
;all of these operations are O(n)

(define (intersection-list list1 list2)
    (cond
      ((null? list1) null)
      ((null? list2) null)
      (else
       (let
           ((x1 (car list1))
            (x2 (car list2)))
         (cond
           ((= x1 x2) (cons x1 (intersection-list (cdr list1) (cdr list2))))
           ((< x1 x2) (intersection-list (cdr list1) list2)) 
           ((< x2 x1) (intersection-list (cdr list2) list1)))))))
;Testing
(define set1 (list->tree '(2 4 6 8 10)))
(define set2 (list->tree '(1 2 3 4 5 6 7)))

(tree->list (intersection-set set1 set2))
(tree->list (union-set set1 set2))
      