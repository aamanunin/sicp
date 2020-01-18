#lang sicp

(#%require rackunit)

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-iter (* b b) (/ n 2) a))
          (else (* b (fast-iter b (- n 1) a)))))
  (fast-iter b n 1))

(fast-expt 2 6)