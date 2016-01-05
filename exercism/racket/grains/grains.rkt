#lang racket

(provide
  (contract-out
    [square (-> natural-number/c natural-number/c)]
    [total (-> natural-number/c)]))

(define (square n)
  (expt 2 (sub1 n)))

(define (total)
  (sub1 (square 65)))
