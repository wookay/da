# test.rb
#                           wookay.noh at gmail.com

require 'codeset'

code = CodeSet.new { |expected, got| expected if expected==got }
code.bang <<INPUT, <<OUTPUT
assert_equal(0, 0)
assert_equal("string", "string")
INPUT
passed: 0
passed: string
OUTPUT


assert_equal = method_of code, :assert_equal
assert_equal 1    , 1
assert_equal 3    , 1+2
assert_equal "a"  , "a"
assert_equal true , 1==1
