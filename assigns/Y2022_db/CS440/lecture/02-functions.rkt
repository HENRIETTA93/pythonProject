#lang racket

#|-----------------------------------------------------------------------------
;; Function definitions

- `lambda`: creates an anonymous function
- `define` supports a special syntax for binding variables to functions
-----------------------------------------------------------------------------|#

(define f1 (lambda (x) (+ x 1)))

(define f2 (lambda (x y z)
             (println x)
             (println y)
             (println z)
             (* x (+ y z))))

(define (f3 x) (add1 x))

(define (f4 x y z)
  (println x)
  (println y)
  (println z)
  (* x (+ y z)))


;; `values` and `let-values` can be used to return/retrieve multiple values
;; from/to a function call.
(define (quad-roots a b c)
  (let* ([disc (- (* b b) (* 4 a c))]
         [sqr-disc (sqrt disc)])
    (values (/ (+ (- b) sqr-disc) (* 2 a))
            (/ (- (- b) sqr-disc) (* 2 a)))))

(define (test-quad-roots r1 r2)
  (let ([a 1] [b (- (+ r1 r2))] [c (* r1 r2)]) ; based on (x + r1)(x + r2)
    (let-values ([(rr1 rr2) (quad-roots a b c)])
      (println rr1)
      (println rr2))))


;; "rest" arguments
(define (f5 x y . z) ; `z` is a list of any & all args after `x` and `y`
  (println x)
  (println y)
  (println z))

(define (f6 . rest)
  (length rest))


;; lambda expressions also support rest arguments
(define f7
  (lambda args ; `args` is a list of all the arguments
    (length args)))

(define f8
  (lambda (x . rest)
    (println x)
    (println rest)))


#|-----------------------------------------------------------------------------
;; Some more special forms

- `if`: if-then-else
- `begin`: sequences multiple sexps; evaluates to the result of the last
- `when`: if-then
- `cond`: multi-way conditional
- `case`: dispatch
- `match`: pattern match
- `set!`: mutation!
-----------------------------------------------------------------------------|#

(define (say-hi-1 name)
  (if (equal? name "Jane")
      (println "Me Tarzan!")
      (println (format "Hello, ~a" name))))


;; digression: equality testing
(list
 (list
  ;; `=` for numbers
  (= 2 2)
  (= 2 2.0)
  (= 2 2.01)
  (= 2 2.0000000000000000001)
  (= 2 8/4))

 (list
  ;; `eq?` for pointer comparison
  (eq? 'a 'a)
  (eq? "hello world" "hello world")
  (eq? '(a b c) '(a b c))
  (let ([lst '(a b c)])
    (eq? lst lst)))

 (list
  ;; `equal?` for value comparison
  (equal? "hello world" "hello world")
  (equal? '(a b c) '(a b c))))
 

(define (say-hi-2 name)
  (if (equal? (string-ref name 0) #\J)
      (begin (println "Me Tarzan!")
             (println (format "You ~a!" name)))
      (println (format "Hello, ~a" name))))


(define (say-hi-3 name)
  (when (regexp-match? #rx"^Jan.*" name)
    (println "Me Tarzan!")
    (println (format "You ~a!" name))))


(define (say-hi-4 name)
  (cond [(equal? name "Jane")
         (println "Me Tarzan!")]
        [(regexp-match? #rx"^Jan.*" name)
         (println (format "You ~a?" name))]
        [else
         (println (format "Hello, ~a" name))]))


(define (say-hi-5 name)
  (case (char-downcase (string-ref name 0))
    [(#\j) (println "Me Tarzan!")]
    [(#\a #\e #\i #\o #\u) (println "Ewoh!")]
    [else (println (format "Hello, ~a" name))]))


(define (say-hi-6 name)
  (match name
    ["Jane" (println "Me Tarzan!")]
    [(regexp #rx"^Jan.*") (println "Me Tarzan?")]
    [(? string?) (println (format "Hello, ~a" name))]
    [(list x y) (println (format "Hello, ~a and ~a" x y))]
    [(list "Jane") (println "Hello, Jane-in-a-list")]
    [(list "Jane" x "Jane") (println (format "Hello, ~a-between-Janes" x))]
    [(list x y x) (println (format "Hello, ~a-between-~as" y x))]
    [(list _ _ _ "Jane") (println "Hi, Jane in 4th place")]
    [(or 'Jane '(Jane)) (format "Hi, Jane in hiding")]
    [_ (println "Stranger, Danger!")]))


(define (say-hi-7 name)
  (let ([greetings '("Hello" "Hola" "你好")]
        [index 0])
    (lambda ()
      (println (format "~a, ~a" (list-ref greetings index) name))
      (set! index (remainder (add1 index) (length greetings))))))
