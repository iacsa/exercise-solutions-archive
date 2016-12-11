#lang racket

(provide
  (contract-out
    [list-allergies (->i ([bitmask natural-number/c])
                         [allergies () (listof string?)])])
  (contract-out
    [allergic-to? (->i ([allergy string?]
                        [bitmask natural-number/c])
                       #:pre (allergy) (member allergy allergies)
                       [allergic? () boolean?])]))

(define allergy-codes (make-hash '(("eggs" . 0) ("peanuts" . 1) ("shellfish" . 2) ("strawberries" . 3)
                                   ("tomatoes" . 4) ("chocolate" . 5) ("pollen" . 6) ("cats" . 7))))
(define allergies (hash-keys allergy-codes))

(define (list-allergies bitmask)
  (filter (λ (a) (allergic-to? a bitmask)) allergies))

(define (allergic-to? allergy bitmask)
  (bitwise-bit-set? bitmask (hash-ref allergy-codes allergy)))
