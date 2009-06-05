(* test_polynomial.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


sum = InterpolatingPolynomial[{1, 3, 6}, #] &
odd = InterpolatingPolynomial[{1, 3, 5}, #] &
even = InterpolatingPolynomial[{2, 4, 6}, #] &
power = InterpolatingPolynomial[{1, 4, 9}, #] &

assertEqual[ 55             , sum[10]                                      ]
assertEqual[ 1/2 n (1 + n)  , FindSequenceFunction[Map[sum, Range[4]], n]  ]
assertEqual[ 1 + (-1 + n) (1 + n) , power[n] ]

Exit[]
