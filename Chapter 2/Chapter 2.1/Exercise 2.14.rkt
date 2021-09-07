#lang racket

;;;2.14
;A/A should be [1 1] when it is not. A does not have a consistent identity

;;;2.15
;you introduce the same variable twice, and since intervals don't have an identity,
;it treats it as two separate numbers, making the range off

;;;2.16
;keep track of the operations done on the variables
;then do calculus stuff to find the min and max of the function over the range