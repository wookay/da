! test_any.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ "f" 97 } ] [ "factor" [EBNF rule="f" . EBNF] ] unit-test
