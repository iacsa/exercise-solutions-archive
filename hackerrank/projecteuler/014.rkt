#lang racket

; For precomputation only!
;
; Memoize away!
;(define (memoize f)
;  (let ([results (make-hash)])
;    (λ args (hash-ref! results args (thunk (apply f args))))))
;
;(define-syntax-rule (define-memoized (name . args) . body)
;  (define name (memoize (lambda args . body))))
;
;(define-memoized (collatz n)
;  (cond
;    [(= n 1) 1]
;    [(even? n) (add1 (collatz (quotient n 2)))]
;    [(odd? n) (add1 (collatz (add1 (* 3 n))))]))
;
;(define best '(1))
;
;(for ([loop (in-range 2 5000000)])
;  (when (>= (collatz loop) (collatz (car best)))
;    (set! best (cons loop best))))
;
; best

(define best '(3732423 3542887 3064033 2298025 1723519 1564063 1501353 1126015 1117065 837799 626331 511935 410011 230631 216367 156159 142587 106239 77031 52527 35655 35497 34239 26623 23529 17673 17647 13255 10971 6171 3711 2919 2463 2323 2322 2223 1161 871 703 667 655 654 649 327 313 235 231 171 129 97 73 55 54 27 25 19 18 9 7 6 3 2 1))

(define input-count (read))

(for ([loop (in-range input-count)])
  (define n (read))
  (displayln (for/last ([m (in-list best)]
                        #:final (<= m n))
                       m)))
