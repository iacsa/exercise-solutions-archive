#lang racket

(provide
  (contract-out
    [my-length (-> list? natural-number/c)]
    [my-reverse (-> list? list?)]
    [my-map (-> procedure? list? list?)]
    [my-filter (-> procedure? list? list?)]
    [my-fold (-> procedure? any/c list? any/c)]
    [my-append (-> list? list? list?)]
    [my-concatenate (-> (listof list?) list?)]))


(define (my-fold f acc xs)
  (match xs
    [(cons hd tl) (my-fold f (f hd acc) tl)]
    ['() acc]))

(define (my-length xs)
  (my-fold (λ (_ acc) (add1 acc)) 0 xs))

(define (my-reverse xs)
  (my-fold cons '() xs))

(define (my-map f xs)
  (my-reverse (my-fold (λ (x acc) (cons (f x) acc)) '() xs)))

(define (my-filter p xs)
  (my-reverse (my-fold (λ (x acc) (if (p x) (cons x acc) acc)) '() xs)))

(define (my-append xs ys)
  (my-fold cons ys (my-reverse xs)))

(define (my-concatenate xss)
  (my-fold my-append '() (my-reverse xss)))
