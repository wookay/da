! test_sequence.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ "f" V{ "a" } "c" } ] [ "factor" [EBNF rule="f" ("a")* "c" EBNF] ] unit-test
[ V{ "f" V{ } "a" } ] [ "factor" [EBNF rule="f" ("p")* "a" EBNF] ] unit-test
