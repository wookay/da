# test_matrix.m
#                           wookay.noh at gmail.com

function void = assert_equal(expected, got)
  if (expected==got) 
    printf("passed: %s\n", strtrim(strrep(disp(expected), "\n", "")))
  else
    printf("Assertion failed\nExpected: %sGot: %s", disp(expected), disp(got))
  end
end

assert_equal( 0            , ismatrix([])   )
assert_equal( [1]          , [1]            )
assert_equal( [1; 2]       , [1, 2]'        )
assert_equal( [1, 3; 2, 4] , [1, 2; 3, 4]'  )
assert_equal( 1            , ismatrix([1])  )
assert_equal( 1            , ismatrix([1;]) )

quit
