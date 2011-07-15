# test.coffee
#                           wookay.noh at gmail.com

assert_equal = (expected, got) ->
  if expected is got
    console.log "passed: #{expected}"
  else
    console.log "Assertion failed\nExpected: #{expected}\nGot: #{got}"

assert_equal 3    , 1+2
assert_equal "a"  , 'a'
assert_equal true , 1==1
assert_equal 1    , 1.0/3+1.0/3+1.0/3
