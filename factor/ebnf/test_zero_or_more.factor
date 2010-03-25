! test_zero_or_more.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ V{ } "f" } ] [ "ffactor" [EBNF rule="p"* "f" EBNF] ] unit-test
