#lang racket

(define *the-table* (make-hash));make THE table 
(define (put key1 key2 value) (hash-set! *the-table* (list key1 key2) value));put 
(define (get key1 key2) (hash-ref *the-table* (list key1 key2) #f));get

;a
;instead of doing the different derivatives for each operator
;in the deriv function, it gets the subexpression needed for each operator
;numer? and same-variable? can't be assimilated because a base case is still required

;b
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;(define (aggregate terms)
;  (cond
;    ((null? terms) null)
;    ((null? (cdr terms)) terms)
;    (else
;     (let ((term (car terms))
;           (next-term (cadr terms)))
;       (cond
;         ((eq? term 0) (aggregate (cdr terms)))
;         ((and (number? term) (number? next-term)) (aggregate (cons (+ term next-term) (aggregate (cddr terms))))))))))

(define (install-sum-package)
  (define (deriv-sum operands var) (cons '+ (map (lambda (exp) (deriv exp var)) operands)))
  (put 'deriv '+ deriv-sum))

;could be optimized but eh
(define (install-product-package)
  (define (deriv-product operands var) (cons '+ (map (lambda (exp) (cons '* (cons (deriv exp var) (remove exp operands)))) operands)))
  (put 'deriv '* deriv-product))

(define (install-exponentiation-package)
  (define (deriv-exponentiation operands var) (list '* (cadr operands) (list '** (car operands) (- (cadr operands) 1))))
  (put 'deriv '** deriv-exponentiation)) 

(install-sum-package)
(install-product-package)
(install-exponentiation-package)
(deriv '(+ x 1 x) 'x)
(deriv '(* x 2 x) 'x)
(deriv '(* 2 (** x 2)) 'x)


(deriv '(+ (* 2 (** x 2)) (* 4 x x) (* 3 (+ 1 x))) 'x)
'(+ (+ (* 0 (** x 2)) (* (* 2 (** x 1)) 2)) (+ (* 0 x x) (* 1 4 x) (* 1 4 x)) (+ (* 0 (+ 1 x)) (* (+ 0 1) 3)))

;d
;you'd have to swtich the positions in put