; test.lisp
;                            wookay.noh at gmail.com

(defun assert_equal (expected got)
  (if (equal expected got)
    (format t "passed: ~a~%" expected)
    (format t "Assertion failed~%Expected: ~a~%Got: ~a~%" expected got)
))


(assert_equal 1   1       )
(assert_equal 3   (+ 1 2) )
(assert_equal "a" "a"     )
(assert_equal t   (= 1 1) )
