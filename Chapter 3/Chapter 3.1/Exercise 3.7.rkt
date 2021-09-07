#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch given-password m)
    (cond ((not (eq? password given-password)) (display "wrong password1"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define (make-joint account old-password new-password)
  (define (dispatch given-password m)
    (cond ((not (eq? new-password given-password)) (display "wrong password2"))
          ((eq? m 'withdraw) (account old-password 'withdraw))
          ((eq? m 'deposit) (account old-password 'deposit))))
  dispatch)
    

(define peter-acc (make-account 100 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

((peter-acc 'open-sesame 'withdraw) 40)
((paul-acc 'rosebud 'deposit) 20)
((peter-acc 'open-sesame 'withdraw) 0)
