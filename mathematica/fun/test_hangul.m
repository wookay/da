(* test_hangul.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ ㄱ    , ㄱ    ]
assertEqual[ 2ㄱ    , ㄱ*2  ]

일주일 = {월, 화, 수, 목, 금, 토, 일}
assertEqual[ 7 , Length[일주일]  ]

Exit[]
