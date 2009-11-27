-- test.lua
--                           wookay.noh at gmail.com

function assert_equal(expected, got)
  if (expected == got) then
    print("passed: ".. tostring(expected))
  else
    print("Assertion failed\nExpected: "..  
      tostring(expected).. "\nGot: ".. tostring(got))
  end
end 

assert_equal( 1     , 1           )
assert_equal( 3     , "1" + 2     )
assert_equal( "a"   , 'a'         )
assert_equal( true  , 1==1        )
assert_equal( 1     , 1/3+1/3+1/3 )
