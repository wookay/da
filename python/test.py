# test.py
#                           wookay.noh at gmail.com

def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)

assert_equal( 1   , 1   )
assert_equal( 3   , 1+2 )
assert_equal( "a" , 'a' )
assert_equal( True , 1==1 )
assert_equal( 1   , 1.0/3+1.0/3+1.0/3 )
