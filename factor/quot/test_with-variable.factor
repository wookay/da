USING: tools.test namespaces math ;
IN: test_with-variable
SYMBOL: num

[ 10 ] [ 10 num [ num get ] with-variable ] unit-test

[ 10 f ] [ 10 num [ num get ] with-variable num get ] unit-test
[ f ] [ num get ] unit-test
