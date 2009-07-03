(* test_affine_transform.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


t = AffineTransform[{IdentityMatrix[2], {Subscript[b, 1], Subscript[b, 2]}}]
assertEqual[ {x + Subscript[b, 1], y + Subscript[b, 2]} , t[{x, y}] ]

Exit[]
