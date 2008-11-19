# ogamdo.rb
#                           wookay.noh at gmail.com

class Boy
  def said
    "got scared"
  end
end

class Street
  attr_accessor :way
end

class Fixnum
  def boys
    Array.new self, Boy.new
  end
end

class Array
  def are_running space
    self
  end
end

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end
