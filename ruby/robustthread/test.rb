# test.rb
#                           wookay.noh at gmail.com

require 'robustthread'
require '../unittest'

args = [1, 2]
rt = RobustThread.new(:args => args, :label => "do_something with x and y") do |x, y|
  assert x < y
end
