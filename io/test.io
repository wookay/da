// test.io
//                               wookay.noh at gmail.com

assert_equal := method(expected, got,
  if(expected==got,
    "passed: #{expected}",
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
  ) interpolate println
)

assert_equal( 1                     , 1                    )
assert_equal( 3                     , doString("1+2")      )
assert_equal( 11                    , 1 + 2 * 3 + 4        )
assert_equal( 0.0000123456          , 123.456e-7           )
assert_equal( 15                    , 0x0F                 )
assert_equal( " \"test\" "          , """ "test" """       )
                                                           
Dog := Object clone                                        
assert_equal( list("type")          , Dog slotNames        )
assert_equal( "Dog"                 , Dog type             )
assert_equal( "red"                 , Dog color := "red"   )
assert_equal( "red"                 , Dog color            )
                                                           
Dog bark := method("woof!")                                
assert_equal( "woof!"               , Dog bark             )
                                                           
b := block(a, a + b)                                       
assert_equal( "block(a, a +(b))"    , b code               )
                                                           
assert_equal( nil                   , nil                  )
assert_equal( true                  , 1 < 2                )
assert_equal( false                 , true not             )
                                                           
a := list(33, "a")                                         
assert_equal( list(33, "a")         , a                    )
assert_equal( list(33, "a", "b")    , a append("b")        )
assert_equal( 3                     , a size               )
assert_equal( "a"                   , a at(1)              )
assert_equal( list(33, "a", "foo")  , a atPut(2, "foo")    )
assert_equal( "index out of bounds" , try(a atPut(6, "Fred")) error asMutable strip)

assert_equal( list(33, "a")         , a remove("foo")      )
assert_equal( list(33, "a", "foo")  , a atInsert(2, "foo") )

assert_equal( "nil"                 , nil type             )
assert_equal( "true"                , true type            )
assert_equal( "false"               , false type           )
assert_equal( "Number"              , 1 type               )
assert_equal( "ImmutableSequence"   , "" type              )
assert_equal( "List"                , list() type          )

numbers := list(1, 2, 3, 4, 5)
assert_equal( list(1, 3, 5)         , numbers select(isOdd) )
assert_equal( list(2, 4, 6, 8, 10)  , numbers map(x, x*2)   )
assert_equal( list(3, 6, 9, 12, 15) , numbers map(*3)       )

assert_equal( true                  , "apples" containsSeq("ppl") )
assert_equal( 97                    , "Kavi" at(1)                )
assert_equal( "Ki"                  , "Kirikuro" slice(0, 2)      )
assert_equal( "ro"                  , "Kirikuro" slice(-2)        )
assert_equal( list("a", "b", "c")   , "a b c" split               )
assert_equal( 13                    , "13" asNumber               )
assert_equal( true                  , "a13" asNumber isNan        )

assert_equal( "abcdef"              , "abc" .. "def"              )
assert_equal( "12"                  , 1 .. 2                      )

assert_equal( false                 , 1 < 2 < 3                   )
assert_equal( true                  , 1 < 2 and 2 < 3             )
