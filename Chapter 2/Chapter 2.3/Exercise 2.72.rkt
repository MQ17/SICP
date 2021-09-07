#lang racket

;nlog(n) since element search takes time proportional to n
;most frequent always takes O(1) or O(n) depending on whether or not it checks the left or the right first
;least frequent takes O(n^2) since it goes through n layers and checking to see if its on the right