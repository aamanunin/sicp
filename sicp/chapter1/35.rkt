#lang sicp

(#%require rackunit)

; Формула золотого сечения fi2 = fi + 1, разделив на fi получим fi = 1 + 1/fi
; из чего следует, что fi является точкой отображения x в 1 + 1/x

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
; fi = 1.6180327868852458