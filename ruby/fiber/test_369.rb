# encoding: utf-8
# test_369.rb
#                           wookay.noh at gmail.com

require '369'

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


clap = Clap.new
assert_equal 1, clap.resume
assert_equal 2, clap.resume
assert_equal '짝', clap.resume
assert_equal 4, clap.resume
assert_equal 5, clap.resume
assert_equal '짝', clap.resume
