\\ test.formula
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\

read("../unittest")

Sum(n) = polinterpolate([1,3,6],,n)
Radians(degree) = polinterpolate([30, 60], [Pi/6, Pi/3], degree)

assert_equal( 55              , Sum(10)         )
assert_equal( 5050            , Sum(100)        )
assert_equal( 1/2*n^2 + 1/2*n , Sum(n)          )
assert_equal( 1/2*n^2 + 1/2*n , n*(n+1)/2       )

assert_equal( Pi/6            , Radians(30)     )
assert_equal( Pi/3            , Radians(60)     )
assert_equal( Pi/2            , Radians(90)     )
assert_equal( degree*Pi/180   , Radians(degree) )

quit
