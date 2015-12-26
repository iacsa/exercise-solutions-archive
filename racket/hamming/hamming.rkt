#lang racket

(provide
  (contract-out
    [hamming-distance (->i ([s1 string?] [s2 string?])
                           #:pre (s1 s2) (equal-string-length? s1 s2)
                           [distance () natural-number/c])]))

(define (equal-string-length? s1 s2)
  (= (string-length s1) (string-length s2)))

(define (hamming-distance s1 s2)
  (for/sum ([c1 (in-string s1)]
            [c2 (in-string s2)])
           (if (char=? c1 c2) 0 1)))
