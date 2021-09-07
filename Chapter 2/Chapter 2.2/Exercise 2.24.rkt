#lang racket

(list 1 (list 2 (list 3 4)))

;x => [1,[..., null]] => [..., null]
;                            ||
;                      [2,[..., null]] => [..., null]
;                                            ||
;                                          [3, [4, null]] => [4, null]
