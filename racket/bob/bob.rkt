#lang racket

(provide response-for)

(define (response-for query)
  (cond
    [(shouting? query) "Whoa, chill out!"]
    [(string-suffix? query "?") "Sure."]
    [(silence? query) "Fine. Be that way!"]
    [#t "Whatever."]))

(define (shouting? s)
  (and (string=? s (string-upcase s))
       (not (string=? s (string-downcase s)))))

(define (silence? s)
  (not (non-empty-string? (string-trim s))))
