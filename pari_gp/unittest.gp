\\ unittest.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}