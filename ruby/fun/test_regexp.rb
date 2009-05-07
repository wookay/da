# test_regexp.rb
#                           wookay.noh at gmail.com

def assert_match expected, got
  case expected =~ got
  when nil
    puts "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  else
    puts "passed: #{expected}"
  end
end

assert_match /^[\w* ;]*$/, 'NSArray* ary;'
assert_match /^[\w ]*$/, 'id delegate'
assert_match /^[a-z]*$/, 'test'
