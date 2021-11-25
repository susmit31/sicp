(define (double x) (+ x x))
(define % remainder)

(define (fastmult-rec a b)
    (if (= a 0) 0
          (if (= b 0) 0
                (+ (fastmult-rec (double a) (floor (/ b 2))) (* (% b 2)  a))
          )
    )
)

(define (fastmult-iter a b)
    (define (fastmult-iter-loop a b aux)
        (cond ((= b 0) aux)
              ((= a 0) aux)
              (else
                    (fastmult-iter-loop (double a) (floor (/ b 2)) (+ aux (* (% b 2) a)))
              )
        )
    )
    (fastmult-iter-loop a b 0)
)

(display (fastmult-rec 1234 5678))
(display (fastmult-iter 1234 5678))