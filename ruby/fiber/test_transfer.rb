# test_transfer.rb
#                           wookay.noh at gmail.com

require 'fiber'

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


f = Fiber.new do |val|
  2 + val
end
assert_equal 3, f.transfer(1)


f = Fiber.new do |fiber|
  fiber
end
g = Fiber.new { }
assert_equal g, f.transfer(g)


f = Fiber.new do |fiber|
  fiber
  3
end
g = Fiber.new { }
assert_equal 3, f.transfer(g)


f = Fiber.new do |fiber|
  100 + fiber.transfer(1)
end
g = Fiber.new do |val|
  2 + val
end
assert_equal 3, f.transfer(g)


f = Fiber.new do |fiber|
  3 + fiber.transfer(100)
end
g = Fiber.new do |fiber|
  100 + f.transfer(2)
end
assert_equal 5, f.transfer(g)


f = Fiber.new do |fiber|
  loop do
    Fiber.yield fiber.transfer(2)
  end
end
g = Fiber.new do |n|
  loop do
    Fiber.yield 1 + f.transfer(n)
  end
end
assert_equal 2, f.transfer(g)
assert_equal 3, f.transfer(g)
assert_equal g, f.transfer(g)
assert_equal 2, f.transfer(g)
assert_equal 3, f.transfer(g)
assert_equal g, f.transfer(g)
assert_equal 2, f.transfer(g)
