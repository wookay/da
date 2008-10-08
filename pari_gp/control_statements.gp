\\ Control Statements
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( 55 , s=0; for(x=1, 10, s+=x); s )
assert_equal( 55 , sum(x=1, 10, x)            )

quit
