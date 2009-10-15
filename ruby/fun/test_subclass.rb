# test_subclass.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


class Super
  def initialize
  end
end

class Sub < Super
  def initialize arg
    super *[]
  end
end

sub = Sub.new :a
assert_equal Super , sub.class.superclass
