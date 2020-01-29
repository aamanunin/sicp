#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test a n)
    (= (expmod a n n) a))

(define (test-all-from n start)
  (if (< start n)
      (if (fermat-test start n)
          (test-all-from n (+ start 1))
          false)
      true))

(define (test-all n) (test-all-from n 1))

(test-all 5)
(test-all 2)
(test-all 3)
(test-all 4)
(test-all 8)
(test-all 561)
(test-all 1105)
(test-all 1729)
(test-all 2465)
(test-all 2821)
(test-all 6601)