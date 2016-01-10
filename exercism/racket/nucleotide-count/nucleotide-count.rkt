#lang racket

(provide
  (contract-out
    [nucleotide-counts
      (-> string? (listof (cons/c char? natural-number/c)))]))

(define nucleotides '(#\A #\C #\G #\T))

(define (nucleotide-counts dna)
  (let ([counts (count-into-hash dna)])
    (unless (for/and ([c (in-hash-keys counts)]) (member c nucleotides))
      (error "nucleotide-counts: Invalid nucleotide in DNA-string"))
    (for/list ([c (in-list nucleotides)])
      (cons c (hash-ref counts c 0)))))

(define (count-into-hash dna)
  (for/fold ([acc (hash)])
            ([c (in-string dna)])
    (hash-update acc c add1 0)))
