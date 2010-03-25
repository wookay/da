! test_one_or_more.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf ;

[ V{ V{ "f" "f" } "a" } ] [ "ffactor" [EBNF rule="f"+ "a" EBNF] ] unit-test
