# test_hpricot.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'rubygems'
require 'hpricot'

doc = Hpricot("<html><body>test</body></html>")
assert_equal "<body>test</body>" , (doc/'body').to_s
assert_equal "<body>test</body>" , (doc/:body).to_s
assert_equal "test" , (doc/:body).inner_html
assert_equal "test" , doc.inner_text
