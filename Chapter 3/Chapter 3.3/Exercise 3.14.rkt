#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v '(a b c d))
(define w (mystery v))
v
w
;(mystery '(a b c d))
;(loop '(a b c d) '())
;(loop '(b c d) '(a))
;(loop '(c d) '(b a))
;(loop '(d) '(c b a))
;(loop '() '(d c b a))
;'(d c b a)
;mystery creates a reversed list
;the input ends up being the first item