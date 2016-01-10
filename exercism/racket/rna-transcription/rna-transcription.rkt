#lang racket

(provide
  (contract-out
    [to-rna (-> dna? rna?)]))


(define (dna? strand)
  (string-of? strand '(#\A #\C #\G #\T)))

(define (rna? strand)
  (string-of? strand '(#\A #\C #\G #\U)))

(define (string-of? string allowed-chars)
  (and (string? string)
       (for/and ([char (in-string string)]) (member char allowed-chars))))


(define (to-rna dna)
  (list->string
    (for/list ([c (in-string dna)])
      (match c
        [#\A #\U]
        [#\C #\G]
        [#\G #\C]
        [#\T #\A]))))
