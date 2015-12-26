#lang racket

(provide word-count)

;(define (word-count text)
;  (let ([words (string-split text)])
;    (make-hash
;      (remove-duplicates
;        (map (λ (w) (cons w (count (curry string=? w) words))) words)))))


;(define (mutable-to-immutable-hash table)
;  (apply hash
;    (flatten
;      (for/list ([(k v) (in-hash table)])
;        (list k v)))))

(define (word-count text)
  (for/fold ([acc (hash)])
            ([word (in-list (string-split text))])
    (hash-set acc word (add1 (hash-ref acc word 0)))))
