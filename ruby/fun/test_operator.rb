# test_operator.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

assert_equal true , 1==1

class Fixnum
  def == b
    false
  end
end
assert_equal false, 1==1
