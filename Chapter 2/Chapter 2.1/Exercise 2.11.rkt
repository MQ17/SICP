#lang racket

(define (make-interval a b) (cons a b))

(define (lower x) (car x))
(define (upper x) (cdr x))

(define (mul-interval-original x y)
  (let ((p1 (* (lower x) (lower y)))
        (p2 (* (lower x) (upper y)))
        (p3 (* (upper x) (lower y)))
        (p4 (* (upper x) (upper y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;Ben bitdiddle's suggestion is stupid
(define (mul-interval x y)
  (let ((a (> (lower x) 0))
        (b (> (upper x) 0)) 
        (c (> (lower y) 0))
        (d (> (upper y) 0))
        )
    (cond ((and a b c d) (make-interval
                          (* (lower x) (lower y))
                          (* (upper x) (upper y))))
          ((and a b (not c) d) (make-interval
                          (* (upper x) (lower y))
                          (* (upper x) (upper y))))
          ((and a b (not c) (not d)) (make-interval
                          (* (upper x) (lower y))
                          (* (lower x) (upper y))))

          ((and (not a) b c d) (make-interval
                          (* (lower x) (upper y))
                          (* (upper x) (upper y))))
          ((and (not a) b (not c) d) (make-interval
                          (min (* (lower x) (upper y)) (* (upper x) (lower y)))
                          (max (* (lower x) (lower y)) (* (upper x) (upper y)))))
          ((and (not a) b (not c) (not d)) (make-interval
                          (* (upper x) (lower y))
                          (* (lower x) (lower y))))

          ((and (not a) (not b) c d) (make-interval
                          (* (lower x) (upper y))
                          (* (upper x) (lower y))))
          ((and (not a) (not b) (not c) d) (make-interval
                          (* (lower x) (upper y))
                          (* (lower x) (lower y))))
          ((and (not a) (not b) (not c) (not d)) (make-interval
                          (* (upper x) (upper y))
                          (* (lower x) (lower y)))))))


          


    
          