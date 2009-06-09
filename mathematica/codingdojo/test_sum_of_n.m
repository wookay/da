(* test_sum_of_n.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]

SumOfN = InterpolatingPolynomial[{1, 3, 6}, #] &
assertEqual[ 55 , 1+2+3+4+5+6+7+8+9+10 ]
assertEqual[ 55 , SumOfN[10]           ]

Exit[]
