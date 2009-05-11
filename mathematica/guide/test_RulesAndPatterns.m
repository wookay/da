(* test_RulesAndPatterns.m
                               wookay.noh at gmail.com
*)

assertTrue[expr_Symbol] := assertEqual[True, expr]
assertFalse[expr_Symbol] := assertEqual[False, expr]
assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ lhs -> rhs     , Rule[lhs, rhs]                  ]
assertEqual[ {2, 3}         , {x, x + 1} /. Rule[x, 2]        ]
assertEqual[ {2, 3}         , {x, x + 1} /. x -> 2            ]

assertEqual[ expr /. rules  , ReplaceAll[expr, rules]         ]
assertEqual[ {2, 3}         , ReplaceAll[{x, x + 1}, x->2]    ]
assertEqual[ {2, 3}         , {x, x + 1} /. x -> 2            ]
assertEqual[ Cos[x]         , ReplaceAll[Sin[x], Sin -> Cos]  ]
assertEqual[ {1, 3}         , ReplaceAll[x, {{x->1}, {x->3}}] ]

assertEqual[ lhs :> rhs     , RuleDelayed[lhs, rhs]                 ]
assertTrue[                   1 > x /. RuleDelayed[x, RandomReal[]] ]
assertTrue[                   1 > x /. x :> RandomReal[]            ]

assertEqual[ expr //. rules , ReplaceRepeated[expr, rules]    ]
assertEqual[ f[a, b, c] , ReplaceRepeated[f[a][b][c], g_[x_][y__] -> g[x, y]] ]
assertEqual[ f[a, b, c] , f[a][b][c] //. g_[x_][y__] -> g[x, y]               ]

assertEqual[ patt /; test       , Condition[patt, test]                      ]
assertEqual[ lhs :> rhs /; test , lhs :> Condition[rhs, test]                ]
assertEqual[ lhs := rhs /; test , lhs := Condition[rhs, test]                ]
assertEqual[ {0, 0, 3, 4, 5}    , {1, 2, 3, 4, 5} /. Condition[x_, x<3] -> 0 ]
assertEqual[ {0, 0, 3, 4, 5}    , {1, 2, 3, 4, 5} /. (x_ /; x<3) -> 0        ]

assertEqual[ _               , Blank[]                     ]
assertEqual[ _h              , Blank[h]                    ]
                                                           
assertEqual[ __              , BlankSequence[]             ]
assertEqual[ __h             , BlankSequence[h]            ]
f[x__] := Length[{x}]                                      
assertEqual[ 2               , f[x,y]                      ]
assertEqual[ 3               , f[x,y,z]                    ]

assertEqual[ a | b           , Alternatives[a, b]          ]
assertEqual[ a | b | c       , Alternatives[a, b, c]       ]
assertEqual[ {0, 0, 3, 4, 5} , {1, 2, 3, 4, 5} /. 1|2 -> 0 ]

assertEqual[ p..                 , Repeated[p]                       ]
assertEqual[ {x, {x, x}, {x, 1}} , {0, {0, 0}, {0, 1}} /. 0.. -> x   ]
assertEqual[ {0, x, {0, 1}}      , {0, {0, 0}, {0, 1}} /. {0..} -> x ]

assertEqual[ {2, 3, 4, 5} , Cases[{1, 2, 3, 4, 5}, Except[1]]        ]
assertEqual[ {3, 4, 5}    , Cases[{1, 2, 3, 4, 5}, Except[1|2]]      ]

assertEqual[ {{1}, {2, 3}}   , {1, 2, 3} /. {x__, y__} -> {{x}, {y}}           ]
assertEqual[ {{1, 2}, {3}}   , {1, 2, 3} /. {Longest[x__], y__} -> {{x}, {y}}  ]
assertEqual[ {{1, 2}, {3}}   , {1, 2, 3} /. {x__, Shortest[y__]} -> {{x}, {y}} ] 
assertEqual[ {1, 2} , Cases[{1, 2, a, b}, _Integer]         ]
assertEqual[ {a, b} , Cases[{1, 2, a, b}, Except[_Integer]] ]
assertEqual[ {a, b} , DeleteCases[{1, 2, a, b}, _Integer]   ]

assertEqual[ {{3}}  , Position[{1, 2, a, b}, a]             ]

assertTrue[           MemberQ[{1, 2, a, b}, a]              ]
assertFalse[          MemberQ[{1, 2, a, b}, 3]              ]

assertTrue[           MatchQ[0, _Integer]                   ]
assertTrue[           MatchQ[x+x, Plus[_,_]]                ]
assertTrue[           MatchQ[x+y, Plus[_,__]]               ]

assertEqual[ 2      , Count[{1, 2, a, b}, _Integer]         ]

assertEqual[ lhs = rhs , Set[lhs, rhs]         ]
{l1, _} = {1, 2}
assertEqual[ 1         , l1                    ]

assertEqual[ lhs := rhs , SetDelayed[lhs, rhs] ]

Exit[]
