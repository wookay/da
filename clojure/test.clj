; test.clj
;                            wookay.noh at gmail.com

(defn assert_equals [expected got]
  (println (cond
    (= expected got) (str "passed: " expected)
    :else (str "Assertion failed\nExpected: " expected "\nGot: " got)
)))


(assert_equals 1    1       )
(assert_equals 3    (+ 1 2) )
(assert_equals "a"  "a"     )
(assert_equals true (= 1 1) )
