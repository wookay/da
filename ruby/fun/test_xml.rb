# test_xml.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'rubygems'
require 'hpricot'

data = <<EOF
<html>
  <head>
    <title>title string</title>
  </head>
  <body>body text</body>
</html>
EOF

doc = Hpricot.parse data
assert_equal "<body>body text</body>", (doc/:body).to_s

require 'xml-object'
html = XMLObject.new data
assert_equal "body text", html.body
