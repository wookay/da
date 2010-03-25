USING: inverse tools.test arrays math kernel sequences
math.functions math.constants continuations combinators.smart ;
IN: test_inverse

[ 1 ] [ 1 [ ] undo ] unit-test
[ 1 ] [ 1 2 [ 2 ] undo ] unit-test
[   ] [ 1 2 [ 1 2 ] undo ] unit-test
[ 2 ] [ 2 2 [ dup ] undo ] unit-test
[ 1 ] [ 1 [ 2 ] [ [ 2 ] ] undo ] unit-test
[ 2 ] [ 2 1 1 [ 1 dup ] undo ] unit-test
[ 1 ] [ 1 3 [ 1 2 + ] undo ] unit-test
[   ] [ 1 3 [ 1 1 2 + ] undo ] unit-test

[ 2 1 ] [ 1 2 [ swap ] undo ] unit-test
[ 2 1 ] [ 1 2 3 [ swap 3 ] undo ] unit-test
[ 2 1 ] [ 1 2 3 4 [ swap 3 4 ] undo ] unit-test
[ 1 2 ] [ 1 2 3 4 [ 3 4 ] undo ] unit-test
