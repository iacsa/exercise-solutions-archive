#lang racket

(require math/number-theory)
(require racket/generator)

; Memoization is important here, otherwise we'll hit the 10s limit!
(define (memoize f)
  (let ([results (make-hash)])
    (λ args (hash-ref! results args (thunk (apply f args))))))

(define-syntax-rule (define-memoized (name . args) . body)
  (define name (memoize (lambda args . body))))

(define-memoized (divisors-of-nth-triangle-number n)
  (length (divisors (triangle-number n))))

(define (triangle-with-n-divisors n)
  (for/last ([k (in-naturals 2)]
             #:final (< n (divisors-of-nth-triangle-number k)))
            (triangle-number k)))

(define input-count (read))

(for ([loop (in-range input-count)])
  (displayln (triangle-with-n-divisors (read))))
