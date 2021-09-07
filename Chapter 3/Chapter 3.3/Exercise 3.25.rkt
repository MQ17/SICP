#lang sicp
(define (equal? list1 list2) 
  (cond ((and (not (pair? list1)) (not (pair? list2))) 
         (eq? list1 list2)) 
        ((and (pair? list1) (pair? list2)) 
         (and (equal? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))) 
        (else false))) 
  
(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    
    (define (lookup keys)
      ;(display local-table)
      (define (lookup-iter keys table)
        (let ((record (assoc (car keys) (cdr table))))
          (if record 
              (if (null? (cdr keys))
                  (cdr record)
                  (lookup-iter (cdr keys) record))
              false)))
      (lookup-iter keys local-table))
    ;insert-item
    (define (insert-item! key value record table)
      (if record
          (set-cdr! record value)
          (set-cdr! table
                    (cons (cons key value)
                          (cdr table))))) ;(insert-item! (car keys) (list (car keys)) table)
    ;insert
    (define (insert! keys value)
      (display local-table) 
      (define (insert-iter! keys value table)
        (let ((record (assoc (car keys) (cdr table))))
          (cond ((null? (cdr keys)) (insert-item! (car keys) value record table))           
                (else (cond ((not record)
                             (insert-item! (car keys) nil record table)
                             (set! record (cadr table))))
                      (insert-iter! (cdr keys) value record))) 
          'ok))
      (insert-iter! keys value local-table))
    
    ;end insert
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))


(define (get table) (table 'lookup-proc))
(define (put table) (table 'insert-proc!))

(define t (make-table equal?))
((put t) '(male brown) 'merrick)
((put t) '(male blue) 'alex)
((put t) '(female brown) 'erica)
((put t) '(female blue) 'alexandra)

((get t) '(male brown))
((get t) '(male blue))
((get t) '(female brown))
((get t) '(female blue))

((get t) '(female green))
((get t) '(attack-helicopter brown))
((get t) '(female))