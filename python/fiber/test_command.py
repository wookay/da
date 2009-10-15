# test_command.py
#                           wookay.noh at gmail.com

def assert_equal(expected, got):
  if expected==got:
    print "passed: %s" % expected
  else:
    print "Assertion failed\nExpected: %s\nGot: %s" % (expected, got)


def fiber():
  words = ['a', 'b', 'c']
  while len(words):
    command = yield words.pop(0)
    if command:
      comm, word = command
      if 'push'==comm:
        words.append(word)

fib = fiber()
assert_equal( 'a' , fib.next() )
fib.send(('push', 'd'))
assert_equal( 'c' , fib.next() )
assert_equal( 'd' , fib.next() )

try:
 fib.next()
except StopIteration:
  assert_equal( StopIteration , StopIteration )
