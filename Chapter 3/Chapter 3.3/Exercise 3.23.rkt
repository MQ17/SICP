#lang sicp

;Deque Class
(define (make-deque)
  ;Node Inner Class
  (define (make-node value prev next)
    (lambda (m)
      (cond ((eq? m 'value) value)
            ((eq? m 'next) next)
            ((eq? m 'prev) prev)
            ((eq? m 'set-value!) (lambda (x) (set! value x)))
            ((eq? m 'set-next!) (lambda (x) (set! next x)))
            ((eq? m 'set-prev!) (lambda (x) (set! prev x)))
            (else (error "Not a method")))))

  ;Initialize field variables
  (let ((front nil)
        (rear nil))
    
    ;Reset empty queue to queue with one element
    (define (add-to-empty x)
      (set! front (make-node x nil nil))
      (set! rear front))
    
    ;toList method
    (define (to-list)     
      ;(list (front 'value) (front 'next) (front 'prev) (rear 'value) (rear 'next) (rear 'prev)))
      (list (node-to-list front 'next) (node-to-list rear 'prev)))
    (define (node-to-list node direction)
      (if (null? node)
          '()
          (cons (node 'value) (node-to-list (node direction) direction))))
    
    ;Empty method
    (define (empty?)
      (or (null? front)
          (null? rear)))
    
    ;Insertion
    (define (front-insert! x)
      (cond ((empty?) (add-to-empty x))
            (else ((front 'set-prev!) (make-node x nil front))
                  (set! front (front 'prev))))
      (to-list))
    (define (rear-insert! x)
      (cond ((empty?) (add-to-empty x))
            (else ((rear 'set-next!) (make-node x rear nil))
                  (set! rear (rear 'next))))
      (to-list))
    
    ;Deletion
    (define (front-delete!)
      (cond ((empty?) (error "Deque already empty"))
            ((null? (front 'next)) (set! front nil)
                                   (set! rear nil))                                                               
            (else (set! front (front 'next))
                  ((front 'set-prev!) nil)))
      (to-list))
    (define (rear-delete!)
      (cond ((empty?) (error "Deque already empty"))
            ((null? (front 'next)) (set! front nil)
                                   (set! rear nil))
            (else (set! rear (rear 'prev))
                  ((rear 'set-next!) nil)))
      (to-list))
    
    ;Dispatch function
    (lambda (m)
      (cond ((eq? m 'front-deque) front)
            ((eq? m 'rear-deque) rear)
            ((eq? m 'empty-deque?) (empty?))
            ((eq? m 'front-insert-deque!) front-insert!)
            ((eq? m 'rear-insert-deque!) rear-insert!)
            ((eq? m 'front-delete-deque!) (front-delete!))
            ((eq? m 'rear-delete-deque!) (rear-delete!))
            (else (error "Not a method"))))))

(define (front-deque q) (q 'front-deque))
(define (rear-deque q) (q 'rear-deque))
(define (empty-deque? q) (q 'empty-deque?))
(define (front-insert-deque! q x) ((q 'front-insert-deque!) x))
(define (rear-insert-deque! q x) ((q 'rear-insert-deque!) x))
(define (front-delete-deque! q) (q 'front-delete-deque!))
(define (rear-delete-deque! q) (q 'rear-delete-deque!))

(define q (make-deque))
(empty-deque? q)
(front-insert-deque! q 1)
(rear-insert-deque! q 2)
(empty-deque? q)
(front-delete-deque! q)
(rear-delete-deque! q)
(empty-deque? q)







          
  
