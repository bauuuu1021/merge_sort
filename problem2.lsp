;;;;set max input 99999
(defun mergeSeq(numbers front mid end nCurr rCurr lCurr)
    (setf lSublist (subseq numbers front (+ 1 mid)))
    (setf rSublist (subseq numbers (+ 1 mid) (+ end 1)))

    (push 99999 (cdr (last lSublist)))
    (push 99999 (cdr (last rSublist)))

    (setq nCurr front)
    (setq lCurr 0)
    (setq rCurr 0)

    (loop for nCurr from front to end

    do(IF  (< (nth lCurr lSublist) (nth rCurr rSublist))
        (setf (nth nCurr numbers) (nth lCurr lSublist))
    (setf (nth nCurr numbers) (nth rCurr rSublist))
    )
    
    do(IF  (< (nth lCurr lSublist) (nth rCurr rSublist))
        (setq lCurr (+ 1 lCurr))
    (setq rCurr (+ 1 rCurr))
    )

)
)

(defun split (numbers front end)
;(format t "function list~{~A ~}~%  " (subseq numbers front (+ end 1)) )
(setf x (subseq numbers front (+ end 1)))
;(format t "~{~A~}~%" x)
    ;;; if front >= end, return
    ( if ( or (> front end) (= front end) ) 
        (return-from split 0)
    )
        (split  numbers front (floor(/ (+ front end) 2)))   ;;; call mergesort(List,front,mid)
        (split numbers (+ 1 (floor(/ (+ front end) 2))) end) ;;; call mergesort(List,mid+1,end)
        (mergeSeq numbers front (floor(/ (+ front end) 2)) end 1 2 3) ;;; call merge(List,front,mid,end,nCurr,rCurr,lCurr)


    ;(return-from mergesort numbers)
)

; main function
(let ( (n (read)) (numbers) )

    (setf numbers
        (do ((i 0 (+ i 1))
                (tmp nil)
            )
            
            ((>= i n)
            (reverse tmp)
            )
            
            (setf tmp (cons (read) tmp))
        )
    )

    (split numbers 0 (- n 1))
    (format t "ans ~{~A ~}~%" numbers)
    ;(format t "test subseq ~{~A ~}~%" (subseq numbers 0 2) )
)