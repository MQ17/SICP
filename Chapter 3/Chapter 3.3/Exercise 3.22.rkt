#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (insert-queue! x)
      (cond ((null? front-ptr) (set! front-ptr (cons x front-ptr))
                               (set! rear-ptr front-ptr))
            (else (set-cdr! rear-ptr (cons x nil))
                  (set! rear-ptr x)))
      (cons front-ptr rear-ptr))
    
    (define (delete-queue!)
      (cond ((null? front-ptr) (error "Cannot delete empty queue!"))
            (else (set! front-ptr (cdr front-ptr))))
      (cons front-ptr rear-ptr))
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            (else (error "Not a method"))))
    dispatch))

(define (insert-queue! q symbol) ((q 'insert-queue!) symbol))
(define (delete-queue! q) (q 'delete-queue!))



(define q1 (make-queue))
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)
    
  
    
                              
             
            
                               