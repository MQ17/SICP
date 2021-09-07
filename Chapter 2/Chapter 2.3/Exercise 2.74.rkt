#lang racket
(define *the-table* (make-hash));make THE table 
(define (put key1 key2 value) (hash-set! *the-table* (list key1 key2) value));put 
(define (get key1 key2) (hash-ref *the-table* (list key1 key2) #f));get

;Each implementation should have a get-whatever procedure
(define (get-record employee-file) ((get 'get-record (type-tag employee-file)) employee-file))
(define (get-salary employee-file) ((get 'get-salary (type-tag employee-file)) employee-file))

;
(define (find-employee-record division-files employee)
  (if (null? division-files) 
      (let ((current ((get 'find-employee-file (type-tag (car division-files))) (car division-files) employee)))
        (if current
            current
            (find-employee-record (cdr division-files))))))

;d
;when insatiable takes over, no changes




