(* test_ProceduralProgramming.m
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


Set[lhs, rhs]
assertEqual[ lhs , rhs ]
lhs = . (* unset *)

{a, b} = {2, 1}
assertEqual[ {1, 2} , {b, a} ]
{a, b} = .

a = 1; b = 1
CompoundExpression[a = 1, b = 1]
{a, b} = .

a = 1
a += 1
AddTo[a, 1]
assertEqual[ 3       , a   ]
a = .                      
                           
a = 1                      
a ++                       
Increment[a]               
assertEqual[ 3       , a   ]
a = .                      
                           
x = 3                      
x *= c                     
TimesBy[x, c]              
assertEqual[ 3 c ^ 2 , x   ]
x = .

ary = {}
AppendTo[ary, 2]
assertEqual[ {2}     , ary ]
ary = .

sum = 0
Do[sum+=n, {n, 10}]
assertEqual[ 55      , sum ]

sum = 0; n = 1
While[n<=10, sum+=n; n++]
assertEqual[ 55      , sum ]

sum = 0
For[n=0, n<=10, n++, sum+=n]
assertEqual[ 55      , sum ]

assertEqual[ {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} , Table[n, {n, 10}] ]

Exit[]
