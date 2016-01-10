#lang racket

(provide
  (contract-out
    [response-for (-> string? string?)]))


(define (response-for query)
  (cond
    [(shouting? query) "Whoa, chill out!"]
    [(asking? query) "Sure."]
    [(silence? query) "Fine. Be that way!"]
    [else "Whatever."]))

(define (shouting? s)
  (and (string=? s (string-upcase s))
       (not (string=? s (string-downcase s)))))

(define (asking? s)
  (string-suffix? s "?"))

(define (silence? s)
  (not (non-empty-string? (string-trim s))))
