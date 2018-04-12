(defun mergesort (numbers front end)
;(format t "function list~{~A ~}~%  " (subseq numbers front (+ end 1)) )
(setf x (subseq numbers front (+ end 1)))
(format t "~{~A~}~%" x)
    ;;; if front >= end, return
    ( if ( or (> front end) (= front end) ) 
        (return-from mergesort 0)
    )
        (mergesort  numbers front (floor(/ (+ front end) 2)))   ;;; call mergesort(List,front,mid)
        (mergesort numbers (+ 1 (floor(/ (+ front end) 2))) end) ;;; call mergesort(List,mid+1,end)
        ;merge(numbers front mid end)


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

    (mergesort numbers 0 (- n 1))
    (format t "ans ~{~A ~}~%" numbers)
    ;(format t "test subseq ~{~A ~}~%" (subseq numbers 0 2) )
)