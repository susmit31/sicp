(define % remainder)

(define (prime? num)
    (define rtnum (floor (sqrt num)))
    (define (loop curr)
        (if (= curr 1) #t
            (if (= (% num curr) 0) #f
                (loop (- curr 1))
            )
        )
    )
    (cond   ((= num 1) #f)
            ((= num 2) #f)
            (else (loop rtnum)
            )
    )
)

(define (smallest-divisor num)

)