# encoding: utf-8
# test_utf8.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

assert_equal 3 , "가나다".scan(/./).size 
assert_equal "안녕" , "a 안녕 z".match(/[a-z]\s([가-힛]*)\s[a-z]/)[1]
assert_equal "안녕" , "a 안녕 z".match(/[a-z]\s([가-힣]*)\s[a-z]/)[1]
case '안녕'
when /[a-zA-Z0-9가-힣]/u
  assert_equal 1, 1
end

case
when true
end
