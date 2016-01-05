#lang racket

(require (only-in racket/date
                  date->seconds))


(provide
  (contract-out
    [add-gigasecond (-> date? date?)]))


(define (add-gigasecond date)
  (seconds->date (+ (date->seconds date) (expt 10 9))))
