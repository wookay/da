# compositions.rb

require "#{File.dirname __FILE__}/pol.rb"

def parse str
  keywords = KEYWORDS.join'|'
  postpositions = POSTPOSITIONS.join'|'
  case str
  when /"(.*)"(#{postpositions}) (.*)/
    m1 = $1
    m2 = $2
    m3 = $3
    print %Q[#{parse m1}(#{m2}) (#{m3})]
  when /(.*)(#{postpositions}) (.*)(#{postpositions}) (.*)/
    m1 = $1
    m2 = $2
    m3 = $3
    m4 = $4
    m5 = $5
    print %Q[("#{m1}")(#{m2}) ("#{m3}")(#{m4}) ("#{m5}")]
  when /(.*)(#{postpositions}) (#{keywords})/
    m1 = $1
    m2 = $2
    m3 = $3
    print %Q[("#{m1}")(#{m2}) (#{m3})]
  when /(.*)(#{postpositions}) (.*)/
    m1 = $1
    m2 = $2
    m3 = $3
    print %Q[("#{m1}")(#{m2}) ("#{m3}")]
  when /(#{keywords})/
    m1 = $1
    print %Q[(#{m1})]
  end
end

parse ARGV.join' '
