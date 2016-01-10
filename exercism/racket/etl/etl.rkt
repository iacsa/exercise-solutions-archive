#lang racket

(provide
  (contract-out
    [etl (-> (hash/c natural-number/c (listof string?))
             (hash/c string? natural-number/c))]))


(define (etl data)
  (for*/hash
    ([(value letters) (in-hash data)]
     [letter (in-list letters)])
    (values (string-downcase letter) value)))
