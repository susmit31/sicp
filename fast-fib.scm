(define % remainder)

(define (even? n) 
    (if (= (% n 2) 1) #f
        #t
    )
)

(define (make-transfm p q)
    (lambda (a b)
        (cons (+ (* (+ p q) a) (* q b))
                (+ (* q a) (* p b))
        )
    )
)

(define (get-idx t i)
    (if (= i 1) (cdr (t 0 1))
        (car (t 0 1))
    )
)

(define (*transfm t1 t2)
    (define p1 (get-idx t1 1))
    (define p2 (get-idx t2 1))
    (define q1 (get-idx t1 2))
    (define q2 (get-idx t2 2))
    (make-transfm (+ (* p1 p2) (* q1 q2)) 
                (+ (* q1 p2) (* p1 q2) (* q1 q2))
    )
)

(define (sqr-transfm t)
    (*transfm t t)
)

(define (pow-transfm t n)
    (if (= n 1) t
        (if (even? n) (sqr-transfm (pow-transfm t (/ n 2)))
                       (*transfm (sqr-transfm (pow-transfm t (floor (/ n 2)))) t)
        )
    )
)

(define (pow-transfm-iter t n)
    (define (loop-pow-transfm prevans k leftover)
        (if (= k 1) (*transfm prevans leftover)
            (if (even? k) (loop-pow-transfm (sqr-transfm prevans) (/ k 2) leftover)
                        (loop-pow-transfm (sqr-transfm prevans) (floor (/ k 2)) (*transfm leftover prevans))
            )
        )
    )
    (loop-pow-transfm t n (make-transfm 1 0))
)

(define (fastfib n)
    (define tr (make-transfm 0 1))
    (define tr^n (pow-transfm-iter tr n))
    (car (tr^n 0 1))
)

(display (fastfib 5))
(display "\n")
(display (fastfib 6))
(display "\n")
(display (fastfib 7))