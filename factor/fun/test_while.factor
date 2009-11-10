USING: tools.test math sequences kernel arrays ;

[ 1 2 3 4 5 ] [ 0 [ 1 + dup 5 < ] [ dup ] while ] unit-test
[ { 1 2 3 4 5 } ] [ { } 0 [ 1 + dup 5 <= ] [ dup [ 1array append ] dip ] while drop ] unit-test
