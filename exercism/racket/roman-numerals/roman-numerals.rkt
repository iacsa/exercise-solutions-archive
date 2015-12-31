#lang racket

(provide
  (contract-out
    [to-roman (-> natural-number/c string?)]))

(define roman-values
  '(("M" . 1000) ("CM" . 900) ("D" . 500)
    ("CD" . 400) ("C" . 100) ("XC" . 90)
    ("L" . 50) ("XL" . 40) ("X" . 10)
    ("IX" . 9) ("V" . 5) ("IV" . 4) ("I" . 1)))

(define (to-roman number)
  (define (aux number romans acc)
    (cond
      [(zero? number) acc]
      [(<= (cdar romans) number)
       (aux (- number (cdar romans))
            romans
            (string-append acc (caar romans)))]
      [else (aux number (cdr romans) acc)]))
  (aux number roman-values ""))
