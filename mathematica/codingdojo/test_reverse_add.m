(* test_reverse_add.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ {1,2}           , IntegerDigits[12]  ]
assertEqual[ 12              , FromDigits[{1, 2}] ]

ReverseNumber = Composition[FromDigits, Reverse, IntegerDigits, Plus]
assertEqual[ 21              , ReverseNumber[12]    ]
assertEqual[ 201             , ReverseNumber[1020]  ]

AddReverseNumbers = ReverseNumber @@ ReverseNumber /@ {#1, #2} &
assertEqual[ 34              , AddReverseNumbers[24, 1] ]
assertEqual[ 1998            , AddReverseNumbers[4358, 754] ]
assertEqual[ 1               , AddReverseNumbers[305, 794] ]

Exit[]
