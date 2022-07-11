#lang racket

(require racket/trace)

#|-----------------------------------------------------------------------------
;; Prelude: user defined types with `struct`
-----------------------------------------------------------------------------|#

;; define a `widget` type
(struct widget          ; type name
  (name purpose price)  ; attributes
  #:transparent)        ; when printing a widget, show its attributes

;; we get the following functions for free:
;; - `widget`: constructor
;; - `widget?`: predicate that returns #t for widget values
;; - `widget-name`: retrieve `name` attribute
;; - `widget-purpose`: retrieve `purpose` attribute
;; - `widget-price`: retrieve `price` attribute

(define w1 (widget "wrench" "wrenching" 9.99))
(define w2 (widget "plier" "pliering" 12.99))


;; define a `doohickey` type that is a sub-type of `widget`
(struct doohickey widget (special-power) #:transparent)

(define d1 (doohickey "thingamajig" "thinging" 199.99 "time travel"))


#|-----------------------------------------------------------------------------
;; Our language

We're going to start with a very simple language and slowly add to it. Our
first iteration will support integer literals, the binary arithmetic operations
 +` and `*`, and `let`-bound variables. The syntax will mirror Racket's. 
-----------------------------------------------------------------------------|#

;; Some test cases
(define p1 '(+ 1 2))

(define p2 '(* 2 (+ 3 4)))

(define p3 '(+ x 1))

(define p4 '(* w (+ x y)))

(define p5 '(let ([x 10])
              (+ x 1)))

(define p6 '(let ([x 10]
                  [y 20])
              (+ x y)))

(define p7 '(let ([x 10])
              (let ([y 20])
                (+ x (let ([w 30])
                       (* w y))))))


#|-----------------------------------------------------------------------------
;; Scanner

Review: What is scanning?
-----------------------------------------------------------------------------|#


#|-----------------------------------------------------------------------------
;; Parser

Review: What is parsing?
-----------------------------------------------------------------------------|#

;;; Some types for decorating our syntax tree

;; integer value
(struct int-exp () #:transparent)

;; arithmetic expression
(struct arith-exp () #:transparent)

;; variable
(struct var-exp () #:transparent)

;; let expression
(struct let-exp () #:transparent)


;; Parser
(define (parse sexp)
  (void))


#|-----------------------------------------------------------------------------
;; Interpreter

Syntax tree => Evaluation
-----------------------------------------------------------------------------|#

;; Interpreter
(define (eval expr)
  (void))