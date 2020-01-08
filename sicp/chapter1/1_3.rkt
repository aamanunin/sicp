#lang sicp

(#%require rackunit)

(define (square x) (* x x))
(define (<= x y)
  (or (< x y) (= x y)))

(define (sum-of-squares a b c)
  (cond ((and (<= a b) (<= a c)) (+ (square b) (square c)))
        ((and (<= b c) (<= b a)) (+ (square a) (square c)))
        ((and (<= c b) (<= c a)) (+ (square a) (square b)))
        ))

(sum-of-squares 1 1 3)
(sum-of-squares 1 1 1)