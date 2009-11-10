USING: kernel tools.test math prettyprint assocs ;
USING: kernel strings sequences math math.parser fry math.functions
hashtables bert byte-arrays io.binary io.encodings.utf8 io.encodings.string
words.symbol accessors combinators fry lists arrays ;
IN: test_bignum

[ f ] [ 1234567890 bignum? ] unit-test
[ t ] [ 1234567890 >bignum bignum? ] unit-test
[ f ] [ 1234567890 >bignum 0 < ] unit-test
[ 1234567890 ] [ -1234567890 >bignum abs ] unit-test

[ { 21 205 91 7 } ]
[ { } { 123456789 0 }
  [ dup first2 8 * neg shift 256 mod dup zero? not ]
  [ 1array rot prepend swap first2 1 + 2array ] while 2drop ] unit-test

[ { 21 205 91 7 } ]
[ 123456789 0 2array { } swap
  [ dup first2 8 * neg shift 256 mod dup zero? not ]
  [ 1array rot prepend swap first2 1 + 2array ] while 2drop ] unit-test

USING: fry ;
CONSTANT: SMALL_BIGNUM 110
CONSTANT: LARGE_BIGNUM 111

[ B{ 110 10 } ] [ 560 >bin length dup 
     256 <= [ '[ SMALL_BIGNUM 1 >be _ 1 >be ] call ]
            [ '[ LARGE_BIGNUM 1 >be _ 4 >be ] call ] if append ] unit-test

[ B{ 21 205 91 7 } ] [ { 21 205 91 7 } [ 1 >be ] [ append ] map-reduce ] unit-test

[ 2 ] [ 1234 >bin length  8.0 / ceiling >fixnum ] unit-test
