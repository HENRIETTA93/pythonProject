
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




(define (equal-shape? shape1 shape2)
  (cond ((and(pair? shape1)(pair? shape2))
         (and (equal-shape?(car shape1)(car shape2))
              (equal-shape?(cdr shape1)(cdr shape2))))
        ((or (pair? shape1)(pair? shape2))
  #f)
        (else #true)))


(define (equal-shape? shape1 shape2)
  (if (equal? (list? shape1) (list? shape2)) (if (list? shape1) (if (equal? (empty? shape1) (empty? shape2)) (if (empty? shape1) #t (and (equal-shape? (car shape1) (car shape2)) (equal-shape? (cdr shape1) (cdr shape2)))) #f) #t) #f))


(define (update key value lst)
  (if (empty? lst) (list (cons key value)) (if (equal? key (car (car lst))) (list (cons key value) (cdr lst)) (list (car lst) (update key value (cdr lst))))))


(define (lookup key l_list)
  (cond ((empty? l_list)
  #f)
        ((equal? (caar lst)key)(cdar lst))
        (else (lookup key(cdr lst)))))


(define (lookup key l_list)
  (if (empty? l_list) #f (if (equal? key (car (car l_list))) (cdr (first l_list)) (lookup key (rest l_list)))))

(define (lookup key l_list)
   (cond ((empty? l_list)
   #f)
  (if (empty? l_list) #f (if (equal? key (car (car lst))) (cdr (first lst)) (lookup key (cdr lst)))))