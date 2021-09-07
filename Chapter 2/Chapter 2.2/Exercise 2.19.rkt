#lang racket

(define us-coins (list 50 25 10 5 1))
(define us-coins-inverted (list 1 5 10 25 50))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (no-more? coin-values)
  (null? coin-values))

(cc 100 us-coins)
(cc 100 us-coins-inverted)
; order wont matter because the premise of
; cc(amount coin-values) being the amount of ways to count amount-coinValue
; plus the ways to count the current amount with a smaller subset still holds
; i.e. it still goes through all the possible count values for each coin
