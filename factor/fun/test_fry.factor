USING: kernel tools.test math fry arrays sequences accessors byte-arrays io.binary ;

[ 1 2 ]       [ 2 '[ 1 _ ] call ] unit-test
[ B{ 1 2 } ]  [ 2 '[ 1 _ 2byte-array ] call ] unit-test
[ B{ 1 0 0 0 2 } ]  [ 2 '[ 1 1 >be _ 4 >be ] call append ] unit-test

[ { 1 2 3 } ]  [ 3 '[ 1 2 _ ] call 3array ] unit-test

[ B{ 1 2 3 } ]  [ 1 1array 2 3 2array 2array B{ } [ append ] reduce ] unit-test

[ 1 2 3 ]       [ 2 3 '[ 1 _ _ ] call ] unit-test
[ 1 2 3 ]       [ [ 2 ] 3 '[ 1 @ _ ] call ] unit-test
