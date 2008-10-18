\\ test.strings.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

read(unittest)

assert_equal( "ex"       , "ex"                  )
assert_equal( "ex2"      , concat("ex", 1+1)     )
assert_equal( "example"  , concat("ex", "ample") )
assert_equal( "exhola"   , concat("ex", hola)    )
assert_equal( "ex[1, 2]" , concat("ex", [1, 2])  )
assert_equal( "3"        , Str(3)                )
assert_equal( 2          , #"ex"                 ) \\ length
assert_equal( [1, 1]     , [eval("a=1"), a]      )
assert_equal( ["1", "1"] , [eval("a=\"1\""), a]  )

assert_equal( Vecsmall([97, 112, 112, 108, 101]), Vecsmall("apple") )
assert_equal( "apple", Strchr([97, 112, 112, 108, 101])             )

read("fun.string") \\ split
assert_equal( ["a1", "b2", "c3"] , split("a1 b2 c3")      )
assert_equal( ["a1", "b2", "c3"] , split("a1,b2,c3", ",") )
assert_equal( ["a", "b", "c"]    , split("abc", "")       )

quit
