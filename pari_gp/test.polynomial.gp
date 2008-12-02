\\ test.polynomial
\\                           wookay.noh at gmail.com

read(unittest)

Sum(n) = polinterpolate([1,3,6],,n)
Odd(n) = polinterpolate([1,3,5],,n)
Even(n) = polinterpolate([2,4,6],,n)
Power(n) = polinterpolate([1,4,9],,n)
D3(n) = polinterpolate([1,3,6],,n)
D4(n) = polinterpolate([1,4,9],,n)
D5(n) = polinterpolate([1,5,12],,n)
D6(n) = polinterpolate([1,6,15],,n)
Radians(degree) = polinterpolate([30, 60], [Pi/6, Pi/3], degree)
Screen(width) = polinterpolate([640, 800], [480, 600], width)


assert_equal( 55              , Sum(10)         )
assert_equal( 5050            , Sum(100)        )
assert_equal( 1/2*n^2 + 1/2*n , Sum(n)          )
assert_equal( 1/2*n^2 + 1/2*n , n*(n+1)/2       )

assert_equal( 9               , Odd(5)          )
assert_equal( 2*n - 1         , Odd(n)          )
assert_equal( 10              , Even(5)         )
assert_equal( 2*n             , Even(n)         )
assert_equal( n^2             , Power(n)        )

assert_equal( 15             , D3(5)         )
assert_equal( 25             , D4(5)         )
assert_equal( 35             , D5(5)         )
assert_equal( 45             , D6(5)         )

assert_equal( Pi/6            , Radians(30)     )
assert_equal( Pi/3            , Radians(60)     )
assert_equal( Pi/2            , Radians(90)     )
assert_equal( degree*Pi/180   , Radians(degree) )

assert_equal( 768             , Screen(1024)    )

quit
