# test_egg_drop.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'egg_drop'
#assert_equal [7,2,1], translate('3', '3', '3')
