#lang sicp

(#%require rackunit)

;y
;.
;.
;1
;1 4
;1 3 6
;1 2 3 4
;1 1 1 1 1 . . x

(define (triangle x y)
  (if (or (= x 0) (= y 0))
      1
      (+ (triangle (- x 1) y) (triangle x (- y 1)))))

(triangle 0 0)
(triangle 0 1)
(triangle 1 0)
(triangle 1 1)
(triangle 1 2)
(triangle 2 2)
(triangle 3 1)
(triangle 3 3)