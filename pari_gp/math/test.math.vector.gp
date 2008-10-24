\\ test.math.vector.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

read("math.vector")

read("../unittest")
read("../fun.vector")
vector_equal(expected, got) = {
  if(type(expected)=="t_VEC",
    assert_equal(Str(map(x->precision(x, 8), expected)),
                 Str(map(x->precision(x, 8), got))),
    if(type(expected)=="t_REAL",
      assert_equal(Str(precision(expected, 8)), Str(precision(got, 8))),
      assert_equal(expected, got)
    )
  )
}

V = [1,2,3]
W = [0.5, 0.8, 0.2]
U = [ux, uy, yz]
vector_equal( 3.741657387          , Length(V)                               )
vector_equal( [0.2672612419, 0.534522483, 0.801783725] , Normalize(V)        )
vector_equal( [1.5, 2.8, 3.2]      , V + W                                   )
vector_equal( [2, 4, 6]            , V * 2                                   )
vector_equal( 0                    , DotProduct([1,0,0], [0,1,0])            )
vector_equal( 2.7                  , DotProduct(V, W)                        )
vector_equal( [-2.0, 1.3, -0.2]    , CrossProduct(V, W)                      )
vector_equal( CrossProduct(-W, V)  , CrossProduct(V, W)                      )
vector_equal( CrossProduct(U, V+W) , CrossProduct(U, V) + CrossProduct(U, W) )
vector_equal( 0                    , CrossProduct(V, [0,0,0])                )
vector_equal( 0                    , CrossProduct(V, V)                      )
vector_equal( [2.7, 5.4, 8.1]      , Projection(V, W)                        )

quit
