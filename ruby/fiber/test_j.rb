# test_j.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'j'

j = J.new
assert_equal '+'  , j.verb('+')
assert_equal '+/' , j.adverb('/')
assert_equal 1    , j.noun(1)
assert_equal 3    , j.noun(2)
assert_equal 6    , j.noun(3)
