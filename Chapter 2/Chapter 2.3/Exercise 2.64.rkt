#lang racket

(define (list->tree elements)
  (car (partial-tree elements (length elements)))) ;make a tree of everything, then ignore the nonexistent remaining elements

(define (partial-tree elts n) ; returns '(tree-of-first-n-elements, other-elements)
  (if (= n 0)
      (cons '() elts) ; empty tree
      (let ((left-size (quotient (- n 1) 2))) ; size of the left will be first half of the list
        (let ((left-result (partial-tree elts left-size)))  ; the left tree
          (let ((left-tree (car left-result)) ; ignore the other elements 
                (non-left-elts (cdr left-result)) ; non-left-elements
                (right-size (- n (+ left-size 1)))); size of the right side. minus 1 for entry length
            (let ((this-entry (car non-left-elts)) ; index of entry will be the first of the non-left
                  (right-result (partial-tree (cdr non-left-elts) ;the right tree
                                              right-size)))
              (let ((right-tree (car right-result)) ;ignore other elements
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))));combine to form tree

;T(N) = 2T(N/2) + O(1)
;so O(N)