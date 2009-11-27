\\ test.matrix.gp
\\                           wookay.noh at gmail.com

read(unittest)

assert_equal( [;]                      , [;]                                )
assert_equal( [;]                      , matrix(0, 0)                       )
assert_equal( [0, 0; 0, 0]             , matrix(2, 2)                       )
assert_equal( [2, 2]                   , matsize([0, 0; 0, 0])              )
assert_equal( [0, 1; 2, 3]             , [0, 1; 2, 3]                       )
assert_equal( [0, 2; 1, 3]             , mattranspose([0, 1; 2, 3])         )
assert_equal( [0, 2; 1, 3]             , [0, 1; 2, 3]~                      )
assert_equal( [a; 1]                   , concat([;], [a; 1])                )
assert_equal( [a, b; 1, 2]             , concat([a; 1], [b; 2])             )
assert_equal( [1, 2; 5, 6; 7, 8]       , concat([1, 2], [5, 6; 7, 8])       )
assert_equal( [1, 2, 5, 6; 3, 4, 7, 8] , concat([1, 2; 3, 4], [5, 6; 7, 8]) )
assert_equal( [4, -2; -3, 1]           , matadjoint([1, 2; 3, 4])           )
assert_equal( [-1/2, 1; 1, 1]          , mateigen([2, 1; 2, 1])             )
assert_equal( x^2 - 3*x                , minpoly([2, 1; 2, 1])              )
assert_equal( [1; 3]                   , vecextract([1, 2; 3, 4], 1)        )
assert_equal( [2; 4]                   , vecextract([1, 2; 3, 4], 2)        )
assert_equal( [1, 2; 3, 4]             , vecextract([1, 2; 3, 4], 3)        )
assert_equal( 2                        , #[1, 2; 3, 4]                      )
assert_equal( [1, 2]                   , [1, 2; 3, 4][1,]                   )
assert_equal( [3, 4]                   , [1, 2; 3, 4][2,]                   )
assert_equal( [1, 3]~                  , [1, 2; 3, 4][,1]                   )
assert_equal( [2, 4]~                  , [1, 2; 3, 4][,2]                   )
assert_equal( [1, 0; 0, 1]             , matid(2)                           )
assert_equal( Mat(3)                   , matdiagonal(3)                     )
assert_equal( 2                        , matrank([1, 2; 3, 4])              )

quit
