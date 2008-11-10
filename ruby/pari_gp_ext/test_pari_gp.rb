# test_pari_gp
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.class==String ? expected : expected.inspect}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'pari_gp'

sum = polinterpolate [1,3,6]
assert_equal [1,3,6,10,15]     , sum[1..5]
assert_equal 55                , sum[10]
assert_equal 5050              , sum[100]
assert_equal "1/2*n^2 + 1/2*n" , sum['n']

sum2 = polinterpolate [3,4,5] , [6,10,15]
assert_equal [1,3,6,10,15]     , sum2[1..5]
assert_equal "1/2*n^2 + 1/2*n" , sum2['n']

sum3 = polinterpolate [6,10,15]
assert_equal [1,3,6,10,15,21,28]   , sum[1..7]
assert_equal     [6,10,15,21,28]   , sum3[1..5]
assert_equal 3                     , sum3[0]
assert_equal sum[1..7]             , sum3[-1..5]
assert_equal "1/2*n^2 + 5/2*n + 3" , sum3['n']

even = polinterpolate [2,4,6]
assert_equal [2,4,6,8,10]      , even[1..5]
assert_equal "2*n"             , even['n']

even3 = polinterpolate [6,8,10]
assert_equal 4                 , even3[0]
assert_equal even[1..7]        , even3[-1..5]
assert_equal "2*n + 4"         , even3['n']

power = polinterpolate [1,4,9]
assert_equal [1,4,9,16,25]     , power[1..5]
assert_equal "n^2"             , power['n']

radians = polinterpolate [30,60], [Math::PI/6, Math::PI/3] 
assert_equal (Math::PI/2).to_s               , radians[90].to_s

pol = "x -> polinterpolate([30, 60], [Pi/6, Pi/3], x)"
assert_equal 1.570796326794896619231321692   , Math::PI/2
assert_equal Math::PI/2                      , eval(gp_eval("Pi/2"))
assert_equal gp_eval("Pi/2")                 , gp_eval("(#{pol})(90)")
assert_equal gp_eval("degree*Pi/180 + .")    , gp_eval("(#{pol})(degree)")
