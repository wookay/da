! test_character_class.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ 102 97 99 } ] [ "factor" [EBNF rule=[a-f]+ EBNF] ] unit-test
[ V{ V{ 102 97 99 } "t" } ] [ "factor" [EBNF rule=[a-f]+ "t" EBNF] ] unit-test
