#lang racket

(provide perfect-numbers)

(require math/number-theory)

(define (perfect-numbers n)
  (stream->list
    (stream-filter 
      (λ (n) (= n (sum-of-divisors n)))
      (in-range 2 (add1 n)))))

; The divisors procedure includes n itself, so we need to subtract it
(define (sum-of-divisors n)
  (- (apply + (divisors n)) n))
