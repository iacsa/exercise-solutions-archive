#lang racket

(provide word-count)

(define (word-count text)
  (for/fold ([acc (hash)])
            ([word (in-list (string-split text))])
    (hash-set acc word (add1 (hash-ref acc word 0)))))
