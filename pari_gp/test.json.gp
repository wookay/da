\\ test.json
\\                           wookay.noh at gmail.com

read("fun.json") \\ to_json parse_json
read(unittest)

assert_equal( "0"         , to_json(0)                     )
assert_equal( "1"         , to_json(1)                     )
assert_equal( "1.0"       , to_json(1.0)                   )
assert_equal( "1.01"      , to_json(1.01)                  )
assert_equal( "1.2"       , to_json(1.2)                   )
assert_equal( "\"\""      , to_json("")                    )
assert_equal( "\"abc\""   , to_json("abc")                 )
assert_equal( "[]"        , to_json([])                    )
assert_equal( "[1, 2, 3]" , to_json([1,2,3])               )
assert_equal( "[1.1]"     , to_json([1.1])                 )
assert_equal( "[[1.1]]"   , to_json([[1.1]])               )
assert_equal( "[\"abc\"]" , to_json(["abc"])               )

assert_equal( 0           , parse_json("0")                )
assert_equal( 1           , parse_json("1")                )
assert_equal( 1.0         , parse_json("1.0")              )
assert_equal( 1.2         , parse_json("1.2")              )
assert_equal( ""          , parse_json("\"\"")             )
assert_equal( "abc"       , parse_json("\"abc\"")          )
assert_equal( []          , parse_json("[]")               )
assert_equal( [1, 2, 3]   , parse_json("[1, 2, 3]")        )
assert_equal( [1.1]       , parse_json("[1.1]")            )
assert_equal( [[1.1]]     , parse_json("[[1.1]]")          )
assert_equal( ["abc"]     , parse_json("[\"abc\"]")        )

quit
