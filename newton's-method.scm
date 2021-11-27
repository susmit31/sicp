(define % remainder)
(define (-1+ x) (- x 1))
(define (1+ x) (+ x 1))
(define (abs x) 
    (if (< x 0) (- x) x)
)

; Calculating the derivative of the function func at point x
(define (der func x)
    (define dx 1e-6)
    (define y2 (func (+ x dx)))
    (define y1 (func x))
    (/ (- y2 y1) dx)
)

(define (newton-improve guess func)
    (define x guess)
    (define y (func x))
    (define df (der func x))
    (- x (/ y df))
)

(define (newton func)
    (lambda (x) (newton-improve x func))
)

(define (fixed-pt func guess)
    (define tolerance 1e-9)
    (if (< (abs (- guess (func guess))) tolerance) guess
        (fixed-pt func (func guess))
    )
)

(define (sqrt-newton num)
    (define sqrt-polynomial (lambda (y) (- (* y y) num)))
    (define sqrt-newton (newton sqrt-polynomial))
    (fixed-pt sqrt-newton 1)
)