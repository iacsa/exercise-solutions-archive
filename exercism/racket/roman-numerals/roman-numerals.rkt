#lang racket

(provide
  (contract-out
    [to-roman (-> natural-number/c string?)]))


(define roman-numerals
  '(("M" . 1000) ("CM" . 900) ("D" . 500)
    ("CD" . 400) ("C" . 100) ("XC" . 90)
    ("L" . 50) ("XL" . 40) ("X" . 10)
    ("IX" . 9) ("V" . 5) ("IV" . 4) ("I" . 1)))

(define digit car)
(define value cdr)

(define (to-roman number)
  (string-append*
    (for/list ([roman (in-list roman-numerals)])
      (define-values (q r) (quotient/remainder number (value roman)))
      (set! number r)
      (string-append* (make-list q (digit roman))))))
