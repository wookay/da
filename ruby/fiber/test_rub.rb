# test_rub.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end

require 'rub'

rub = Rub.new
assert_equal 1              , rub.object(1)
assert_equal "1+"           , rub.send('+')
assert_equal 3              , rub.object(2)
assert_equal "1+2-"         , rub.send('-')
assert_equal -5             , rub.send(8)

rub = Rub.new
assert_equal "while "          , rub.keyword(:while)
assert_equal "while true"      , rub.object(true)
assert_equal "while true\n"    , rub.object(LF)
assert_equal "while true\n1"   , rub.object(1)
assert_equal "while true\n1\n" , rub.object(LF)
assert_equal Timeout::Error    , rub.keyword(:end)
