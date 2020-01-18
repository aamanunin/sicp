#lang sicp

; Для слишком больших чисел может занять слишком много времени
; Для слишком маленьких может быть недостаточно точным

(#%require rackunit)

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(sqrt-iter 1.00 8)