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


def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


assert_equal "en" , 'to_en'.match(/^to_(\w{2})$/)[1]


cmti = /\+CMTI: "SM",\d+\r\n/
assert_equal "OK ERROR" , %Q[OK +CMTI: "SM",3\r\nERROR].gsub(cmti, '')
