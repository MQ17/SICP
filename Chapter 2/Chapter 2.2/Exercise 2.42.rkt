#lang racket

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))



(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board) ; an empty board if there are no queens
        (filter
         (lambda (positions) (safe? positions)) ; make sure the new boards are safe
         (flatmap
          (lambda (rest-of-queens) ;function that takes in right k-1 board and creates boards with another queen to it
            (map (lambda (new-row) 
                   (adjoin-position new-row rest-of-queens)) 
                 (enumerate-interval 1 board-size))) ; enumerate through all the rows a new queen could be put on the left 
          (queen-cols (- k 1))))))
  (queen-cols board-size)) ; put a board-sized number of queens down

(define empty-board null)

(define (adjoin-position new-row rest-of-queens) (cons new-row rest-of-queens))

(define (safe? positions)
  (define (safe-direction positions current direction)
    (cond ((null? positions) true) ;reached end of board
          ((= current (car positions)) false) ;queen at current direction
          (else (safe-direction (cdr positions) (+ current direction) direction)))) ;otherwise, keep moving           
                
  (and (safe-direction (cdr positions) (+ (car positions) 1) 1) ;upwards diagonal
       (safe-direction (cdr positions) (car positions) 0) ;row
       (safe-direction (cdr positions) (- (car positions) 1) -1))) ;downwards diagonal


(define solutions (queens 8))
(display "Length: ")
(length solutions)
(newline)
solutions
