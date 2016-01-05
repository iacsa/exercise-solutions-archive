#lang racket

(require (only-in math/number-theory
                  divisor-sum))


(define abundant-numbers
  (list->set (filter 
               ; divisor-sum also counts `n` itself
               (λ (n) (< (* 2 n) (divisor-sum n)))
               (range 2 100000))))

(define (writable-as-sum? n)
  (for/or ([k (in-set abundant-numbers)])
    (set-member? abundant-numbers (- n k))))

(define input-count (read))

(for ([loop (in-range input-count)])
  (displayln (if (writable-as-sum? (read)) "YES" "NO")))
