USING: tools.test lists ;

[ t ] [ nil list? ] unit-test
[ t ] [ nil nil? ] unit-test
[ t ] [ 5 1list list? ] unit-test
[ 1 ] [ 5 1list llength ] unit-test
[ 0 ] [ nil llength ] unit-test
[ f ] [ { } list? ] unit-test
[ t ] [ { } sequence>list nil? ] unit-test
[ +nil+ ] [ { } sequence>list ] unit-test
[ { } ] [ nil list>array ] unit-test
[ { 5 } ] [ 5 1list list>array ] unit-test
[ f ] [ [ ] list? ] unit-test
