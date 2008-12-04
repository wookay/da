# cal.rb

require "#{File.dirname __FILE__}/pol.rb"
mhash = Pol.mappings_hash
path = mhash['디렉토리'] ? mhash['디렉토리'] : '.'
ls = Dir["#{path}/*"]

hash = {}
case ARGV.join' '
when '파일'
  hash[KEYWORD_ORDER] = %w{개}
  hash['개'] = ls.size
  print hash.inspect
when /파일이름/
  print ls.map{|f|File.basename f}.join', '
end
