#lang racket

(provide
  (contract-out
    [word-count (-> string? (hash/c string? natural-number/c))]))

(define (word-count text)
  (for/fold ([acc (hash)])
            ([word (in-list (string-split text))])
    (hash-update acc word add1 0)))
