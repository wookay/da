# test_revactor.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


require 'revactor'

Actor.current.trap_exit = true
dog = Actor.spawn_link do
  Actor.receive do |filter|
    filter.when Case[:bark, Object] do |bark, say|
      assert_equal :blah, say
    end
  end
  Actor.receive do |filter|
    filter.when Case[:bark, Object] do |bark, say|
      assert_equal :blahblah, say
    end
  end
end

dog << [:bark, :blah]
dog << [:bark, :blahblah]

Actor.receive do |filter|
  filter.when Case[:exit, dog, Object]
end
