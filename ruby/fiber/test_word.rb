# test_word.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


require 'fiber'
fib = Fiber.new do
  words = %w{a b c}
  while words.size > 0
    Fiber.yield words.shift
  end
end

assert_equal "a" , fib.resume
assert_equal "b" , fib.resume
assert_equal "c" , fib.resume
assert_equal nil , fib.resume
fib.resume rescue FiberError



words = %w{a b c}
fib = words.each
assert_equal "a" , fib.next
assert_equal "b" , fib.next
assert_equal "c" , fib.next
fib.next rescue StopIteration


words = %w{a b c}
fib = words.enum_for :each_with_index
assert_equal ["a", 0] , fib.next
