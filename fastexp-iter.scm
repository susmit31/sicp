(define sqr (lambda (x) (* x x)))
(define % remainder)
(define (iseven x)
    (if (= (% x 2) 0) 1 0
    )
)
(define (-1+ x) (- x 1))
(define (1+ x) (+ x 1))

(define (sqr-n-rec a n)
    (if (= n 0) a
        (sqr (sqr-n a (-1+ n)))
    )
)

(define (sqr-n a n)
    (define (sqr-n-iter prevans ctr n)
        (if (= ctr n) prevans
            (sqr-n-iter (sqr prevans) (1+ ctr) n)
        )
    )
    (sqr-n-iter a 0 n)
)

(define (fastexp a n)      
	(define (fastexp-iter prevans ctr n)
		(if (= n 0) prevans
		    (if (= (% n 2) 1) (fastexp-iter (* prevans (sqr-n a ctr)) (1+ ctr) (floor (/ n 2)))
			    (fastexp-iter (sqr-n prevans 1) (1+ ctr) (/ n 2))
		    )	
		)
	)
	(fastexp-iter 1 0 n)
)

(define (fastexp-rec a n)
    (cond ((= n 0) 1)
          ((= (iseven n) 1) (sqr (fastexp-rec a (/ n 2))))
          ((= (iseven n) 0) (* a (sqr (fastexp-rec a (floor (/ n 2)))))) 
    )
)

(display (fastexp-rec 2 7))
(display "\n")