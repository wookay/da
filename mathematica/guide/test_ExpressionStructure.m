(* test_ExpressionStructure.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ "Plus[1, Times[2, x]]" , ToString[ FullForm[x*2+1] ]]

assertEqual[ "Plus[1, |          ]\n        Times[2, x]" ,
                                      ToString[ TreeForm[x*2+1] ]]

assertEqual[ String                 , Head[""]                     ]
assertEqual[ List                   , Head[{}]                     ]
assertEqual[ Integer                , Head[0]                      ]
assertEqual[ Real                   , Head[0.1]                    ]
assertEqual[ Symbol                 , Head[True]                   ]
assertEqual[ Symbol                 , Head[x]                      ]
assertEqual[ Symbol                 , Head[Plus]                   ]
assertEqual[ Plus                   , Head[Plus[x,1]]              ]

assertEqual[ 0                      , Length["0"]                  ]
assertEqual[ 3                      , Length[{1,2,3}]              ]
assertEqual[ 0                      , Length[True]                 ]

assertEqual[ 1                      , Part[{1,2,3}, 1]             ]
assertEqual[ 1                      , {1,2,3}[[1]]                 ] (* [[ ]] *)
assertEqual[ List                   , {1,2,3}[[0]]                 ]
assertEqual[ 3                      , {1,2,3}[[-1]]                ]
assertEqual[ {2,3}                  , {1,2,3}[[2;;3]]              ]
assertEqual[ {3,1,2}                , {1,2,3}[[{3,1,2}]]           ]

assertEqual[ {1, 2 b}               , Level[1+2*b, 1]              ]
assertEqual[ {1, 2, b, 2 b}         , Level[1+2*b, 2]              ]

assertEqual[ 1                      , Depth[0]                     ]
assertEqual[ 1                      , Depth[b]                     ]
assertEqual[ 2                      , Depth[{}]                    ]
assertEqual[ 2                      , Depth[{b}]                   ]
assertEqual[ 3                      , Depth[{{b}}]                 ]
assertEqual[ 3                      , Depth[1+2*b]                 ]

assertEqual[ b                      , Symbol["b"]                  ]

assertEqual[ 5                      , LeafCount[1+2*b]             ]

assertEqual[ 16                     , ByteCount[0]                 ]
assertEqual[ 16                     , ByteCount[10]                ]
assertEqual[ 32                     , ByteCount[""]                ]
assertEqual[ 32                     , ByteCount["1000"]            ]
assertEqual[ 32                     , ByteCount[{}]                ]
assertEqual[ 32                     , ByteCount[{b}]               ]
assertEqual[ 0                      , ByteCount[b]                 ]
assertEqual[ 56                     , ByteCount[2*b]               ]
assertEqual[ 112                    , ByteCount[1+2*b]             ]

assertEqual[ 1                      , Hash[""]                     ]
assertEqual[ 181                    , Hash["a"]                    ]
assertEqual[ 184                    , Hash["b"]                    ]
assertEqual[ 183                    , Hash["c"]                    ]
(* assertEqual[ 296755805509936133823244119630716415573
                                    , Hash["c", "MD5"]             ] *)

Exit[]
