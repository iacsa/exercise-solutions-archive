#lang racket/base

;; Converts integers to English-language descriptions

;; --- NOTE -------------------------------------------------------------------
;; The test cases in "say-test.rkt" assume:
;; - Calling a function with an out-of-range argument triggers a contract error
;; - That `step3` returns a list of (number, symbol) pairs
;;
;; We have provided sample contracts so the tests compile, but you
;;  will want to edit & strengthen these.
;;
;; (For example, things like 0.333 and 7/8 pass the `number?` contract
;;  but these functions expect integers and natural numbers)
;; ----------------------------------------------------------------------------

(require racket/contract)

(provide (contract-out
  [step1 (-> (n-digit? 2) string?)]
  ;; Convert a positive, 2-digit number to an English string

  [step2 (-> number? (listof (n-digit? 3)))]
  ;; Divide a large positive number into a list of 3-digit (or smaller) chunks

  [step3 (-> number? (listof (cons/c number? symbol?)))]
  ;; Break a number into chunks and insert scales between the chunks

  [step4 (-> number? string?)]
  ;; Convert a number to an English-language string
))

;; =============================================================================


(define ONES #("" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
(define TEENS #("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "eighteen" "nineteen"))
(define TENS #("" "" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))
(define SYMBOLS '(END thousand million billion trillion quadrillion quintillion sixtillion septillion))

(define (step1 n)
  (let-values ([(ten one) (quotient/remainder n 10)])
    (cond
      [(zero? n) "zero"]
      [(< n 10) (vector-ref ONES n)]
      [(< n 20) (vector-ref TEENS (- n 10))]
      [(= one 0) (vector-ref TENS ten)]
      [else (format "~a-~a" (vector-ref TENS ten) (vector-ref ONES one))])))

(define (step2 N)
  (define (step2-aux N)
    (let-values ([(thousands ones) (quotient/remainder N 1000)])
      (if (zero? thousands)
        (cons ones '())
        (cons ones (step2-aux thousands)))))
  (reverse (step2-aux N)))

(define (step3 n)
  (reverse
    (for/list ([symbol (in-list SYMBOLS)]
               [value (in-list (reverse (step2 n)))])
      (cons value symbol))))

(define (step4 N)
  (define (say-3-digit-number n)
    (let-values ([(hundreds ones) (quotient/remainder n 100)])
      (cond
        [(zero? hundreds) (step1 ones)]
        [(zero? ones) (format "~a hundred" (step1 hundreds))]
        [else (format "~a hundred ~a" (step1 hundreds) (step1 ones))])))
  (string-trim-front
    (for/fold ([acc (if (< N 0) "negative" "")])
              ([value+symbol (in-list (step3 (abs N)))])
      (let* ([value (car value+symbol)]
             [symbol (cdr value+symbol)]
             (english (say-3-digit-number value)))
        (cond
          [(and (zero? value) (string=? "" acc)) "zero"]
          [(zero? value) acc]
          [(eq? symbol 'END) (format "~a ~a" acc english)]
          [else (format "~a ~a ~a" acc english symbol)])))))

(define (n-digit? n)
  (and/c
    natural-number/c
    (λ (k) (< k (expt 10 n)))))

(define (string-trim-front str)
  (let ([ss (string->list str)])
    (list->string
      (if (char=? (car ss) #\ )
        (cdr ss)
        ss))))
