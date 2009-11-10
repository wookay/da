require 'erlectricity'
include Erlectricity


def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

assert_equal 12345678901234567890, Decoder.decode(Encoder.encode(12345678901234567890))
