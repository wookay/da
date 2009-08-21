# test_alien_numbers.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'alien_numbers'
assert_equal 'Foo', translate('9', '0123456789', 'oF8')
assert_equal '10011', translate('13', '0123456789abcdef', '01')
assert_equal '9', translate('Foo', 'oF8', '0123456789')
assert_equal 'JAM!', translate('CODE', 'O!CDE?', 'A?JM!.')
