# test_vlaah.rb
#                           wookay.noh at gmail.com

@@APIKEY = ''
require 'apikey'

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'rubygems'
require 'vlaah'

VLAAH::Base.application_key = @@APIKEY

topic = VLAAH::Topic.find "홍민희"
assert_equal VLAAH::CommentList, topic.comments.class
assert_equal VLAAH::CommentList, topic.comments.send(:raw_data, '') rescue nil

__END__
topic.degree        #=> 300
topic.degree.plus   #=> 380
topic.degree.minus  #=> 80

topic.people        #=> 46
topic.people.plus   #=> 38
topic.people.minus  #=> 8

topic.percent        #=> 82
topic.percent.plus   #=> 82
topic.percent.minus  #=> 17

puts topic.send(:raw_data)
puts topic
#assert_equal 1    , 1
