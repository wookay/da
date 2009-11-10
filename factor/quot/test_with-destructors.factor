USING: tools.test namespaces destructors io.streams.string strings io.encodings.binary io.streams.byte-array byte-arrays io.sockets io.encodings.utf8 threads ;
USING: kernel arrays prettyprint accessors concurrency.promises io.streams.duplex combinators destructors.private accessors classes ;
USING: destructors kernel tools.test continuations accessors
namespaces sequences destructors.private ;

USE: destructors
IN: test_with-destructors

TUPLE: dummy-obj destroyed? ;

: <dummy-obj> ( -- obj ) dummy-obj new ;

TUPLE: dummy-destructor obj ;

C: <dummy-destructor> dummy-destructor

M: dummy-destructor dispose ( obj -- )
    obj>> t >>destroyed? drop ;

: destroy-always ( obj -- obj )
    <dummy-destructor> &dispose ;


[ f ] [ <dummy-obj> destroyed?>> ] unit-test

[ f ]
[
    [ <dummy-obj> ] with-destructors 
    destroyed?>>
] unit-test

[ t ]
[
    [ <dummy-obj> destroy-always ] with-destructors 
    obj>> destroyed?>>
] unit-test
