USING: tools.test words ;
IN: test_word

[ t ] [ \ word word? ] unit-test
[ t ] [ \ [ word? ] unit-test
[ t ] [ \ word? word? ] unit-test
[ t ] [ \ IN: word? ] unit-test
[ t ] [ \ t word? ] unit-test
[ t ] [ \ f word? ] unit-test

[ f ] [ "a" word? ] unit-test
[ f ] [ [ ] word? ] unit-test

USING: kernel tools.test math prettyprint assocs arrays classes stack-checker.values words sequences ;
USING: kernel strings sequences math math.parser
hashtables bert byte-arrays io.binary io.encodings.utf8 io.encodings.string
words.symbol accessors combinators fry lists ;

[ t ] [ { } empty? ] unit-test
[ f ] [ 0 { } ?nth ] unit-test
[ 0 ] [ 0 { 0 } ?nth ] unit-test
[ { 5 5 5 } ] [ 3 5 <array> ] unit-test
[ { 97 98 99 } ] [ "abc" >array ] unit-test
[ "42" ] [ 42 number>string ] unit-test
[ "\0\0\0\0\0" ] [ 5 "" new-sequence ] unit-test

TUPLE: foo ;
[ T{ foo } ] [ foo new ] unit-test

[ f f ] [ 1 H{ } at* ] unit-test
[ 2 t ] [ 1 H{ { 1 2 } } at* ] unit-test

[ word ] [ foo (clone) class ] unit-test
