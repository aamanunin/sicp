#lang sicp

(#%require rackunit)

(define (filtered-accumulate combiner null-value term a next b predicate)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) next b predicate))
          (combiner null-value
                    (filtered-accumulate combiner null-value term (next a) next b predicate)))))

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-square-prime 1 5)
; 39

(define (identity x) x)


(define (multi n)
  (define (predicate a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 identity 1 inc n predicate))

(multi 5)
; 2*3*4
; 24

(multi 6)
; 5