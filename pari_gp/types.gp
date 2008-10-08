\\ types.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

assert_equal(expected, got) = {
  if (expected==got,
    print("passed: ", expected),
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got)
  )
}

assert_equal( "t_INT"     , type(1)            ) \\ Integers
assert_equal( "t_REAL"    , type(1.1)          ) \\ Reals
assert_equal( "t_INTMOD"  , type(Mod(1, 2))    ) \\ Integers modulo m
assert_equal( "t_FRAC"    , type(1/2)          ) \\ Rational Numbers
           \\ "t_FFELT"   , type(ffgen(T))       \\ Elt in a Finite Field
assert_equal( "t_COMPLEX" , type(1+2*I)        ) \\ Complex Numbers 
assert_equal( "t_PADIC"   , type(1+O(2^3))     ) \\ p-adic Numbers
           \\ "t_QUAD"    , type(x+y∗quadgen(D)) \\ Quadratic Numbers
assert_equal( "t_POLMOD"  , type(Mod(f, g))    ) \\ Polynomials modulo g
assert_equal( "t_POL"     , type(1*x^2)        ) \\ Polynomials
assert_equal( "t_SER"     , type(1+O(1^3))     ) \\ Power Series 
assert_equal( "t_QFI"     , type(Qfb(1, 2, 3)) ) \\ Imag bin. quad. forms
assert_equal( "t_QFR"     , type(Qfb(1, 2, 0)) ) \\ Real bin. quad. forms
assert_equal( "t_RFRAC"   , type(1/g)          ) \\ Rational Functions
assert_equal( "t_VEC"     , type([1, 2])       ) \\ Row Vectors
assert_equal( "t_COL"     , type([1, 2]~)      ) \\ Column Vectors
assert_equal( "t_MAT"     , type([1, 2; 3, 4]) ) \\ Matrices
assert_equal( "t_LIST"    , type(List([1, 2])) ) \\ Lists
assert_equal( "t_STR"     , type("hola")       ) \\ Strings

quit
