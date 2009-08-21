# test.rb
#                           wookay.noh at gmail.com

require 'mutter'

def assert_equal expected, got
  mut = Mutter.new
  case expected == got
  when true
    mut.say "passed: #{expected}", :green
  else
    mut.say "Assertion failed\nExpected: #{expected}\nGot: #{got}", :red
  end
end


assert_equal 3 , 1
assert_equal 3 , 1+2
