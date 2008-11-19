# test_poem1.rb
#                           wookay.noh at gmail.com

require 'ogamdo'

the_street = Street.new
the_street.way = "blocked"
13.boys.are_running the_street

13.boys[1..10].each do |boy|
  assert_equal "got scared", boy.said
end

13.boys[11..13].each do |boy|
  assert_equal "got scared", boy.said
end
