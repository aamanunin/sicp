#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

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
; 1013 *** 2
; 1019 *** 2

(search-for-primes 10000 10040)
; 10007 *** 5
; 10009 *** 5
; 10037 *** 5
; d = 2.5
; nd = 8 / 5 = 1.6

(search-for-primes 100001 100045)
; 100003 *** 14
; 100019 *** 14
; 100043 *** 14
; d = 2.8
; nd = 23 / 14 = 1.64

(search-for-primes 1000000 1000040)
; 1000003 *** 43
; 1000033 *** 43
; 1000037 *** 43
; d = 3.07
; nd = 72 / 43 = 1.67

(search-for-primes 10000000 10000106)
; 10000019 *** 135
; 10000079 *** 134
; 10000103 *** 135
; d = 3.14
; nd = 219 / 135 = 1.62
; Количество шагов снижается в два раза, но время выполнения уменьшается в 1.6 раза
; видимо добавление новой процедуры next замедляет выполнение.