def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % str(expected)
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (str(expected), str(got))

assert_equal( int , type(0) )
assert_equal( bool , type(False) )
assert_equal( str , type('') )
assert_equal( list , type([]) )
assert_equal( dict , type({}) )
assert_equal( tuple , type(()) )
assert_equal( float , type(0.) )
assert_equal( type(assert_equal) , type(lambda :0) )

assert_equal( 0, int() )
assert_equal( False , bool() )
assert_equal( '' , str() )
assert_equal( [] , list() )
assert_equal( {} , dict() )
assert_equal( () , tuple() )
assert_equal( 0. , float() )
