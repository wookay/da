\\ vector.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( []              , []              )
assert_equal( []              , vector(0)       )
assert_equal( [0, 0, 0, 0, 0] , vector(5)       )
assert_equal( [1,2]           , [1,2]           ) \\ row vector
assert_equal( [1,2]~          , [1,2]~          ) \\ column vector
assert_equal( [1,2]           , [1,2]~~         ) \\ transpose
assert_equal( 1               , vecmin([1,2,3]) )
assert_equal( 3               , vecmax([1,2,3]) )
assert_equal( [1, 2, 3]       , vecsort([3,1,2]) )

quit
