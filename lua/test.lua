-- test.lua
--                           wookay.noh at gmail.com
--                           http://wookay.egloos.com

function assert_equal(expected, got)
  if (expected == got) then
    print("passed: ".. tostring(expected))
  else
    print("Assertion failed\nExpected: "..  
      tostring(expected).. "\nGot: ".. tostring(got))
  end
end 

assert_equal( 1          , 1                  )
assert_equal( 3          , "1" + 2            )
assert_equal( "a"        , 'a'                )
assert_equal( false      , "1"==1             )

assert_equal( "number"   , type(1)            )
assert_equal( "number"   , type(1)            )
assert_equal( "string"   , type("")           )
assert_equal( "boolean"  , type(true)         )
assert_equal( "nil"      , type(nil)          )
assert_equal( "table"    , type({})           )
assert_equal( "function" , type(assert_equal) )
assert_equal( "table"    , type(string)       )
assert_equal( "table"    , type(math)         )

table = { key = "value" }
assert_equal( "value"    , table.key          )
assert_equal( "value"    , table["key"]       )
