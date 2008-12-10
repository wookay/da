# file.rb

require "#{File.dirname __FILE__}/pol.rb"
mhash = Pol.patterns_hash
path = mhash['디렉토리'] ? mhash['디렉토리'] : '.'
ls = Dir["#{path}/*"]

hash = {}
case ARGV.join' '
when '파일'
  hash[KEYWORD_ORDER] = %w{개 이름 크기}
  hash['개'] = ls.size
  hash['이름'] = ls.map{|f|File.basename f}.join', '
  hash['크기'] = ls.map{|f|File.new(f).stat.size}.join', '
  print hash.inspect
end
