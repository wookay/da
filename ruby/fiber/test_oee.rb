# encoding: utf-8
# test_oee.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end

require 'oee'


assert_equal    %w{ㅎ ㄱ ㅇ} , '허경영'.chosungs
assert_equal    %w{ㅓ ㅕ ㅕ} , '허경영'.jungsungs
assert_equal       %w{ㅇ ㅇ} , '허경영'.jongsungs
assert_equal [nil]+%w{ㅇ ㅇ} , '허경영'.jongsungs_with_nil
assert_equal <<EOF, '허경영'.ㅓㅔㅔ
ㅎㄱㅇ
ㅓㅕ영
EOF
