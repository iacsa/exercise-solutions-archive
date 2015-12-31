#lang racket

(require math/number-theory)


;;; Just to pre-compute the values, actually really slow

;(define (euler-phi n)
;  (for/fold ([k n])
;            ([p (in-list (prime-divisors n))])
;            (- k (quotient k p))))
;
;(define (permutation? l1 l2)
;  (equal? (sort l1 char<?) (sort l2 char<?)))
;
;(define (anagram? s1 s2)
;  (and
;    (= (string-length s1) (string-length s2))
;    (permutation? (string->list s1) (string->list s2))))
;
;(define (number-permutation pair)
;  (anagram? (number->string (car pair)) (number->string (cdr pair))))
;
;(define N 10000000)
;(for*/fold
;  ([best (cons 21 7/4)])
;  ([n (in-range 22 N)]
;   [phi (in-value (euler-phi n))]
;   #:when (> (cdr best) (/ n phi))
;   #:when (number-permutation (cons n phi)))
;  (displayln n)
;  (cons n (/ n phi)))

;;;

(define N (read))
(define pre-computed
  (list 21 291 2817 2991 4435 20617 45421 69271 75841 162619 176569 284029
        400399 474883 732031 778669 783169 1014109 1288663 1504051 1514419
        1924891 1956103 2006737 2044501 2094901 2239261 2710627 2868469
        3582907 3689251 4198273 4696009 5050429 5380657 5886817 6018163
        6636841 7026037 7357291 7507321 8316907 8319823))

(for/last ([n (in-list pre-computed)] #:break (>= n N)) n)
