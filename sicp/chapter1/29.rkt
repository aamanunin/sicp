#lang sicp

(#%require rackunit)

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (inc x) (+ x 1))
  (define (term k)
    (* (cond ((= k 0) 1)
             ((= n k) 1)
             ((even? k) 2)
             (else 4))
       (yk k)))
  (* (/ h 3) (sum term 0 inc n)))

(simpson cube 0 1 100)

(simpson cube 0 1 1000)