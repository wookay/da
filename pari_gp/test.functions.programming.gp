\\ test.functions.programming
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

read(unittest)

\\ programming specific
assert_equal( [1, 4, 9, 16]    , apply(x->x^2, [1,2,3,4])                    )
assert_equal( [1, 4; 9, 16]    , apply(x->x^2, [1,2;3,4])                    )
assert_equal( x + 9            , apply(x->x^2, x + 3)                        )
assert_equal( [1, 3, 5]        , select([1,2,3,4,5], x->x%2)                 )

\\ programming control
assert_equal( [1, 2, 3, 4, 5]  , r=[]; for(x=1, 5, r=concat(r,x)); r         )
assert_equal( [5, 4, 3, 2, 1]  , r=[]; forstep(x=5, 1, -1, r=concat(r,x)); r )
assert_equal( [2, 3, 5, 7, 11] , r=[]; forprime(p=2, 12, r=concat(r,p)); r   )

quit
