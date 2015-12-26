#lang racket

(provide sum-of-squares square-of-sums difference)

(define (power-sum n a b)
  (expt (for/sum ([i (in-range (add1 n))])
                 (expt i b))
        a))

(define (sum-of-squares n)
  (power-sum n 1 2))

(define (square-of-sums n)
  (power-sum n 2 1))

(define (difference n)
  (- (square-of-sums n) (sum-of-squares n)))
