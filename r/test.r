# test.r
#                           wookay.noh at gmail.com

assert_equal <- function(expected, got) {
  if (expected == got) {
    cat("passed:", expected, "\n")
  } else {
    cat("Assertion failed\nExpected:", expected, "\nGot:", got, "\n")
  }
}

assert_equal( 1    , 1           )
assert_equal( 3    , 1+2         )
assert_equal( "a"  , "a"         )
assert_equal( TRUE , 1==1        )
assert_equal( 1    , 1/3+1/3+1/3 )
