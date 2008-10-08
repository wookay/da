\\ strings.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( "ex"       , "ex"                 )
assert_equal( "ex2"      , concat("ex", 1+1)    )
assert_equal( "3"        , Str(3)               )
assert_equal( 2          , #"ex"                ) \\ length
assert_equal( [1, 1]     , [eval("a=1"), a]     )
assert_equal( ["1", "1"] , [eval("a=\"1\""), a] )

quit
