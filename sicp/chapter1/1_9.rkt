#lang sicp

(#%require rackunit)

(define (inc x) (+ x 1))

(+ 4 5)
(inc(+ 3 5))
(inc(inc(+ 2 5)))
(inc(inc(inc(+ 1 5))))
(inc(inc(inc(inc (+ 0 5)))))
(inc(inc(inc(inc 5))))
; Is recursive process

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
; Is iterative process