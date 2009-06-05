(* test_FunctionalProgramming.m
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


assertEqual[ body & , Function[body] ]
assertEqual[ 3 + x  , (3 + #) &[x]   ]

assertEqual[ f[x,a] , f[Slot[], a] & [x, y]  ]
assertEqual[ f[x,a] , f[#, a] & [x, y]       ]
assertEqual[ f[y,a] , f[Slot[2], a] & [x, y] ]
assertEqual[ f[y,a] , f[#2, a] & [x, y]      ]

assertEqual[ f /@ expr    , Map[f, expr]           ]
assertEqual[ {f[1], f[2]} , Map[f, {1, 2}]         ]
assertEqual[ {"1", "2"}   , Map[ToString, {1, 2}]  ]

assertEqual[ f @@ expr    , Apply[f, expr]         ]
assertEqual[ f[1, 2]      , Apply[f, {1, 2}]       ]
assertEqual[ 6            , Apply[Plus, {1, 2, 3}] ]
assertTrue[                 Apply[#1 == #2 &, {2, 2}]              ]

assertEqual[ {f[a, {1}], f[b, {2}]} , MapIndexed[f, {a, b}]          ]

assertEqual[ {f[a, c], f[b, d]}     , MapThread[f, {{a, b}, {c, d}}] ]

assertEqual[ {f[a], b}              , MapAt[f, {a, b}, 1]            ]

assertEqual[ f //@ expr             , MapAll[f, expr]                ]
assertEqual[ f[{f[a], f[b]}]        , MapAll[f, {a, b}]              ]

g[_] = 0
Scan[(g[#] = 1) & , {2, 3}]
Scan[(g[#] = #) & , {4, 5}]
assertEqual[ 0                      , g[1]                           ]
assertEqual[ 1                      , g[2]                           ]
assertEqual[ 5                      , g[5]                           ]
assertEqual[ 0                      , g[6]                           ]

assertEqual[ f[f[x]]                , Nest[f, x, 2]                  ]
assertEqual[ {x, f[x], f[f[x]]}     , NestList[f, x, 2]              ]

assertEqual[ f[f[f[x, a], b], c]    , Fold[f, x, {a, b, c}]          ]
assertEqual[ a b                    , a * b                          ]
assertEqual[ a b c                  , Fold[Times, 1, {a, b, c}]      ]
assertEqual[ a + b + c              , Fold[Plus, 0, {a, b, c}]       ]
assertEqual[ {1, a, a b, a b c}     , FoldList[Times, 1, {a, b, c}]  ]

assertEqual[ Sqrt[2]                , FixedPoint[(# + 2/# )/2 &, 1.0]     ]
assertEqual[ {1.`, 1.5`, 1.4166666666666665`, 1.4142156862745097`, \
1.4142135623746899`, 1.414213562373095`, 1.414213562373095`},
                                      FixedPointList[(# + 2/# )/2 &, 1.0] ]
     
assertEqual[ 1                       , NestWhile[#/2 &, 16, EvenQ]        ]
assertEqual[ {16, 8, 4, 2, 1}        , NestWhileList[#/2 &, 16, EvenQ]    ]

assertEqual[ {1, 2}                  , TakeWhile[{1, 2, 3, 2}, 3 > # &]   ]
assertEqual[ 2                       , LengthWhile[{1, 2, 3, 2}, 3 > # &] ]

assertEqual[ {1, 2, 2}               , Select[{1, 2, 3, 2}, 3 > # &]      ]

assertEqual[ {{1, 1, 1}, {2, 2, 2}, {3, 3, 3}} , Array[# &, {3, 3}] ]

assertEqual[ {a, b, c}            , Sort[{b, c, a}]         ]
assertEqual[ {ㄱ, ㄴ, ㄷ}         , Sort[{ㄷ, ㄴ, ㄱ}]      ]
assertEqual[ {ㅏ, ㅑ, ㅓ, ㅕ}     , Sort[{ㅓ,ㅕ,ㅏ,ㅑ}]     ]

assertEqual[ {{ㅋ, ㅋ}, {ㅎ, ㅎ}} , Split[{ㅋ, ㅋ, ㅎ, ㅎ}] ]

assertEqual[ 1 &                  , Identity '              ]

assertEqual[ HoldForm[1 + 2 + 3 + 4 + 5] ,
                                    Composition[HoldForm, Plus] @@ Range[5] ]
assertEqual[ 15                   , Composition[Plus] @@ Range[5]           ]
assertEqual[ Plus                 , Composition[Identity, Plus]             ]

assertEqual[ f[a][b]              , Operate[f, a[b]]                        ]
assertEqual[ f[a][b]              , Operate[#[a] &, f[b]]                   ]

assertEqual[ f[x, y] + g[x, y]    , Through[(f + g)[x, y]]                  ]

assertEqual[ a.c + a.d + b.c + b.d , Distribute[(a + b).(c + d)]            ]
assertEqual[ a b c d Plus Times^2  , Distribute[(a Times b) Plus (c Times d)] ]

Exit[]
