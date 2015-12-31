#lang racket

(provide
  (contract-out
    [etl (-> (and/c hash? natural-keys?)
             hash?)]))

(define (natural-keys? data)
  (for/and ([key (in-hash-keys data)])
    (exact-positive-integer? key)))

(define (etl data)
  (make-hash
    (for*/list
      ([(value letters) (in-hash data)]
       [letter letters])
      (cons (string-downcase letter) value))))
