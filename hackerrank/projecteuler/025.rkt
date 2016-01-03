#lang racket

; Memoize away!
(define (memoize f)
  (let ((results (make-hash)))
    (λ args (hash-ref! results args (thunk (apply f args))))))

(define-syntax define-memoized
  (syntax-rules ()
    [(_ (name . args) . body)
     (define name (memoize (lambda args . body)))]))

(define-memoized (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

(define (digit-count n)
  (add1 (/ (log n) (log 10))))

(define-memoized (with-n-digits n)
  (if (= n 1)
    1
    (for/last ([k (in-naturals (with-n-digits (sub1 n)))])
              #:final (<= n (digit-count (fib k)))
              k)))


(define input-count (read))

(for ([loop (in-range input-count)])
  (displayln (with-n-digits (read))))
