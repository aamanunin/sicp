#lang sicp

(#%require rackunit)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(product identity 1 inc 6)
; 720

(product-iter identity 1 inc 6)
; 720

(define (term x)
  (/ (* (* 2 x) (* 2 x))
     (* (- (* 2 x) 1) (+ (* 2 x) 1))))

(define (next x)
  (* 2 x))

(* 2 (product term 1.0 inc 9999))
; 3.1415141108281905

(* 2 (product-iter term 1.0 inc 9999))
; 3.1415141108281714

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(accumulate * 1 identity 1 inc 6)
; 720

( * 2(accumulate * 1 term 1.0 inc 9999))
; 3.1415141108281905

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(accumulate-iter * 1 identity 1 inc 6)
; 720

( * 2(accumulate-iter * 1 term 1.0 inc 9999))
; 3.1415141108281714