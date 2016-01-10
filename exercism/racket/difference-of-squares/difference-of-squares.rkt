#lang racket

(provide
  (contract-out
    [sum-of-squares (-> natural-number/c natural-number/c)]
    [square-of-sums (-> natural-number/c natural-number/c)]
    [difference (-> natural-number/c natural-number/c)]))


(define (power-sum n inner outer)
  (expt (for/sum ([i (in-range 1 (add1 n))])
                 (expt i inner))
        outer))

(define (sum-of-squares n)
  (power-sum n 2 1))

(define (square-of-sums n)
  (power-sum n 1 2))

(define (difference n)
  (- (square-of-sums n) (sum-of-squares n)))
