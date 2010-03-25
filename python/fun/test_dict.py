def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)

h = {}

assert_equal( None, h.get(1) )

h[1] = 2
assert_equal( 2, h.get(1) )

del h[1]

assert_equal( None, h.get(1) )

h[1] = 2
h[2] = 4
for k in h:
  pass

for k,v in h.iteritems():
  assert_equal( v, k*2 )


for k in h.keys():
  pass

for v in h.values():
  pass
