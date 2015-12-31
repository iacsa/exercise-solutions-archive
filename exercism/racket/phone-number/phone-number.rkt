#lang racket

(provide numbers area-code pprint)

(define (numbers num)
  (let* ([num (list->string (filter char-numeric? (string->list num)))]
         [len (string-length num)])
    (cond
      [(= 10 len) num]
      [(and (= 11 len) (string-prefix? num "1")) (substring num 1)]
      [else "0000000000"])))

(define (area-code num)
  (substring (numbers num) 0 3))

(define (pprint num)
  (let ([num (numbers num)])
    (format "(~a) ~a-~a"
      (substring num 0 3)
      (substring num 3 6)
      (substring num 6))))
