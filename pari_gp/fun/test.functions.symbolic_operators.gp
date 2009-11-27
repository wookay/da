\\ test.functions.symbolic_operators
\\                           wookay.noh at gmail.com

read(unittest)

assert_equal( x + y , x+y       ) \\ add
assert_equal( x + 1 , x+=1      ) \\ adde
kill(x)

assert_equal( [1]   , [1;2][1,] ) \\ coeff
assert_equal( 1     , x'        ) \\ deriv
assert_equal( 1/2   , 1/2       ) \\ div
assert_equal( 1/2*x , x/=2      ) \\ dive
kill(x)

assert_equal( 2     , 7\3       ) \\ divent
assert_equal( 1/2*x , x\=2      ) \\ divente
kill(x)

assert_equal( 2     , 7\/3      ) \\ divround
assert_equal( 1/2*x , x\/=2     ) \\ divrounde
kill(x)

quit
