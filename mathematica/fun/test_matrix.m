(* test_matrix.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


assertEqual[ {{0, 1, 0}, {1, 1, 1}, {0, 1, 0}}, DiamondMatrix[1] ]

Exit[]
