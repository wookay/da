# test_enumerator.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

range = 1..3
e = range.each

assert_equal 1, e.next
assert_equal 2, e.next
assert_equal 3, e.next

e.next rescue StopIteration
