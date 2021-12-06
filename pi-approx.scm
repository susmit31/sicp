(define % remainder)
(define (-1+ x) (- x 1))
(define (1+ x) (+ x 1))
(define (even? x) 
    (if (= (% x 2) 0) #t #f)
)

(define (prod-iter f start n next)
    (define (loop f prevprod currterm ctr)
        ;(display (f currterm))
        (if (= ctr n) (* prevprod (f currterm))
            (loop f (* prevprod (f currterm)) (next ctr currterm) (1+ ctr))
        )
    )
    (loop f 1 start 1)
)

(define (pi-appx n-terms)
    (define (change-if-odd ctr term)
        (if (even? ctr) term (1+ term))
    )
    (define (change-if-even ctr term)
        (if (and (even? ctr) (> ctr 1)) (1+ term) term)
    )
    (define N (prod-iter (lambda (n) (* n 2)) 1 n-terms change-if-odd))
    (define D (prod-iter (lambda (n) (+ (* n 2) 1)) 1 n-terms change-if-even))
    (exact->inexact (* 4 (/ N D)))
)

(display (pi-appx 6))
(display "\n")