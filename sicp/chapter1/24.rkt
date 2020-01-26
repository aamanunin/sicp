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

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
         ((fermat-test n) (fast-prime? n (- times 1)))
         ( else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
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
; 1009 *** 3
; 1013 *** 3
; 1019 *** 3

(search-for-primes 10000 10040)
; 10007 *** 4
; 10009 *** 3
; 10037 *** 4

(search-for-primes 100001 100045)
; 100003 *** 4
; 100019 *** 4
; 100043 *** 4

(search-for-primes 1000000 1000040)
; 1000003 *** 5
; 1000033 *** 4
; 1000037 *** 5

(search-for-primes 10000000 10000106)
; 10000019 *** 6
; 10000079 *** 5
; 10000103 *** 5

; Сравнивая время для 1000 и для 1000000, в случае логарифмического порядка роста
; следует ожидать двукратного увеличения времени для 1000000 по сравнению со временем
; для 1000, так как log 1000000 = log 1000^2 = 2 log 1000.
; Наши экспериментальные данные полностью согласуются с этими ожиданиями.