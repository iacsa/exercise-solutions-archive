#lang racket

(provide
  (contract-out
    [accumulate (-> list? (-> any/c any/c) list?)]))


(define (accumulate xs f)
  (define (aux xs acc)
    (match xs
      [(cons hd tl) (aux tl (cons (f hd) acc))]
      [_ (reverse acc)]))
  (aux xs null))
