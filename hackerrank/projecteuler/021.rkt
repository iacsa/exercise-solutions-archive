#lang racket

(require math/number-theory)


(define (proper-divisor-sum n)
  (- (divisor-sum n) n))

(define (amicable? n)
  (let ([pds (proper-divisor-sum n)])
    (and (not (= n pds))
         (= n (proper-divisor-sum pds)))))

(define sums (make-vector 100001 0))

(for ([n (in-range 2 100000)])
  (vector-set! sums n (+ (vector-ref sums (sub1 n))
                         (if (amicable? n) n 0))))


(define input-count (read))

(for ([loop (in-range input-count)])
  (displayln (vector-ref sums (read))))
