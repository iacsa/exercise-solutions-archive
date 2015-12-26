#lang racket

(provide accumulate)

(define (accumulate xs f)
  (match xs
    [(cons hd tl) (cons (f hd) (accumulate tl f))]
    [_ null]))
