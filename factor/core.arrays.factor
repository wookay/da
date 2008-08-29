USING: arrays ;
USING: tools.test ; #! unit-test

[ { 0 }       ] [ 0 1array                   ] unit-test
[ { 0 1 }     ] [ 0 1 2array                 ] unit-test
[ { 0 1 2 }   ] [ 0 1 2 3array               ] unit-test
[ { 0 1 2 3 } ] [ 0 1 2 3 4array             ] unit-test
[ { 1 1 1 }   ] [ 3 1 <array>                ] unit-test
[ { 0 1 2 }   ] [ 3 >array                   ] unit-test
[ array       ] [ array                      ] unit-test
[ t           ] [ { } array?                 ] unit-test
[ pair        ] [ pair                       ] unit-test
[ t           ] [ { 0 0 } pair?              ] unit-test
[ { 0 1 }     ] [ 2 { 0 1 2 3 } resize-array ] unit-test
