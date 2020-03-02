#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f(g x))))

(define (repeated f x)
    (if (= x 1)
        (lambda (x) (f x))
        (compose f (repeated f (- x 1)))))

((repeated square 2) 5)
; 625