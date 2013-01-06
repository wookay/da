def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % str(expected)
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (str(expected), str(got))



class A(object):
    def inc(self):
        return 5

class B(A):
    def inc(self):
        return super(B, self).inc()


assert_equal( 5 , B().inc() )
