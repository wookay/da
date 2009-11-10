USING: tools.test namespaces ;
IN: test_with-scope
SYMBOL: num

20 num set
[ 42 20 ] [ [ 10 num set 42 ] with-scope num get ] unit-test
