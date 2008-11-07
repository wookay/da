\\ test.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( 1   , 1   )
assert_equal( 3   , 1+2 )
assert_equal( "a" , "a" )

quit
