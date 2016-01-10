#lang racket

(provide
  (contract-out
    [step1 (-> (n-digit? 2) string?)]
    [step2 (-> natural-number/c (listof (n-digit? 3)))]
    [step3 (-> natural-number/c (listof (cons/c natural-number/c symbol?)))]
    [step4 (-> exact? string?)]))

(define (n-digit? n)
  (and/c natural-number/c (</c (expt 10 n))))


(define ONES #("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
(define TEENS #("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "eighteen" "nineteen"))
(define TENS #("" "" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))
(define SYMBOLS '(END thousand million billion trillion quadrillion quintillion sixtillion septillion))

(define (step1 n)
  (match/values (quotient/remainder n 10)
    [(0 one) (vector-ref ONES one)]
    [(1 one) (vector-ref TEENS one)]
    [(ten 0) (vector-ref TENS ten)]
    [(ten one) (format "~a-~a" (vector-ref TENS ten) (vector-ref ONES one))]))

(define (step2 n)
  (define (step2-aux n)
    (match/values (quotient/remainder n 1000)
      [(0 ones) (cons ones '())]
      [(thousands ones) (cons ones (step2-aux thousands))]))
  (reverse (step2-aux n)))

(define (step3 n)
  (reverse
    (for/list ([symbol (in-list SYMBOLS)]
               [value (in-list (reverse (step2 n)))])
      (cons value symbol))))

(define (step4 n)
  (cond
    [(negative? n) (format "negative ~a" (say-number (abs n)))]
    [(positive? n) (say-number n)]
    [(zero? n) "zero"]))


(define (say-3-digit n)
  (match/values (quotient/remainder n 100)
    [(0 ones) (step1 ones)]
    [(hundreds ones) (format "~a hundred ~a" (step1 hundreds) (step1 ones))]))

(define (join-normalize ss)
  (string-normalize-spaces (string-replace (string-join ss " ") "zero" "")))

(define (say-number n)
  (join-normalize
    (for/list ([value+symbol (in-list (step3 n))])
      (define value (car value+symbol))
      (define symbol (cdr value+symbol))
      (format "~a ~a" (say-3-digit value)
              (if (or (zero? value) (eq? symbol 'END)) "" symbol)))))
