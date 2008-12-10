require "#{File.dirname __FILE__}/pol"
pol = Pol.new
pol.monad = %w{capitalize chomp chop class downcase empty? hex inspect to_sym lstrip next oct reverse size strip rstrip squeeze swapcase to_f to_i to_s to_sym upcase}
pol.dyad = %w{* concat <=> == =~ slice casecmp center count crypt delete include? index replace ljust match rindex rjust split squeeze unpack}
pol.call ARGV
