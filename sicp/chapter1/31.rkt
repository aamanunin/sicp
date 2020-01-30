#lang sicp

(#%require rackunit)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

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

(define (appr-pi n)
  (define (term x)
    (if (odd? x)
        (/ (+ 1 x) (+ 2 x))
        (/ (+ 2 x) (+ 1 x))))
  (* 4
     (product term 1.0 inc n)))

(appr-pi 9999)
; 3.14143559358984