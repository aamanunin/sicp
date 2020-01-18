#lang sicp

(#%require rackunit)

; recursive process
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))))

(f 4)
(f 5)
(f 6)

; iterative process
(define (f2 n)
  (define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter b c (+ a b c) (- count 1))))
  (f-iter 0 1 2 n))

(f2 4)
(f2 5)
(f2 6)