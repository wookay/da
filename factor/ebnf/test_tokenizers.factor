! test_tokenizers.factor
!                               wookay.noh at gmail.com

USING: tools.test ;
USING: peg.ebnf peg ;
IN: test_tokenizers

EBNF: parse-abc
rule = 'a' 'b' 'c'
;EBNF

[ V{ "a" "b" "c" } ] [ "abcd" parse-abc ] unit-test
[ V{ "a" "b" "c" } ] [ "abc" parse-abc ] unit-test
                     [ "ab" parse-abc ] must-fail
                     [ "pbc" parse-abc ] must-fail
