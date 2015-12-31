#lang racket


(define (difference n)
  (let ([term (sub1 (* n n))])
    (+ (* n n (/ term 4)) (* n (/ term 6)))))

(for* ([number-of-cases (in-value (read))]
       [iter (in-range number-of-cases)]
       [n (in-value (read))])
  (displayln (difference n)))
