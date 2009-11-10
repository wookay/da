# test_json.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'rubygems'
require 'json'

assert_equal "1.0"      , 1.0.to_json
assert_equal "[1,2,3]"  , [1,2,3].to_json
assert_equal "\"text\"" , "text".to_json
assert_equal "null" , nil.to_json
assert_equal "true" , true.to_json
assert_equal "false" , false.to_json
assert_equal "{}" , {}.to_json
assert_equal "\"bert\"" , :bert.to_json

assert_equal [1,2,3]    , JSON.parse("[1,2,3]")
assert_equal({"a"=>1}   , JSON.parse("{\"a\": 1}"))
