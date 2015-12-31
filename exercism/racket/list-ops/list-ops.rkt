#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-fold f acc xs)
  (if (null? xs)
    acc
    (my-fold f (f (car xs) acc) (cdr xs))))

(define (my-length xs)
  (my-fold (λ (x acc) (add1 acc)) 0 xs))

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
