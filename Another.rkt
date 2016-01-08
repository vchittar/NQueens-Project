;(#%require(only racket/base random))
(#%require(only racket/base current-inexact-milliseconds))
(define counter 0);Used to count the number of steps
(define steps 0);Used this to count the number of steps and such

;This method calls the Backtracking method
(define (nq-bt bool N) ; here is how I defined my start, and this is going to be the same for min conflict too
(define Vec (make-vector N)); basically made a vector for Vec, col and row so N contains these elements
  (define col (make-vector N))
  (define row (make-vector N))
  (define start (current-inexact-milliseconds))
  (define end (current-inexact-milliseconds))
 (if(eq? bool #t) ;my true or false statement that determines what to print depending on if we want a true or a false value

   (begin
     
  (vector-fill! Vec -111)
  (write "Backtracker:")
  (backtrak Vec 0 0) 
  (newline)
  (display_board Vec)
  (display "Queens:")
  (display Vec)
  (newline)
  (display "Steps:")
  (display steps)
  (newline)
  (display "Time:")
  (display (- (current-inexact-milliseconds) start)))
   
  (begin
    
  (vector-fill! Vec -111) 
  (display "Backtracker:")
  (backtrak Vec 0 0)
  (newline)
  (display "Queens:")
  (display Vec)
  (newline)
  (display "Steps:")
  (display steps)
  (newline)
  (display "Time:")
  (display (- (current-inexact-milliseconds) start)))
))
   


;This method calls the Min Conflict Method
  (define (nq-mc bool N)
  (define Conf (initialize N))
  ;(define Conf2 (diag? N))
  (define Vec2 (make-vector N))
  (define start (current-inexact-milliseconds))
  (define end (current-inexact-milliseconds))
    

    (if(eq? bool #t)
       
  (begin

         
  (write "Min-Conflict Board:")
  (newline)
  (display_board Conf)
  (display "Queens:")
  (display Conf)
  (newline)
  (display "Steps:")
  (display steps)
  (newline)
  (display "Time:")
  (display (- (current-inexact-milliseconds) start))
  ;(MinConf Vec2 Conf)

  )

  (begin
         
  (display "Queens:")
  (display Conf)
  (newline)
  (display "Steps:")
  (display steps)
  (newline)
  (display "Time:")
  (display (- (current-inexact-milliseconds) start))
  )
  
  ))
;;Back-Tracking Method. Uses implicit recurrsion to iterate back and forth behind the scences until the #t is carried to the top (bottom more correct?) of the recursion stack
(define (backtrak Vec col row)
  (set! steps (+ steps 1)) ;reset the steps here so I can count the steps properly

  (if (conflict Vec col row) 
       (if (eq? (+ col 1) (vector-length Vec)) #t 
           (if (backtrak Vec (+ col 1) 0) #t (begin (vector-set! Vec col -111) (backtrak Vec col (+ row 1))))
       )
      (if (eq? row (vector-length Vec)) #f (backtrak Vec col (+ row 1))) 
   )
)
; If there is a conflict that is found it removes the queen and returns false, otherwise it returns true
(define (conflict Vec col row)
  
  (define backtrak (vector-ref Vec col))
  
  (define var1 0);set these 2 variables to 0
  (define var2 0)
  
  (define Bol 1)
  
  (if (>= row (vector-length Vec)) #f ; here the if statement resides to check if the row is greater or equal to the vector-length
      
      (begin
        
  (vector-set! Vec col row)
  
  (do ((i 0 (+ i 1 )))
    
    ((>= i (- (vector-length Vec) 1)))
    
    (set! var1 (abs (- i col)))
    (set! var2 (abs (- (vector-ref Vec col) (vector-ref Vec i))))
    
    (if (not (eq? col i))
        
        (if (eq? var1 var2)
            
            (set! Bol 0)))
    
    (if (not (eq? col i))
        
        (if (eq? (vector-ref Vec i)

                 (vector-ref Vec col))

            (set! Bol 0)))
  );end of do
  
  (if (eq? Bol 0) (vector-set! Vec col backtrak))
  (if (eq? Bol 1) #t #f)
  )
  )
)


;Psuedocode for MinConflict (CB's Website)
;function MIN-CONFLICTS-N-QUEENS(n, maxsteps)

;state = initialize(n);

;for i = 1 to maxsteps do
 ; if goal(state) then return(state);
  ;endif
  ;col <- a random column that has conflicts;
 ; row <- the row in col where a queen causes smallest number of conflicts;
  ;state[col,0] <- row;
;end-for
;return(failure)

;With min conflicts we can only move up or down instead of the backtracking way

;Odd numbered boards
(define (initialize Conf) ;n is the number of slots in a chess board
;(set! steps (+ steps 1))
  
  (let ((m (floor (/ (- Conf 1) 2))) ;floor basically returns the largest ineteger that is not larger than the said integer 
        
        (v (make-vector Conf -1)))
    
    (begin
       ;(set! steps (+ steps 1));here I try to reset the global variable in order to calc the steps, it doesnt work, more testing necessary

       (do ((i 0 (+ i 1)))
             ((= i (+ m 1))) ;here we have filled the vertex with the even placed queens
       (set! steps (+ steps 1))
             (vector-set! v i (* i 2)))
      
           (do ((i 0 (+ i 1)))
             ((= (+ (+ m 1) i) Conf) v)
               
             (vector-set! v (+ (+ m 1) i) (+ (* i 2) 1))))))

(define (MinConf Vec Conf)
  ;(define MaxI 0)
  (define LowI 0)
  (define LowConf 100)
  (define MaxI (FindMax Conf))
  (define Currentrow (vector-ref Vec MaxI))

  (if (eqv? (vector-ref Conf MaxI) 0) Vec
      
  (begin


  (do ((r 0 (+ r 1)))
    
    ((> r (- (vector-length Vec) 1)))
    
    (if(not(equal? r Currentrow))
      
       (begin
        
    (vector-set! Vec MaxI r)
    (if (<= (Get-Conf Vec MaxI) LowConf)
        
        (begin
          (set! LowConf
                
          (Get-Conf Vec MaxI)
          )
         
          (set! LowI r)
          ))
    )))
  (vector-set! Vec MaxI LowI)
  (SetConf Vec Conf)
  (MinConf Vec Conf)
  )
  )
)
;Takes in a vector and col and returns the number of conflicts.
(define (Get-Conf Vec col)
  (define X 0)
  (define var1 0)
  (define var2 0)
  (do ((i 0 (+ i 1)))
    ((>= i (- (vector-length Vec) 1)))
    
    (set! var1 (abs (- i col)))
    
    (set! var2 (abs (- (vector-ref Vec col) (vector-ref Vec i))))
    
    (if (not (equal? col i))
        (if (equal? var1 var2)
            (set! X (+ X 1))
         (if (equal? (vector-ref Vec i)
                     (vector-ref Vec col))
            
             (set! X (+ X 1))))
        
    )
  )
  X
   
)

;Quickly reset all the conflicts on the board after moving a queen
(define (SetConf Vec Conf)
  (do ((i 0 (+ i 1)))
    ((> i (- (vector-length Conf) 1)))
       (vector-set! Conf i (Get-Conf Vec i))
    )
)
;; Finds the maximum value in a vector. Used to find the higest conflict in my Conf vector
(define (FindMax Conf)
  (define MaxI 0)
  (do ((i 0 (+ i 1)))
    ((> i (- (vector-length Conf) 1)))
       (if (> (vector-ref Conf i) (vector-ref Conf MaxI)) (set! MaxI i))
    );(set! steps (+ steps 1))
  MaxI
 )

;This is how we are going to display our n-chessboard
(define display_board
  (lambda (Vec)
    (do ((row 0 (+ 1 row)))
      ((eq? row (vector-length Vec)))
      (do ((col 0 (+ 1 col)))
        ((eq? col (vector-length Vec))
         (display "\n"))
        (if (eq? row (vector-ref Vec col))
            (display "1 ")
            (display "0 "))))))
        