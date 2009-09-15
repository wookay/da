# encoding: utf-8
# test_hanja.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end


USE_TEST_DIC = true
require 'hanja'

hanja = Hanja.new
assert_equal '⽊', hanja.compose('⽊')
assert_equal '林', hanja.compose('⽊')
assert_equal '⽊', hanja.depose

hanja = Hanja.new
assert_equal '⽇', hanja.compose('⽇')
assert_equal '明', hanja.compose('⽉')
assert_equal '⽇', hanja.depose

String.include_HanjaCalculus
assert_equal '林', '⽊'+'⽊'
assert_equal '林', '⽊'*2
