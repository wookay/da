(* test_string.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ {"a", "b", "c"} , StringSplit["a,b,c", ","]                      ]
assertEqual[ "abc"           , StringJoin[{"a", "b", "c"}]                    ]
assertEqual[ "abcdefg"       , StringJoin[CharacterRange["a", "g"]]           ]
assertEqual[ {1, Plus, 2}    , Riffle[{1, 2}, Plus]                           ]
assertEqual[ "1+2+3"         , StringJoin[Riffle[Map[ToString,{1,2,3}], "+"]] ]
assertEqual[ "a,b,c"         , StringJoin[Riffle[{"a","b","c"}, ","]]         ]
assertEqual[ "abc,"          , StringJoin[{"a","b","c"}, ","]                 ]
assertEqual[ "abc"           , StringTrim[" abc "]                            ]
assertEqual[ "abc"           , StringReplace["a,b,c", "," -> ""]              ]

assertEqual[ "cba"           , StringReverse["abc"]                           ]
assertEqual[ 3               , StringLength["abc"]                            ]

assertEqual[ {"ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄸ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅃ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"} ,
                               CharacterRange["ㄱ", "ㅎ"]                     ]

Exit[]
