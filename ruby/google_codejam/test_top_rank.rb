# test_top_rank.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

__END__
assert_equal "a.upto b do |i|", macro("FOR(i,a,b)")
assert_equal "0.upto n do |i|", macro("REP(i,n)")
assert_equal "a.downto b do |i|", macro("FORD(i,a,b)")
assert_equal "size", macro("sz")
assert_equal "0.upto c.size do |i|", macro("FORA(i,c)")
assert_equal "c.first.class", macro("itype(c)")
assert_equal "c.c.first.class", macro("FORE(e,c)")
