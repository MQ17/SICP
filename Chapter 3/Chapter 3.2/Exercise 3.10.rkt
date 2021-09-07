#lang racket
;Global env
;make-withdraw:...
;W1:(lambda (amount)...)

;E1(points to global)
;initial-amount: 100
;(lambda (balance) (lambda (amount)... with balance=100

;E2(points to e1)
;balance = 100
;w2 = (lambda (amount)... )

;When w2 is called, it is executed in E2, but it still behaves the same