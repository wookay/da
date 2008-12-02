require "#{File.dirname __FILE__}/pol"
Pol.new(%w{upcase downcase size}).call ARGV
