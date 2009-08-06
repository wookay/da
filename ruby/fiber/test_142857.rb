# test_142857.rb
#                           wookay.noh at gmail.com

require 'fiber'
def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end



times = Fiber.new do
  n = 0
  loop do
    Fiber.yield n+=142857
  end
end

assert_equal 142857, times.resume
assert_equal 285714, times.resume
assert_equal 428571, times.resume
assert_equal 571428, times.resume
assert_equal 714285, times.resume
assert_equal 857142, times.resume
assert_equal 999999, times.resume



divide = Fiber.new do
  n = 0
  loop do
    Fiber.yield (n+=1/7.0).to_s[2,6].to_i
  end
end

assert_equal 142857, divide.resume
assert_equal 285714, divide.resume
assert_equal 428571, divide.resume
assert_equal 571428, divide.resume
assert_equal 714285, divide.resume
assert_equal 857142, divide.resume
assert_equal 000000, divide.resume
assert_equal 142857, divide.resume
assert_equal 285714, divide.resume
assert_equal 428571, divide.resume
assert_equal 571428, divide.resume
assert_equal 714285, divide.resume
assert_equal 857142, divide.resume
assert_equal 000000, divide.resume



class Numeric
  def circular
    ary = to_s.scan /./
    ary.unshift(ary.pop).join.to_i
  end
end

cir = Fiber.new do
  n = 142857
  loop do
    Fiber.yield n
    n = n.circular
  end
end

assert_equal 142857, cir.resume
assert_equal 714285, cir.resume
assert_equal 571428, cir.resume
assert_equal 857142, cir.resume
assert_equal 285714, cir.resume
assert_equal 428571, cir.resume
assert_equal 142857, cir.resume



class Array
  def sum op=:+
    inject { |s,n|s.send op, n }
  end
end
class Numeric
  def fold n
    str = to_s
    [str[0..n-1], str[n..-1]].map &:to_i
  end
  def scan n
    to_s.scan(/./).each_slice(n).map(&:join).map &:to_i
  end
end

assert_equal 142857, (142857**2).fold(5).sum
assert_equal 99, 142857.scan(2).sum
assert_equal 999, 142857.scan(3).sum
assert_equal 714285, 142857.scan(3).map{|x|x**2}.reverse.sum(:-)
