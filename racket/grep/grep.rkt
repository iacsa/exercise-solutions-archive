#lang racket

(provide
  (contract-out
    [grep-file (-> path-string? regexp? (listof (cons/c natural-number/c string?)))]))
  ;; Find lines in a file matching a regular expression pattern.
  ;; Output is a list of pairs containing the number and contents of
  ;;  each matching line.

;; =============================================================================

(module+ main
  (match (current-command-line-arguments)
    [(vector pattern files ...)
     (let ([regex (regexp pattern)])
       (for ([file (in-list files)])
         (print-grep-results file regex)))]
    [_ (error "grep.rkt: Use \"racket grep.rkt PATTERN FILE ...\"")]))

(define (grep-file file regex)
  (reverse
    (for/fold ([acc '()])
              ([nr (in-naturals 1)]
               [line (in-list (file->lines file))]
               #:when (regexp-match? regex line))
      (cons (cons nr line) acc))))

(define (print-grep-results file regex)
  (for ([line (in-list (grep-file file regex))])
    (printf "~a ~a: ~a~n" file (car line) (cdr line))))
