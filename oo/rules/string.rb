require "#{File.dirname __FILE__}/pol"
Pol.new(%w{capitalize downcase next reverse size strip swapcase upcase}).call ARGV
