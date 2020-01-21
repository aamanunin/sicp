#lang sicp

(#%require rackunit)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal process
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) ; +1 remainder
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) ; +2 remainder
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; +4 remainder
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (=  (remainder (remainder 40 (remainder 206 40))
                   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; +7 remainder
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; + 4 remainder
    (gcd  (remainder (remainder 40 (remainder 206 40))
                     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                     (remainder (remainder 40 (remainder 206 40))
                                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; Total 18 remainder

;applicative process

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40))) ; + 1 remainder

(gcd 40 6)
(if (= 6 0)
    40
    (gcd 6 (remainder 40 6))) ; + 1 remainder

(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4))) ; + 1 remainder

(gcd 4 2)
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2))) ; + 1 remainder

(gcd 2 0)
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))

; Total 4 remainder