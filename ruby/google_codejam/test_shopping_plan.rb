# test_shopping_plan.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'shopping_plan'
require 'jam'

jam = Jam.new
jam.input_data <<EOF
2
1 2 10
cookies
0 2 cookies:400
4 0 cookies:320
3 3 5
cookies milk! cereal
0 2 cookies:360 cereal:110
4 0 cereal:90 milk:150
-3 -3 milk:200 cookies:200
EOF
jam.feed feed_rule do |case_num, data|
  #puts "Case ##{case_num}: #{translate data}"
end

#assert_equal 400.0000000, translate(data)
