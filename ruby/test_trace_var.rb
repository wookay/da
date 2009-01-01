# test_trace_var.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  case expected == got
  when true
    puts "passed: #{expected}"
  else
    puts "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  end
end

cnt = 0
trace_var :$v, proc { |v| cnt += v }

$v = 1
$v = 2
$v = 3

untrace_var :$v

$v = 4
$v = 5

assert_equal 6, cnt
