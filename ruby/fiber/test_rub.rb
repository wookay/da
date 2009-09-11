# test_rub.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'rub'

rub = Rub.new
assert_equal 1 , rub.object(1)
assert_equal SyntaxError, rub.send('+')
assert_equal 3 , rub.object(2)
