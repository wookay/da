# test_polinterpolate
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.class==String ? expected : expected.inspect}" :
    "Assertion failed\nExpected: #{expected.class==String ? expected : expected.inspect}\nGot: #{got.class==String ? got : got.inspect}"
end

require 'pari_gp'

week = polinterpolate [3.6689, 5.9115, 8.2198]
assert_equal [3.6689, 5.9115, 8.2198, 10.5938, 13.0335] , week[1..5]

sat = polinterpolate [3.4572, 5.8209, 8.0787]
assert_equal [3.4572, 5.8209, 8.0787, 10.2306, 12.2766], sat[1..5]

sun = polinterpolate [4.5861, 6.9145, 9.1370]
assert_equal [4.5861, 6.9145, 9.137, 11.2536, 13.2643], sun[1..5]
