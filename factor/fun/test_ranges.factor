USING: tools.test math.ranges arrays ;

[ { 0 1 2 3 } ] [ 0 3 [a,b] >array ] unit-test
[ { 1 2 } ] [ 0 3 (a,b) >array ] unit-test
