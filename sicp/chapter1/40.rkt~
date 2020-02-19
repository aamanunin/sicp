#lang sicp

(#%require rackunit)

(define (cont-frac-iter n d k)
  (define (iter n d k result)
    (if (= k 0)
        result
        (iter n d (- k 1) (/ (n k) (+ (d k) result)))))
  (iter n d k 0))

(define (tan-cf x k)
  (cont-frac-iter (lambda (i) (if (= i 1)
                                  x
                                  (- (* x x))))
                  (lambda (i) (- (* 2 i) 1))
                  k))
(tan-cf 1.0 100)
; 1.557407724654902