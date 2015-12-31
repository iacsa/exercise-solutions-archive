#lang racket

(provide convert)

(define (convert n)
  (match (sounds n)
    ["" (number->string n)]
    [(var sounds) sounds]))

(define (divides? p n)
  (zero? (modulo n p)))

(define (sounds n)
  (for/fold ([acc ""])
            ([factor (in-list '(3 5 7))]
             [sound (in-list '("Pling" "Plang" "Plong"))])
    (if (divides? factor n)
      (string-append acc sound)
      acc)))
