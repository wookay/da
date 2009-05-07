# test.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

assert_equal 1    , 1
assert_equal 3    , 1+2
assert_equal "a"  , 'a'
assert_equal true , 1==1
