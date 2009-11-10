USING: tools.test namespaces destructors io.streams.string strings io.encodings.binary io.streams.byte-array byte-arrays io.sockets io.encodings.utf8 threads ;
USING: kernel arrays prettyprint accessors concurrency.promises io.streams.duplex combinators destructors.private accessors classes ;
USING: destructors kernel tools.test continuations accessors
namespaces sequences destructors.private ;

USE: destructors
IN: test_with-disposal

TUPLE: dummy disposed? ;
SYMBOL: sym

[ POSTPONE: f ] [ sym get class ] unit-test

T{ dummy } sym set

[ dummy ] [ sym get class ] unit-test

[ f ] [ sym get disposed?>> ] unit-test


M: dummy dispose t >>disposed? drop ;
[ ] [ sym get dispose ] unit-test

[ T{ dummy f t } ] [ sym get ] unit-test

[ t ] [ sym get disposed?>> ] unit-test


f dummy boa sym set
[ f ] [ sym get disposed?>> ] unit-test
[ 42 ] [ sym get [ drop 42 ] with-disposal ] unit-test
[ t ] [ sym get disposed?>> ] unit-test
