def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)

import datetime

today = datetime.date.today()
one_day = datetime.timedelta(days=1)
yesterday = today - one_day
tomorrow = today + one_day

assert_equal( datetime.timedelta(days=1) , tomorrow - today  )
assert_equal( datetime.timedelta(days=1) , today - yesterday )
