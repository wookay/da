def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % str(expected)
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (str(expected), str(got))

a = 1,

assert_equal( (1,) , a)
