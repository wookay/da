\\ test.gp
\\                           wookay.noh at gmail.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( 1   , 1   )
assert_equal( 3   , 1+2 )
assert_equal( "a" , "a" )

true = 1
assert_equal( true , 1==1 )

quit
