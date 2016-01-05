#lang racket

(provide
  (contract-out
    [anagrams-for (-> string? (listof string?) (listof string?))]))


(define (anagrams-for w ss)
  (filter (curry anagram? w) ss))

(define (anagram? w s)
  (and (not (string-ci=? w s))
       (same-letters? w s)))

(define (same-letters? w s)
  (string-ci=? (string-canonical w) (string-canonical s)))

(define (string-canonical s)
  (list->string (sort (string->list s) char-ci<?)))
