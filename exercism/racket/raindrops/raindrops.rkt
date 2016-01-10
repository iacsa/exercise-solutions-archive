#lang racket

(require math/number-theory)

(provide
  (contract-out
    [convert (-> natural-number/c string?)]))


(define (convert n)
  (match (sounds n)
    ["" (number->string n)]
    [sounds sounds]))

(define (sounds n)
  (string-append*
    (for/list ([factor (in-list '(3 5 7))]
               [sound (in-list '("Pling" "Plang" "Plong"))]
               #:when (divides? factor n))
      sound)))
