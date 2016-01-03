#lang racket

(provide
  (contract-out
    [leap-year? (-> natural-number/c boolean?)]))


(require math/number-theory)


(define (leap-year? y)
  (and (divides? 4 y)
       (or (divides? 400 y)
           (not (divides? 100 y)))))
