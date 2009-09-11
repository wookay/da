# test_enumerable.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


class Gen
  include Enumerable 
  def each
    yield 1
    yield 2
    yield 3
  end
end

gen = Gen.new
assert_equal [1,2,3] , gen.to_a
