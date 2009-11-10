# encoding: utf-8
# test_spec.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'bert'

def assert_ebin expected, obj
  assert_equal expected, BERT.ebin(BERT.encode(obj))
end

assert_ebin "<<131,100,0,3,102,111,111>>", 1
assert_ebin "<<131,100,0,3,102,111,111>>", :foo
# assert_ebin "", {foo
