(* test_list.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ {a,b,c} , List[a,b,c] ]

assertEqual[ a , Part[{a,b,c,d,e}, 1] ]
assertEqual[ a , {a,b,c,d,e}[[1]]     ]
assertEqual[ e , {a,b,c,d,e}[[-1]]    ]
assertEqual[ {a,b} , {a,b,c,d,e}[[{1,2}]] ]
assertEqual[ {b,c} , Part[{a,b,c,d,e}, 2;;3] ]
assertEqual[ {b,e,h} , Part[{{a, b, c}, {d, e, f}, {g, h, i}}, All, 2] ]

assertEqual[ {a,b,c} , Take[{a,b,c,d,e},3] ]
assertEqual[ {c,d,e} , Take[{a,b,c,d,e},-3] ]
assertEqual[ {b,c,d,e} , Rest[{a,b,c,d,e}] ]
assertEqual[ {b,c,d,e} , Drop[{a,b,c,d,e}, 1] ]
assertEqual[ {a,b,c,d} , Most[{a,b,c,d,e}] ]
assertEqual[ {a,b,c,d} , Drop[{a,b,c,d,e}, -1] ]

assertEqual[ {{2}} , Position[{a,b,c,d,e}, b] ]

assertEqual[ {3,4,4,3} , Select[{3,4,5,4,3}, # < 5 &] ]
assertEqual[ {3,4} , TakeWhile[{3,4,5,4,3}, # < 5 &] ]

assertEqual[ {a,c} , Pick[{a,b,c,d,e}, {1,0,1,0,0}, 1] ]
assertEqual[ {a,c} , Pick[{a,b,c,d,e}, {x,0,x,0,0}, x] ]

Exit[]
