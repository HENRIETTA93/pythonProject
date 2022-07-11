#lang racket ; <- determines the language (and syntax) used in this file


#|-----------------------------------------------------------------------------
;; Racket at a glance
- LISP/Scheme dialect
  - LISP = "LISt Processing",
           "Lots of Insidious, Silly Parentheses",
           "Lost In a Sea of Parentheses"
- Supports (but does not enforce) functional style
  - First class functions
  - Higher-order functions
  - Anonymous functions
- Dynamically typed but type-safe
- Pass by value with pointer semantics
- Lexically scoped
- Heap-based storage with garbage collection
-----------------------------------------------------------------------------|#

;; a bit of Racket to whet your appetite
(define (quicksort < l)
  (match l
    ['() '()]
    [(cons x xs)
     (let-values ([(xs-gte xs-lt) (partition (curry < x) xs)])
       (append (quicksort < xs-lt)
               (list x)
               (quicksort < xs-gte)))]))


#|-----------------------------------------------------------------------------
;; Basic syntax
The essential syntactic unit of Racket is the *S-expression*, or sexp.
A sexp is either an *atom* or a *list*.
- An atom is one of:
  - a Number
    - e.g., 42, -23, 3.14, 5/8, 2+3i, 6.02e+23
  - a '#' prefixed value
    - e.g., booleans #t and #f, chars #\a, #\newline)
  - a String
    - e.g., "hello", "foo\nbar"
  - a Symbol, written as an identifier made of any chars except #()[]{}|\'"`,;
    - e.g., foo, hot-enough?, <=, list->set, call/cc, bang!!!
- A *list* is a sequence of sexps (recursion!) separated by spaces,
  enclosed by parentheses
  - [] and {} can also be used as delimiters
-----------------------------------------------------------------------------|#

;; Let's write some (syntactically) valid sexps!
;; Note: `#;` is a convenient, special "sexp comment"

#;

#;

#;

#;

#;


#|-----------------------------------------------------------------------------
;; Evaluating sexps
- Numbers, strings, and `#` prefixed values evaluate to themselves
- Symbols are identifiers whose *bindings* are looked up in the current scope
  - If an identifier corresponds to a *variable*, its value is returned
- For lists, if the first element evaluates to a *function*, that function is
  applied to the rest of the values in the list
  - e.g., `(f x y z)` applies function `f` to the values `x`, `y`, and `z`
  - Arguments are passed *by value*; i.e., the argument sexps are evaluated
    first, then their results are passed to the function
- The first element of a list may also be a *special form*, which is applied
  like a function to its arguments, but with special semantics
-----------------------------------------------------------------------------|#

;; try evaluating these sexps:

1

2.5

#t

#\m

+

abs

(+ 300 40)

(abs -23)

(* 2 3 4)

(= (+ 2 3) (- 6 1))

(println "hello world")

(if (< (random 10) 5) ; why can't `if` be a function?
  (println "heads")
  (println "tails"))


#|-----------------------------------------------------------------------------
;; Quoting
The special form `quote` can be used to prevent the normal evaluation of a
sexp, and instead just return the value of the sexp.
`quote` also has the short form `'` (i.e., syntactic sugar):
  (quote x) == 'x
  (quote (1 2 3)) == '(1 2 3)
There is also another special form, `quasiquote`, which can be used with
`unquote` to selectively build sexps with some evaluated sub-sexps.
  (quasiquote x) == `x
  (quasiquote (x (unquote y) z)) == `(x ,y z)
Quasiquoting is particularly useful for metaprogramming!
-----------------------------------------------------------------------------|#

;; try:

(quote x)

'x

'(foo x y z)

'(this is ([x y z])
  (not semantically meaningful Racket code)
  but it [is *syntactically* legal!])

`(x y z)

`(x ,(+ 1 2) y z)


#|-----------------------------------------------------------------------------
;; Variables
Define global variables with `define` and local variables with `let` and `let*`
-----------------------------------------------------------------------------|#

(define course-id "CS 440")

(define w (expt 2 40))

(let ([x 1]
      [y 2])
  (+ w x y))

;; find roots of x^2 + 3x - 4 = (x - 1)(x + 4) = 0
(let* ([a  1]
       [b  3]
       [c -4]
       [disc (- (* b b) (* 4 a c))]
       [sqr-disc (sqrt disc)])
  (values (/ (+ (- b) sqr-disc) (* 2 a))
          (/ (- (- b) sqr-disc) (* 2 a))))


#|-----------------------------------------------------------------------------
;; Pairs and Lists
Programmatically, lists are built out of linked pairs, where a pair is
constructed using the `cons` function:
  (cons x y)
The functions `car` and `cdr` access the first and second slots of a pair.
  (car (cons x y)) => x
  (cdr (cons x y)) => y
A list is either:
- empty (expressed as `null`, `empty`, or `'()`), or
- a pair whose `car` refers to an element and whose `cdr` to a list
Useful functions:
  - `cons`: constructs a pair from an element and a list
  - `car`:  returns the first element of a pair
  - `cdr`:  returns the rest of a pair
  - `list`: constructs a list from a sequence of elements
  - `first`: returns the first element of a non-empty list
  - `rest`:  returns the rest of a non-empty list
  - `list?`: tests whether an object is a list
  - `empty?:`: tests whether a list is empty
-----------------------------------------------------------------------------|#

;; pairs aren't necessarily lists

(define pair1 (cons 1 2))

(define pair2 (cons 3 pair1))

(define pair3 '(1 . 2)) ; `.` indicates that the next value is the cdr of a pair

(define pair4 '(3 1 . 2)) ; = (cons 3 (cons 1 2))


;; build and take apart some lists

(define lst1 '())

(define lst2 (cons 1 '()))

(define lst3 (cons 1 (cons 2 (cons 3 '()))))

(define lst4 (cons 1 (cons "hello" (cons #t '()))))

(define lst5 (list 1 "hello" #t))

(define lst6 '(1 "hello" #t))

(define lst7 '(1 "hello" #t . ()))

#; (define lst8 (list 1 (2 3) ((4 5) (6 7)))) ; what's wrong with this?

(define lst9 '(1 (2 3) ((4 5) (6 7))))

(define lst10 '(a (b (c d) (e f)) g))