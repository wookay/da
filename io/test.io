// test.io
//                               wookay.noh at gmail.com

assert_equal := method(expected, got,
  if(expected==got,
    "passed: #{expected}",
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  ) interpolate println
)

assert_equal( 1    , 1           )
assert_equal( 3    , 1+2         )
assert_equal( "a"  , "a"         )
assert_equal( true , 1==1        )
assert_equal( 1    , 1/3+1/3+1/3 )
