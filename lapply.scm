(define (lapply-iter li fn)
	(define (lapply-iter-loop applied remaining)
		(if (= (length remaining) 0 ) applied
		    (lapply-iter-loop (append applied (list (fn (car remaining)))) (cdr remaining))
		)
	)
	(lapply-iter-loop () li)
)

(define (lapply li fn)
    (if (= (length li) 1) (list (fn (car li)))
        (cons (fn (car li)) (lapply (cdr li) fn))
    )
)