USING: tools.test namespaces destructors io.streams.string strings io.encodings.binary io.streams.byte-array byte-arrays io.sockets io.encodings.utf8 threads ;
USING: kernel arrays prettyprint accessors concurrency.promises io.streams.duplex combinators sequences accessors quotations.private ;

USE: io
IN: test_with-client:


SYMBOL: promise

! Creates a new promise which may be fulfilled by calling fulfill.
[ ] [ <promise> promise set ] unit-test


[ ] [
    [
        "127.0.0.1" 8000 <inet4> utf8 <server>
        dup addr>> promise get fulfill
        [
            ! server-port
            accept drop
            
            ! duplex-stream
            [ readln write flush ] with-stream

        ] with-disposal
    ] "Socket close test" spawn drop
] unit-test



[ "hi" f ] [

    promise get 

    ?promise 
    ! Waits for another thread to fulfill a promise, returning immediately if the promise has already been fulfilled.

    utf8 [
        "hi\n" write flush readln readln
    ] with-client
] unit-test

