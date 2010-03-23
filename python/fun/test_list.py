def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)

assert_equal( [2,3,4] , range(2,5) )
assert_equal( [0,1,2,3,4] , map(lambda x:x, range(0,5)) )
assert_equal( [2,3,0,1,6] , map(lambda x:x^2, range(0,5)) )
assert_equal( [4] , filter(lambda x:x>3, range(0,5)) )
assert_equal( [4] , filter(lambda x:x>3, range(0,5)) )

ary = [1,2,3]
assert_equal( None , list.append(ary, 4) )
assert_equal( [1,2,3,4] , ary)

ary = [1,2,3,3,3]
list.remove(ary,3)
assert_equal( [1,2,3,3] , ary)

ary = [1,2,3]
assert_equal( 3 , list.pop(ary) )
assert_equal( [1,2] , ary)

ary = [1,2,3,3,3]
assert_equal( 3 , list.count(ary, 3) )

ary = [1,2,3,3,3]
assert_equal( 2 , list.index(ary, 3) )

assert_equal( 10 , len(range(0, 10)))
assert_equal( 45 , reduce(lambda x,y:x+y, range(0, 10)) )

for v in [1,2,3]:
  pass

for iv in enumerate([1,2,3]):
  assert_equal( tuple, type(iv) )

for idx, v in enumerate([1,2,3]):
  assert_equal( v , idx+1 )

assert_equal([(0, 1), (1, 2), (2, 3)] , zip([0,1,2], [1,2,3]) )
