USING: tools.test namespaces destructors io.streams.string strings io.encodings.binary io.streams.byte-array byte-arrays ;
USING: kernel arrays prettyprint ;

USE: io
IN: test_duplex

SYMBOL: stdout

[ "ab" ] [ "abc" <string-reader> [ 2 read ] with-input-stream ] unit-test

<string-writer> stdout set
[ "ab" ] [ stdout get [ "ab" write ] with-output-stream stdout get >string ] unit-test

[ "abc" ] [ "abcde" [ 3 read ] with-string-reader ] unit-test
[ "abcde" ] [ [ "abcde" write ] with-string-writer ] unit-test

[ "abc" ] [ "abc" <string-reader> stdout get [ 5 read dup write ] with-streams ] unit-test
[ "ababc" ] [ stdout get >string ] unit-test

[ "ab" ] [ "abc" <string-reader> 2 swap stream-read ] unit-test
[ "ababca" ] [ stdout get "a" swap stream-write stdout get >string ] unit-test

SYMBOL: byteout
binary <byte-writer> byteout set
[ B{ 1 2 } ] [ B{ 1 2 3 } binary <byte-reader> byteout get [ 2 read dup write ] with-streams ] unit-test
[ BV{ 1 2 } ] [ byteout get ] unit-test
[ B{ 1 2 } ] [ byteout get >byte-array ] unit-test

USE: io.streams.duplex
[ B{ 1 2 } ]
[ 
  B{ 1 2 3 } binary <byte-reader> byteout get <duplex-stream>
  [ 2 read dup write ] with-stream 
] unit-test

[ BV{ 1 2 1 2 } ] [ byteout get ] unit-test
