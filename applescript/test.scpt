# test.scpt
#                           wookay.noh at gmail.com

on assert_equal(expected, got)
  if expected = got then 
    return "passed: " & expected
  else
    return "Assertion failed\nExpected: " & expected & "\nGot: " & got
  end if
end assert_equal



on run argv
  set LF to "\n"
  return                               ""¬
                                        &¬
  assert_equal( 1    , 1   )         &LF&¬
  assert_equal( 3    , 1+2 )         &LF&¬ 
  assert_equal( "a"  , "a" )         &LF&¬
  assert_equal( true , 1=1 )

end run
