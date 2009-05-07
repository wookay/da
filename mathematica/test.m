(* test.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ 1    , 1    ]
assertEqual[ 3    , 1+2  ]
assertEqual[ "a"  , "a"  ]
assertEqual[ True , 1==1 ]

Exit[]
