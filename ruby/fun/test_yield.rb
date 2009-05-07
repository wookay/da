# test_yield.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


def gen
  yield 1
  yield 2
end

ary = []
gen do |n|
  ary.push n
  break
end

assert_equal [1], ary

def con_gen proc
  if proc.call 1
    yield 3
  end
end

con_gen(lambda { |x| x==1 }) do |n|
  ary.push n
  break
end

con_gen(lambda { |x| x==0 }) do |n|
  ary.push n
  break
end

assert_equal [1, 3], ary

def y_gen
  proc = lambda do |unit|
    if unit
      yield unit
    end
  end
  proc.call 5 do |n|
    yield n
  end
end

y_gen do |n|
  ary.push n
end

assert_equal [1, 3, 5], ary
