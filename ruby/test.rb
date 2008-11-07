# test.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  case expected == got
  when true
    puts "passed: #{expected}"
  else
    puts "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  end
end

assert_equal 1   , 1
assert_equal 3   , 1+2
assert_equal "a" , 'a'
