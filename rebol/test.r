{ test.r
                               wookay.noh at gmail.com
}

REBOL []
assert_equal: func [expected got] [
  either = expected got [
    print rejoin ["passed: " expected]
  ] [
    print rejoin ["Assertion failed^/Expected: " expected "^/Got: " got]
  ]
]

assert_equal 1    1
assert_equal 3    (+ 1 2)
assert_equal "a"  "a"
assert_equal true (= 1 1)
