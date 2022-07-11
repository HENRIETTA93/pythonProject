#lang racket

(require racket/trace)


#|-----------------------------------------------------------------------------
;; Higher-order functions (HOFs)

HOFs either take a function as an argument or return a function.

Some useful built-in HOFs and related functions:
- `apply`: apply a function to a list of arguments
- `curry`: returns a version of a function that can be partially applied
- `compose`: returns a function that is the composition of two other functions
- `eval`: evaluates a sexp
-----------------------------------------------------------------------------|#

;; `apply` applies a function to lists
#; (values
    (apply + '(1 2 3))
    (apply + 1 2 '(3))
    (apply + 1 2 3 '())) ; the last argument to `apply` has to be a list


;; `curry` gives us partial application
#; (values
    (cons 1 2)
    (curry cons 1 2)
    ((curry cons) 1 2)
    (((curry cons) 1) 2)
    ((curry cons 1) 2))

#; (((curry (lambda (x y z) (+ x y z)) 1) 2) 3)


;; compose is a simple but powerful form of "functional "glue"
#; ((compose sqrt abs) -2)


;; eval is like having access to the Racket compiler in Racket!
#; (values
    (eval '(+ 1 2 3))
    (eval (cons 'println (cons "hello" '()))))


#|-----------------------------------------------------------------------------
;; Some list-processing HOFs
-----------------------------------------------------------------------------|#

#; (map (curry * 2) (range 10))
#; (map (lambda (r) (circle r "solid" "blue")) (range 10))

#; (filter even? (range 10))
#; (filter (curry < 5) (range 10))

#; (foldr + 0 (range 10))
#; (foldl - 0 (range 10))
#; (foldr / 1 '(2 3 4))

#; (foldl + 0 (range 10))
#; (foldl - 0 (range 10))
#; (foldl / 1 '(2 3 4))


#|-----------------------------------------------------------------------------
;; Lexical scope

- A free variable is bound to a value *in the environment where it is defined*, 
  regardless of when it is used
- This leads to one of the most important ideas we'll see: the *closure*
-----------------------------------------------------------------------------|#