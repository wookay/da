# test_tap.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


assert_equal 'abc'     , 'a'.tap{|x| x.concat 'bc'}
assert_equal %w{a b c} , %w{a}.tap{|x| x.concat %w{b c}}
assert_equal %w{a}     , %w{a}.tap{|x| :puts_x }
assert_equal %w{b c}   , %w{a b c}.tap{|x| x.shift}
