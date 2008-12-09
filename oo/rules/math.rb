class String
  def eval
    Kernel.eval self
  end
end
require "#{File.dirname __FILE__}/pol"
Pol.new(%w{eval}).call ARGV
