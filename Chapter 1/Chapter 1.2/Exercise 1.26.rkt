#lang sicp

;;; Exercise 1.26
; Since louis doesn't use square, his program will run expmod twice
; Instead of halving the size of the problem at each step, he made his problem tree recursive
; 2^lg(n) = n basically