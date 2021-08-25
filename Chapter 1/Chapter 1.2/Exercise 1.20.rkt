#lang sicp

;;; Exercise 1.20

;; Applicative-Order
;gcd 206 40
;gcd 40 6
;gcd 6 4
;gcd 4 2
;gcd 2 0
;4 remainder calculations

;; Normal-Order
; Each r means one remainder calculation
;a     b
;206   40
;40    6r
;6r    4rr
;4rr   2rrrr
;2rrrr 0rrrrrrr

; Add up remainders in b gets you 14 remainder evaluated during procedure
; Last a has 4 remainders, so total of 18 remainder calculations