# me2day.rb

require "#{File.dirname __FILE__}/pol.rb"
pat = Pol.patterns_hash
me2id = pat['아이디']
friends = %w{}

hash = {}
case ARGV.join' '
when '친구들'
  print friends
end
