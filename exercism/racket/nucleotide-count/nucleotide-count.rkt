#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts dna)
  (let ([counts (count-into-hash dna)])
    (unless (for/and ([c (in-hash-keys counts)]) (member c '(#\A #\C #\G #\T)))
      (error "nucleotide-counts: Invalid nucleotide in DNA-string"))
    (for/list ([c (in-string "ACGT")])
      (cons c (hash-ref counts c 0)))))

(define (count-into-hash dna)
  (for/fold ([acc (hash)])
            ([c (in-string dna)])
    (hash-set acc c (add1 (hash-ref acc c 0)))))
