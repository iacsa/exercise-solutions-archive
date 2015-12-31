#lang racket

(provide leap-year?)

(require math/number-theory)

(define (leap-year? y)
  (or (divides? 400 y)
      (and (divides? 4 y)
           (not (divides? 100 y)))))
