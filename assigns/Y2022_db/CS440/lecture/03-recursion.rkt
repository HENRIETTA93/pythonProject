#lang racket

(require racket/trace) ; for dynamic function call traces


#|-----------------------------------------------------------------------------
;; Recursion
-----------------------------------------------------------------------------|#

;; Fibonacci series: 0 1 1 2 3 5 8 13 21 34 55 ...
(define (fib n)
  (void))

(trace fib)

(define (sum-to n)
  (void))

(trace sum-to)


#|-----------------------------------------------------------------------------
;; On lists

- recursion over lists is an example of "structural recursion"
-----------------------------------------------------------------------------|#

(define (length lst)
  (void))


(define (repeat n x)
  (void))


(define (reverse lst)
  (void))


(define (range n)
  (void))