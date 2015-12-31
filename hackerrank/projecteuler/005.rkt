#lang racket


(define (smallest-multiple n)
  (apply lcm (range 1 (add1 n))))

(for* ([number-of-cases (in-value (read))]
       [iter (in-range number-of-cases)]
       [n (in-value (read))])
  (displayln (smallest-multiple n)))
