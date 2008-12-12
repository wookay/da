# cal.rb

require "#{File.dirname __FILE__}/oo_header.rb"

hash = {}
case ARGV.join' '
when /지금 시각/
  t = Time.now
  hash[KEYWORD_ORDER] = %w{시 분 초}
  hash['시'] = t.hour
  hash['분'] = t.min
  hash['초'] = t.sec
  print hash.inspect
when /오늘/
  require 'date'
  d = Date.today
  hash[KEYWORD_ORDER] = %w{년 월 일 요일}
  hash['년'] = d.year
  hash['월'] = d.month
  hash['일'] = d.day
  hash['요일'] = %w{월 화 수 목 금 토 일}[d.wday]
  print hash.inspect
end
