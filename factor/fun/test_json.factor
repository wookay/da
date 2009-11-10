USING: tools.test json ;
IN: test_json
SYMBOL: foo

USE: json.writer
[ "null" ] [ json-null >json ] unit-test
[ "true" ] [ t >json ] unit-test
[ "false" ] [ f >json ] unit-test
[ "1" ] [ 1 >json ] unit-test
[ "3.14" ] [ 3.14 >json ] unit-test
[ "\"a\"" ] [ "a" >json ] unit-test
[ "[]" ] [ { } >json ] unit-test
[ "[]" ] [ B{ } >json ] unit-test
[ "{}" ] [ H{ } >json ] unit-test
[ "{\"a\":1}" ] [ H{ { "a" 1 } } >json ] unit-test
[ "\"foo\"" ] [ "foo" >json ] unit-test
[ "\"foo\"" ] [ foo >json ] unit-test

USE: json.reader
[ json-null ] [ "null" json> ] unit-test
[ { } ] [ "[]" json> ] unit-test
[ H{ } ] [ "{}" json> ] unit-test
[ H{ { "a" 1 } } ] [ "{\"a\": 1}" json> ] unit-test

USE: lists
[ "\"+nil+\"" ] [ nil >json ] unit-test
[ "{\"car\" : 5,\"cdr\" : \"+nil+\"}" ] [ 5 1list >json ] unit-test
