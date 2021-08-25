#lang sicp

;;; Exercise 1.13
; Fib(n) = (phi^n - phi2^n)/sqrt(5) for n=1, 2
; Fib(n+2) = Fib(n+1) + Fib(n)
; Substitute, factor out phi^n, then use phi^2 = phi + 1 to get correct equation
; phi2^n/sqrt(5) is always less than 0.5, so rounding to the nearest integer is correct