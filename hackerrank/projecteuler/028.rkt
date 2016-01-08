#lang racket


(define (spiral-diagonals n)
  (modulo (/ (+ (* 4 n n n)
                (* 3 n n)
                (* 8 n)
                -9)
             6)
          1000000007))


(define input-count (read))

(for ([loop (in-range input-count)])
  (displayln (spiral-diagonals (read))))
