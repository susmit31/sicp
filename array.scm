(define (take-inp-iter a ctr prevfn size)
    (define newfn 
        (lambda (i) (if (= i ctr) a (prevfn i)))
    )
    (if (= ctr size) newfn
        (lambda (b) (take-inp-iter b (+ ctr 1) newfn size))
    )
)

(define (make-arr size)
    (define startfn (lambda (x) 0))
    (lambda (a) (take-inp-iter a 1 startfn size))
)
