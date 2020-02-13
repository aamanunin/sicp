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


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           50)
; 0.6180339887498948

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           50)
; 0.6180339887498948

(define (get-enough-k k)
  (if (close-enough? (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) k)
                     (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) (+ k 1)))
      (+ k 1)
      (get-enough-k (+ k 1))))

(get-enough-k 1)
; 13