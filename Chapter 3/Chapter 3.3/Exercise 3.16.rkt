#lang sicp
;(a.(b.(c.null)) ;3
;((a.b).(c.d)) ;3
;x = (a.b)
;(a.(x.x)) ;3 but it counts 4
;y = (x.x)
;(y.y) ;3 but it counts 7
;z = (a.(b.(c.z))) ;3 but it goes into infinite loop

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs (list 'a 'b 'c))
(define x (cons 'a 'b))
(count-pairs (cons 'a (cons x x)))
(define y (cons x x))
(count-pairs (cons y y))