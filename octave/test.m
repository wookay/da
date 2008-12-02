# test.m
#                           wookay.noh at gmail.com

function void = assert_equal(expected, got)
  if (expected==got) 
    printf("passed: %s\n", strtrim(strrep(disp(expected), "\n", "")))
  else
    printf("Assertion failed\nExpected: %sGot: %s", disp(expected), disp(got))
  end
end

assert_equal( 1    , 1    )
assert_equal( 3    , 1+2  )
assert_equal( "a"  , 'a'  )
assert_equal( true , 1==1 )

quit
