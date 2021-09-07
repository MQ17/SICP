#lang racket
;Global env
;make-account:(balance, definitions...) points to global
;acc: (m, (cond...)) points to e1

;e1(to global)
;balance:50
;withdraw:(..., e1)
;deposit:(..., e1)
;dispatch:(...,e1)

;e2(to e1)
;m: 'deposit
;evaluates to deposit function

;e3(to e1)
;amount: 40
;evaluates to 90

;e4(to e1)
;m: 'withdraw
;evaluates to withdraw function

;e5(to e1)
;amount: 60
;evaluates to 30

;local state is kept in e1
;no sharing of environment structure except global