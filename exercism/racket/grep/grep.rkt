#lang racket

(provide
  (contract-out
    [grep-file (-> path-string?
                   regexp?
                   (listof (cons/c natural-number/c string?)))]))


(module+ main
  (match (current-command-line-arguments)
    [(vector pattern files ...)
     (define regex (regexp pattern))
     (for ([file (in-list files)])
       (print-grep-results file regex))]
    [_ (error "grep.rkt: Use \"racket grep.rkt PATTERN FILE ...\"")]))


(define (grep-file file regex)
  (for/list ([nr (in-naturals 1)]
             [line (in-list (file->lines file))]
             #:when (regexp-match? regex line))
    (cons nr line)))

(define (print-grep-results file regex)
  (for ([grep-match (in-list (grep-file file regex))])
    (printf "~a ~a: ~a~n" file (car grep-match) (cdr grep-match))))
