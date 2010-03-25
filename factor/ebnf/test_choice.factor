! test_choice.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ "f" "a" } ] [ "factor" [EBNF rule=( "f" | "u" ) "a" EBNF] ] unit-test
[ V{ "f" "a" } ] [ "factor" [EBNF rule="f" ("u" | "a") EBNF] ] unit-test
[ V{ "f" "a" } ] [ "factor" [EBNF rule="f" ("u"|"a") EBNF] ] unit-test
