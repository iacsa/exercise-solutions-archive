#lang racket

; We don't need the number of rabbits.
(define _ (read-line))

; Needed for eval
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

; Eval on user input :-S
(eval (call-with-input-string
        (string-append "(lcm " (read-line) ")")
        read)
      ns)
