#lang racket

;louis reasoner's code calculates queen-cols(- k 1) 8 times.
;this makes queen-cols(1) 8 times more inefficient,
;queen-cols(2) 64 times more inefficient,
;and queen-cols(8) 8^8 times more inefficient
;time is thus n^n*tt