#lang racket

(require math/number-theory)

(define limit (read))

(with-modulus 10000000000
  (mod (for/sum
         ([loop (in-range 1 (add1 limit))])
         (modexpt loop loop))))
