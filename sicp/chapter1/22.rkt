#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (even? n)
  (= (remainder n 2) 0))

(define (search-for-primes start end)
  (define (search-iter cur)
    (if (<= cur end)
        (timed-prime-test cur))
    (if (<= cur end)
        (search-for-primes (+ start 2) end)))
  (search-iter (if (even? start)
                   (+ start 1)
                   start)))

(search-for-primes 1000 1020)
; 1009 *** 2
; 1013 *** 3
; 1019 *** 3

(search-for-primes 10000 10040)
; 10007 *** 7
; 10009 *** 8
; 10037 *** 7
; d = 2.66

(search-for-primes 100001 100045)
; 100003 *** 23
; 100019 *** 23
; 100043 *** 23
; d = 3.28

(search-for-primes 1000000 1000040)
; 1000003 *** 80
; 1000033 *** 72
; 1000037 *** 70
; d = 3.13

(search-for-primes 10000000 10000106)
; 10000019 *** 264
; 10000079 *** 219
; 10000103 *** 219
; d = 3.04

; √10 = 3.16 Θ(√n) приблизительно подтверждается