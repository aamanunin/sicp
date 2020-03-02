#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f(g x))))

(define (repeated f x)
    (if (= x 1)
        (lambda (x) (f x))
        (compose f (repeated f (- x 1)))))

(define dx 0.0000001)

(define (smooth f)
  (lambda (x) (/ (+ (f x) 
                    (f (- x dx)) 
                    (f (+ x dx)))
                 3)))

(define (nsmooth f n)
  (repeated f n))

(define (half x) (/ x 2.0))

((smooth half) 6)
; 3.0

((nsmooth half 2) 6)
; 1.5