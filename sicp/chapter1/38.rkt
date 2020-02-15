#lang sicp

(#%require rackunit)

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (cont-frac n d k)
  (cond ((= k 0) (/ (n k) (n d)))
        (else (/ (n k)
                 (+ (d k) (cont-frac n d (- k 1)))))))

(define (cont-frac-iter n d k)
  (define (iter n d k result)
    (if (= k 0)
        result
        (iter n d (- k 1) (/ (n k) (+ (d k) result)))))
  (iter n d k 0))


(+ 2 (cont-frac-iter (lambda (i) 1.0)
                (lambda (i) (if (= (remainder i 3) 2)
                                (* 2 (/ (+ i 1) 3))
                                1))
                100))