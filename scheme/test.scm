; test.scm
;                            wookay.noh at gmail.com

(define (assert_equal expected got)
  (if (= expected got)
    (display (format "passed: ~a\n" expected))
    (display (format "Assertion failed\nExpected: ~a\nGot: ~a\n" expected got))
)) 

(assert_equal 1   1       )
(assert_equal 3   (+ 1 2) )
(assert_equal 1.1 1.1     )
