#lang racket

(require math/number-theory)

(define input-count (read))

(for ([loop (in-range input-count)])
  (let ([n (read)]
        [m (read)])
    (displayln (remainder (binomial (+ m n) m)
                          (+ 1000000007)))))
