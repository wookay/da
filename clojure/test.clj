; test.clj
;                            wookay.noh at gmail.com

(defn assert_equal [expected got]
  (println (cond
    (= expected got) (str "passed: " expected)
    :else (str "Assertion failed\nExpected: " expected "\nGot: " got)
)))


(assert_equal 1    1       )
(assert_equal 3    (+ 1 2) )
(assert_equal "a"  "a"     )
(assert_equal true (= 1 1) )
