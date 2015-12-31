#lang racket

(provide to-rna)

(define (to-rna dna)
  (list->string
    (for/list ([c (in-string dna)])
      (match c
        [#\A #\U]
        [#\C #\G]
        [#\G #\C]
        [#\T #\A]
        [_ (error "to-rna: Invalid character in dna-string.")]))))
