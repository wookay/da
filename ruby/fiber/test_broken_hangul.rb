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
assert_equal '안녕하세요~', recover_typing_sebul_in_english_keyboard('jfsheamfncj4)')
assert_equal '안녕하세요~', recover_cp949_encoding_iso8859_decode('¾È³çÇÏ¼¼¿ä~')
assert_equal '¾È³çÇÏ¼¼¿ä~', make_cp949_encoding_iso8859_decode('안녕하세요~')
assert_equal '°¡ÆR', make_cp949_encoding_iso8859_decode('가힣')
assert_equal '가힣', recover_cp949_encoding_iso8859_decode('°¡ÆR')
assert_equal '안녕하세요~', recover_utf8_encoding_cp949_decode('쩐횊쨀챌횉횕쩌쩌쩔채~')
assert_equal '안녕하세요~', recover_escaped_cp949('%BE%C8%B3%E7%C7%CF%BC%BC%BF%E4~')
assert_equal '안녕하세요~', recover_escaped_utf8('%EC%95%88%EB%85%95%ED%95%98%EC%84%B8%EC%9A%94%7E')

assert_equal 'hello~', recover_typing_english_in_dubul_keyboard('ㅗ디ㅣㅐ~')
assert_equal 'hello~', recover_typing_english_in_sebul_keyboard('녀ㅉㅊ※')
