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
  loop do
    Fiber.yield words.shift
  end
end

assert_equal "a", fib.resume
assert_equal "b", fib.resume
assert_equal "c", fib.resume
