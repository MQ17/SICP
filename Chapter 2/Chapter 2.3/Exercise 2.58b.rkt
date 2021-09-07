#lang racket

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (make-exponentiation a1 a2)
  (cond ((=number? a2 0) 1)
        ((=number? a2 1) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '** a2))))

;Selectors: These are my magnus opus
(define (reduce-singles exp)
  (if (null? (cdr exp))
      (car exp)
      exp))

(define (operator? exp op)
  (and  (pair? exp) (pair? (memq op exp))))
(define (operand1 s op)
  (define (operand1-iter s op)
    (if (eq? (car s) op)
        null
        (cons (car s) (operand1-iter (cdr s) op))))
  (reduce-singles (operand1-iter s op)))
(define (operand2 s op)  
  (define (operand2-iter s op)
    (if (eq? (car s) op)
        (cdr s)
        (operand2-iter (cdr s) op)))
  (reduce-singles (operand2-iter s op)))

(define (sum? exp) (operator? exp '+))
(define (product? exp) (operator? exp '*))
(define (exponentiation? exp) (operator? exp '**) )

(define (addend s) (operand1 s '+))
(define (augend s) (operand2 s '+))

(define (multiplier s) (operand1 s '*))
(define (multiplicand s) (operand2 s '*))

(define (base s) (operand1 s '**))
(define (exponent s) (operand2 s '**))
  

(define (deriv exp var)
  (cond ((number? exp) 0) ;d/dx c = 0
        ((variable? exp)
         (if (same-variable? exp var) 1 0)) ; dx/dx = 1

        ((sum? exp) ; sum-rule
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        
        ((product? exp) ;product-rule
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        
        ((exponentiation? exp) ;chain-rule
         (make-product
          (exponent exp)
          (make-exponentiation
           (base exp)
           (- (exponent exp) 1))))
        (else
         (error "unknown expression type -- DERIV" exp))))



(deriv '(x + 3 * (x + y + 2)) 'x)
(deriv '(x ** 3.5 + 4 * x + 3 * (x + y + 2 + 3 * x + x ** 3)) 'x)