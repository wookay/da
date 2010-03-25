! test_string.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ "fact" ] [ "factor" [EBNF rule="fact" EBNF] ] unit-test
           [ "factor" [EBNF rule="fact" "fact" EBNF] ] must-fail
[ V{ "fact" "o" } ] [ "factor" [EBNF rule="fact" "o" EBNF] ] unit-test
[ V{ "fact" "or" } ] [ "factor" [EBNF rule="fact" "or" EBNF] ] unit-test
