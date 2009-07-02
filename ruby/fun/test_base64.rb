# test_base64.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


assert_equal "aGVsbG8=\n" , ["hello"].pack("m*")
assert_equal ["hello"]    , "aGVsbG8=".unpack("m*")
