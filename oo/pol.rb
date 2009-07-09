
class Pol
  attr_accessor :function
  def initialize function, block
    self.function = function
  end
  def function
    create_method(:asser_equal, self.function)
  end
end
