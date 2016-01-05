#lang racket

(require (only-in math/number-theory
                  divisor-sum))


(provide
  (contract-out 
    [perfect-numbers (-> natural-number/c (listof natural-number/c))]))


(define (perfect-numbers n)
  (filter 
    ; divisor-sum also counts `n` itself
    (λ (n) (= (* 2 n) (divisor-sum n)))
    (range 2 (add1 n))))
