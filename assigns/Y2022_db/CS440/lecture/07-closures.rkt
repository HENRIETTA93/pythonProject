#lang racket

#|-----------------------------------------------------------------------------
;; Adding Functions & Closures

We will add functions (as lambda expressions) and function applications to our
language. Our functions will have exactly one formal parameter each.

E.g.,

- lambda definition: `(lambda (x) (+ x 1))`

- function application: `((lambda (x) (+ x 1)) 10)`

Though our language will not support named functions a la Racket's `define`,
we can use `let` to bind identifiers to lambdas. E.g.,

  (let ([f (lambda (x) (+ x 1))])
    (f 10))
-----------------------------------------------------------------------------|#

;; Some test cases (what should they evaluate to?)
(define p1 '(lambda (x) (+ x 1)))

(define p2 '((lambda (x) (+ x 1)) 10))

(define p3 '(let ([f (lambda (x) (+ x 1))])
              (f 10)))

;; p4-p5 for testing strict/lazy eval
(define p4 '(let ([x (+ 1 2)])
              20))

(define p5 '(let ([f (lambda (x) 10)])
              (f (+ 1 2))))

;; p6-p9 for testing closures
(define p6 '(let ([x 10])
              (lambda (y) (+ x y))))

(define p7 '(let ([x 10])
              ((lambda (y) (+ x y)) 20)))

(define p8 '(let ([f (let ([x 10])
                       (lambda (y) (+ x y)))])
              (let ([x 20])
                (f x))))

(define p9 '(let ([f (let ([x 10])
                       (lambda (y) (+ x y)))])
              (f 20)))


;; integer value
(struct int-exp (val) #:transparent)

;; arithmetic expression
(struct arith-exp (op lhs rhs) #:transparent)

;; variable
(struct var-exp (id) #:transparent)

;; let expression
(struct let-exp (ids vals body) #:transparent)

;; lambda expression
(struct lambda-exp () #:transparent)

;; function application
(struct app-exp () #:transparent)


;; Parser
(define (parse sexp)
  (match sexp
    ;; integer literal
    [(? integer?)
     (int-exp sexp)]

    ;; arithmetic expression
    [(list (and op (or '+ '*)) lhs rhs)
     (arith-exp (symbol->string op) (parse lhs) (parse rhs))]
    
    ;; identifiers (variables)
    [(? symbol?)
     (var-exp sexp)]

    ;; let expressions
    [(list 'let (list (list id val) ...) body)
     (let-exp (map parse id) (map parse val) (parse body))]
    
    ;; lambda expressions
    [_ (void)]

    ;; function application
    [_ (void)]

    ;; basic error handling
    [_ (error (format "Can't parse: ~a" sexp))]))


;; Interpreter
(define (eval expr)
  (let eval-env ([expr expr]
                 [env '()])
    (match expr
      ;; int literals
      [(int-exp val) val]

      ;; arithmetic expressions
      [(arith-exp "+" lhs rhs)
       (+ (eval-env lhs env) (eval-env rhs env))]
      [(arith-exp "*" lhs rhs)
       (* (eval-env lhs env) (eval-env rhs env))]         

      ;; variable binding
      [(var-exp id)
       (let ([pair (assoc id env)])
         (if pair
             (cdr pair)
             (error (format "~a not bound!" id))))]

      ;; let expression with multiple variables
      [(let-exp (list (var-exp id) ...) (list val ...) body)
       (let ([vars (map cons id
                        (map (lambda (v)
                               (eval-env v env))
                             val))])
         (eval-env body (append vars env)))]

      ;; lambda expression
      [_ (void)]
      
      ;; function application
      [_ (void)]

      ;; basic error handling
      [_ (error (format "Can't evaluate: ~a" expr))])))


;; REPL
(define (repl)
  (let ([stx (parse (read))])
    (when stx
      (println (eval stx))
      (repl))))