# test_timeout.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'timeout'

status = Timeout::timeout 0.01 do
  while true
    break 42
  end
end

assert_equal 42, status

begin
  status = Timeout::timeout 0.01 do
    while true
    end
  end
rescue Timeout::Error
  status = nil
end

assert_equal nil, status
