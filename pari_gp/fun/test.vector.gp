\\ test.vector.gp
\\                           wookay.noh at gmail.com

read(unittest)

assert_equal( []               , []                                 )
assert_equal( []               , vector(0)                          )
assert_equal( [0, 0, 0, 0, 0]  , vector(5)                          )
assert_equal( [1, 2]           , [1, 2]                             )
assert_equal( [1, 2]~          , [1, 2]~                            )
assert_equal( [1, 2]           , [1, 2]~~                           )
assert_equal( 1                , vecmin([1, 2, 3])                  )
assert_equal( 3                , vecmax([1, 2, 3])                  )
assert_equal( [1, 2, 3]        , vecsort([3, 1, 2])                 )
assert_equal( [1, 2, 3, 4]     , concat([1, 2], [3, 4])             )
assert_equal( 3                , #[1, 2, 3]                         )
assert_equal( 1                , [1, 2, 3][1]                       )
assert_equal( 3                , [1, 2, 3][3]                       )
assert_equal( [11, 13]         , vecextract([11, 12, 13], [1, 3])   )
assert_equal( [11, 12, 13]     , vecextract([11, 12, 13], "1..3")   )
assert_equal( [13, 12, 11]     , vecextract([11, 12, 13], "-1..-3") )
assert_equal( [1, 2, 3, 4, 5]  , vector(5, i, i)                    )
assert_equal( [2, 4, 6, 8, 10] , vector(5, i, i*2)                  )
assert_equal( a                , [a, b, c][1]                       )

\\ Sets
assert_equal( ["1", "2", "3"]      , Vec("123")                                )
assert_equal( ["1", "2", "3"]      , Set([1, 2, 3])                            )
assert_equal( ["1"]                , setintersect(Set([1, 2, 3]), Set([1, 5])) )
assert_equal( ["2", "3"]           , setminus(Set([1, 2, 3]), Set([1, 5]))     )
assert_equal( [1, 2, 3, 5]         , setunion([1, 2, 3], [1, 5])               )

read("fun.vector") \\ vecjoin
assert_equal( [2,3,4]              , apply(x->x+1, [1,2,3])                      )
assert_equal( "123"                , concat(["1", "2", "3"])                   )
assert_equal( "123"                , vecjoin(["1", "2", "3"])                  )
assert_equal( [1, 2, 3]            , concat([1, 2, 3])                         )
assert_equal( "123"                , vecjoin([1, 2, 3])                        )
assert_equal( "1,2,3"              , vecjoin([1, 2, 3], ",")                   )

quit
