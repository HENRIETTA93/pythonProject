#lang racket

;;;; part 1
;; rotate
(define (rotate n l_list)
    (cond ((empty? l_list) l_list)
          ((= n 0) l_list)
          (else (rotate (- n 1) (append (cdr l_list) (list (first l_list)))))))


;; lookup
(define (lookup key l_list)
  (if (empty? l_list) #f (if (equal? key (car (car l_list))) (cdr (first l_list)) (lookup key (rest l_list)))))



;; update

(define (update k v l_list)
   (cond ((empty? l_list) (list (cons k v)))
        ((equal? k (car (car l_list))) (list (cons k v) (rest l_list)))
        (else (list (car l_list) (update k v (cdr l_list))))))



;;;; part 2

(((curry (lambda (x y z) (+ x y z)) 1) 2) 3)


(define (my-curry f . rest)
    (letrec((my-curry
            (lambda args
            (cond ((>=(length args)(procedure-arity f))(apply f args))
                  (else(lambda more-args(apply my-curry(append args more-args))))))))
    (cond ((null? rest)my-curry)
          (else (apply my-curry rest)))))


;(define (my-curry f. rest)
  