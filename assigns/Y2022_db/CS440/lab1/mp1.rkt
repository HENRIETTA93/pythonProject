#lang racket

(provide (all-defined-out)) ; export all top-level definitions for testing

;;;;; Part 1: Recursion and Lists

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
        ((equal? k (car (car l_list))) (cons (cons k v) (cdr l_list)))
        (else (cons (car l_list) (update k v (rest l_list))))))


;; equal-shape
(define (equal-shape? sp1 sp2)
    (cond ((and (pair? sp1) (pair? sp2))
           (and (equal-shape? (car sp1) (car sp2))
               (equal-shape? (cdr sp1) (cdr sp2))
               ))
            ((or (pair? sp1) (pair? sp2))
               #f)
               (else #t)))


;;;;; Part 2: Higher Order Functions

(define (my-curry f . rest)
  void)


(define (my-map f lst)
  '())


(define (my-filter pred lst)
  '())


(define (make-object name)
  void)


;;;;; Part 3: Meta-circular Evaluator

(define (my-eval rexp)
  (let my-eval-env ([rexp rexp]
                    [env '()])           ; environment (assoc list)
    (cond [(symbol? rexp)                ; variable
           void]
          [(eq? (first rexp) 'lambda)    ; lambda expression
           void]
          [else                          ; function application
           void])))


;;;;; Part 4: Free Variables

(define (free sexp)
  '())
