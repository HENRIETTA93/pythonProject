#lang racket

(require rackunit
         "mp1.rkt")


(test-case "rotate"
           (check-equal? (rotate 3 '(1 2 3 4 5 6 7 8 9))
                         '(4 5 6 7 8 9 1 2 3))
           (check-equal? (rotate 2 '((a) (b (c)) (d e)))
                         '((d e) (a) (b (c)))))

(test-case "lookup"
           (check-equal? (lookup 'a '((a . apple) (b . bee) (c . cat)))
                         'apple)
           (check-equal? (lookup 2 '((1 . "one") (2 "two" "three") (4 "four" "five")))
                         '("two" "three"))
           (check-equal? (lookup 'foo '((a . apple) (2 . "two")))
                         #f))

(test-case "update"
           (check-equal? (update 'a 'apple '((b . bee) (c . cat)))
                         '((b . bee) (c . cat) (a . apple)))
           (check-equal? (update 'a "auto" '((a . apple) (b . bee) (c . cat)))
                         '((a . "auto") (b . bee) (c . cat)))
           (check-equal? (update 1 (list 100 200 300) '())
                         '((1 100 200 300))))


(test-case "equal-shape?"
           (check-true (equal-shape? '(1 2 3) '(2 3 4)))
           (check-false (equal-shape? '(1 2 3) '(2 3 4 5)))
           (check-true (equal-shape? '(1 (a b) ((#f)) "d" e) 
                                     '(2 ("a" "b") ((100)) f g)))
           (check-false (equal-shape? '(a (b . c) d) '(a (b c) d))))

(test-case "my-map"
           (define lst1 (range 10))
           (define lst2 '(() (a b c) (a b) ()))
           (check-equal? (my-map (curry + 2) lst1) (map (curry + 2) lst1))
           (check-equal? (my-map length lst2) (map length lst2)))

(test-case "my-filter"
           (define lst1 (range 10))
           (define lst2 '(() (a b c) (a b) ()))
           (check-equal? (my-filter even? lst1) (filter even? lst1))
           (check-equal? (my-filter (compose not empty?) lst2) (filter (compose not empty?) lst2)))


(test-case "test-currying"
           (define f1 (lambda (x) (+ x 100)))
           (define f2 (lambda (x y) (* x y)))
           (define f3 (lambda (x y z) (* x (+ y z))))
           (check-equal? ((my-curry (lambda () #t))) #t)
           (check-equal? (my-curry f1 1) 101)
           (check-equal? ((my-curry f1) 1) 101)
           (check-equal? (my-curry f2 1 2) 2)
           (check-equal? ((my-curry f2) 1 2) 2)
           (check-equal? (((my-curry f2) 1) 2) 2)
           (check-equal? (my-curry f3 2 3 4) 14)
           (check-equal? ((my-curry f3 2 3) 4) 14)
           (check-equal? ((my-curry f3 2) 3 4) 14)
           (check-equal? (((my-curry f3 2) 3) 4) 14)
           (check-equal? ((((my-curry f3) 2) 3) 4) 14))

(test-case "test-make-object"
           (define obj (make-object 'foo))
           (obj 'set 'name 'bar)
           (obj 'set 'x 42)
           (obj 'update 'x (lambda (x) (* x 100)))
           (obj 'set 'y 100)
           (check-equal? (obj 'get 'name) 'bar)
           (check-equal? (obj 'get 'x) 4200)
           (check-equal? (obj 'get 'y) 100))

(test-case "test-my-eval-1"
           (define rexp '(lambda (x) x))
           (define val (my-eval rexp))
           (define res (val 42))
           (check-equal? res 42))

(test-case "test-my-eval-2"
           (define rexp '((lambda (x) x) (lambda (y) y)))
           (define val (my-eval rexp))
           (define res (val 42))
           (check-equal? res 42))

(test-case "test-my-eval-3"
           (define exp '(lambda (f) 
                          (lambda (x) 
                            (f (f x)))))
           (define val (my-eval exp))
           (define res ((val (lambda (x) (* x x))) 8))
           (check-equal? res 4096))

(test-case "test-free-1"
           (define exp '(lambda (x) y))
           (check-equal? (free exp) '(y)))

(test-case "test-free-1"
           (define exp '((lambda (x) y) (lambda (y) z)))
           (check-equal? (list->set (free exp)) (set 'y 'z)))

(test-case "test-free-2"
           (define exp '(lambda (x)
                          (lambda (y)
                            ((lambda (z) (x (w z))) (y z)))))
           (check-equal? (list->set (free exp)) (set 'w 'z)))
