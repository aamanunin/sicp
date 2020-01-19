#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (fast-multi-iter a b)
  (define (fast-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (fast-iter (double a) (halve b) acc))
          (else (fast-iter a (- b 1) (+ acc a)))))
  (fast-iter a b 0))

(fast-multi-iter 2 4)
(fast-multi-iter 2 5)
(fast-multi-iter 2 6)
(fast-multi-iter 3 4)
(fast-multi-iter 8 3)