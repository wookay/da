! test_and.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ "fa" ] [ "factor" [EBNF rule=&("f") "fa" EBNF] ] unit-test
         [ "factor" [EBNF rule=&("p") "fa" EBNF] ] must-fail
