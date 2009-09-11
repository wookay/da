# test_alien_language.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'alien_language'
length = 3
words = %w{abc bca dac dbc cba}
assert_equal 2, translate(length, words, '(ab)(bc)(ca)')
assert_equal 1, translate(length, words, 'abc')
assert_equal 3, translate(length, words, '(abc)(abc)(abc)')
assert_equal 0, translate(length, words, '(zyx)bc')
