#lang racket

(require math/number-theory)


(define (max-prime-factor n)
  (last (prime-divisors n)))

(for* ([number-of-cases (in-value (read))]
       [iter (in-range number-of-cases)]
       [n (in-value (read))])
  (displayln (max-prime-factor n)))
