! test_not.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ "fa" ] [ "factor" [EBNF rule=!("p") "fa" EBNF] ] unit-test
