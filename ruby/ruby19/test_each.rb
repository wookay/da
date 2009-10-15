# test_each.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


class A
  include Enumerable
  def each
    yield 1
    yield 2
  end
end

for a in A.new
  assert_equal true, [1,2].include?(a)
end
