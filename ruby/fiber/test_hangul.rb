# encoding: utf-8
# test_hangul.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end

require 'hangul'

hangul = Hangul.new
assert_equal 'ㅎ'   , hangul.compose('ㅎ')
assert_equal '하'   , hangul.compose('ㅏ')
assert_equal '한'   , hangul.compose('ㄴ')
assert_equal '한ㄱ' , hangul.compose('ㄱ')
assert_equal '한그' , hangul.compose('ㅡ')
assert_equal '한글' , hangul.compose('ㄹ')

assert_equal '한그' , hangul.depose
assert_equal '한ㄱ' , hangul.depose
assert_equal '한'   , hangul.depose

assert_equal 'ㄴ' , hangul.pop
assert_equal 'ㅏ' , hangul.pop
assert_equal 'ㅎ' , hangul.pop
