USING: kernel tools.test math prettyprint assocs io byte-arrays io.streams.byte-array ;
USING: kernel strings sequences math math.parser io.encodings.binary
hashtables byte-arrays io.binary io.encodings.utf8 io.encodings.string
words.symbol accessors combinators fry lists ;
IN: test_assoc

[ B{ 1 2 3 } ] [ { 1 2 3 } binary [ 3 read ] with-byte-reader ] unit-test 

[ 5 ] [ B{ 1 2 3 } [ 1 read 1 1 >be = [ 5 ] [ 6 ] if ] with-byte-reader ] unit-test 

[ B{ 121 120 } 0 ] [
    B{ 0 121 120 0 0 0 0 0 0 } binary
    [ 1 read drop "\0" read-until ] with-byte-reader
] unit-test

[ B{ 121 120 } 0 ] [
    B{ 0 121 120 0 0 0 0 0 0 } binary
    [ 1 read drop "\0" read-until ] with-byte-reader
] unit-test
