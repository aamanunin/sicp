#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (fast-multi a b)
  (cond ((= b 1) a)
        ((even? b) (double (fast-multi a (halve b))))
        (else (+ a (fast-multi a (- b 1))))))

(fast-multi 2 4)
(fast-multi 2 5)
(fast-multi 2 6)
(fast-multi 3 4)
(fast-multi 8 3)