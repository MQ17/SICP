#lang racket

;Global environment recursive
;Factorial: (* n (factorial (- n 1)))

;E1 (factorial 6)
;n: 6
;(* 6 (factorial 5))

;E2 (factorial 5)
;n: 5
;(* 5 (factorial 4))

;each call will result in a new environment pointint to the global environment
;(factorial 3)
;  (* 3 (factorial 2))
;(factorial 2)
;  (* 2 (factorial 1))
;(factorial 1)
;  1

;Global Environment iterative
;Factorial: (fact-iter 1 1 n))
;Fact-iter: ...

;E1 (factorial 6)
;n: 6
;(fact-iter 1 1 n))
;sees that fact-iter is defined in the global environment

;E2
;product: 1
;counter: 1
;max-count: 6
;after evaluating results in
;(fact-iter 1 2 6)

;each call will results in a new environement pointing to the global environment
;(fact-iter 2 3 6)
;(fact-iter 6 4 6)
;(fact-iter 24 5 6)
;(fact-iter 120 6 6)
;(fact-iter 720 7 6)
;which then evaluates to 720
