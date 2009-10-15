# test_word.py
#                           wookay.noh at gmail.com

def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)


def fiber():
  words = ['a', 'b', 'c']
  while len(words):
    yield words.pop(0)

fib = fiber()
assert_equal( 'a' , fib.next() )
assert_equal( 'b' , fib.next() )
assert_equal( 'c' , fib.next() )

try:
 fib.next()
except StopIteration:
  assert_equal( StopIteration , StopIteration )
