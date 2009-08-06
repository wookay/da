# test_fibo.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'fiber'
fibo = Fiber.new do 
  x,y = 0,1
  loop do 
    Fiber.yield y
    x,y = y,x+y
  end
end

assert_equal 1,  fibo.resume
assert_equal 1,  fibo.resume
assert_equal 2,  fibo.resume
assert_equal 3,  fibo.resume
assert_equal 5,  fibo.resume
assert_equal 8,  fibo.resume
assert_equal 13, fibo.resume
assert_equal 21, fibo.resume
assert_equal 34, fibo.resume
assert_equal 55, fibo.resume
