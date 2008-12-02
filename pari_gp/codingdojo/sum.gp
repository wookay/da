\\ sum of the first n natural numbers
\\                           wookay.noh at gmail.com

read("../unittest")

Sum(n) = polinterpolate([1,3,6],,n)

assert_equal( 55              , Sum(10)      )
assert_equal( 5050            , Sum(100)     )
assert_equal( 1/2*n^2 + 1/2*n , Sum(n)       )
assert_equal( 1/2*n^2 + 1/2*n , n*(n+1)/2    )
assert_equal( "t_CLOSURE"     , type(Sum)    )
assert_equal( "t_POL"         , type(Sum(n)) )

quit
