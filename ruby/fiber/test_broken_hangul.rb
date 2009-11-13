# encoding: utf-8
# test_broken_hangul.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end

require 'broken_hangul'

assert_equal '안녕하세요~', recover_typing_dubul_in_english_keyboard('dkssudgktpdy~')
assert_equal '안녕하세요~', recover_cp949_encoding_iso8859_decode('¾È³çÇÏ¼¼¿ä~')
assert_equal '안녕하세요~', recover_utf8_encoding_cp949_decode('쩐횊쨀챌횉횕쩌쩌쩔채~')
