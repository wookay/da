USING: tools.test tools.annotations math ;
IN: test_watch

: add ( x y -- n ) + ;

\ add watch
[ 3 ] [ 1 2 add ] unit-test 
\ add reset

[ 7 ] [ 2 5 add ] unit-test 
