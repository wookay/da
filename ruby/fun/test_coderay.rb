# test_coderay.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require "rubygems"
require "coderay"
require "hpricot"

tokens = CodeRay.scan open($0).read, :ruby
doc = Hpricot(tokens.div)

assert_equal 2, (doc/:div).size
