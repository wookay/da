USING: kernel ;
USING: tools.test ; #! unit-test
USING: math ; #! + - *
 
[ 0                 ] [ 0 (clone)                    ] unit-test
[ 3 0 1 2           ] [ 0 1 2 3 -roll                ] unit-test
[ 2 0 1             ] [ 0 1 2 -rot                   ] unit-test
[ 5 6               ] [ 2 3 [ + ] [ * ] 2bi          ] unit-test
[ 5 20              ] [ 2 3 4 5 [ + ] [ * ] 2bi*     ] unit-test
[ 5 9               ] [ 2 3 4 5 [ + ] 2bi@           ] unit-test
[ [ 2 3 + ]         ] [ 2 3 [ + ] 2curry             ] unit-test
[ 5 4 5             ] [ 2 3 4 5 [ + ] 2dip           ] unit-test
[ 2 3               ] [ 2 3 4 5 2drop                ] unit-test
[ 2 3 2 3           ] [ 2 3 2dup                     ] unit-test
[ 5 2 3             ] [ 2 3 [ + ] 2keep              ] unit-test
[ 4                 ] [ 2 3 4 2nip                   ] unit-test
[ 2 3 4 2 3         ] [ 2 3 4 2over                  ] unit-test
[ 5 0 0             ] [ 2 3 [ + ] 0 0 2slip          ] unit-test
[ 5 -1 6            ] [ 2 3 [ + ] [ - ] [ * ] 2tri   ] unit-test
[ 3 9 3 20          ] [ 3 4 5 [ + ] [ * ] 3bi        ] unit-test
[ [ + - * ]         ] [ [ + ] [ - ] [ * ] 3compose   ] unit-test
[ [ 3 4 5 + ]       ] [ 3 4 5 [ + ] 3curry           ] unit-test
[ 3 4               ] [ 3 4 5 6 7 3drop              ] unit-test
[ 3 4 5 3 4 5       ] [ 3 4 5 3dup                   ] unit-test
[ 3 9 3 4 5         ] [ 3 4 5 [ + ] 3keep            ] unit-test
[ 5 0 0 0           ] [ 2 3 [ + ] 0 0 0 3slip        ] unit-test
[ 3 9 3 -1 3 20     ] [ 3 4 5 [ + ] [ - ] [ * ] 3tri ] unit-test
[ 0 1 W{ 2 }        ] [ 0 1 2 <wrapper>              ] unit-test
[ f                 ] [ 0 1 =                        ] unit-test
[ t                 ] [ 1 >boolean                   ] unit-test
[ [ >r ]            ] [ [ >r ]                       ] unit-test
[ 1                 ] [ t 1 2 ?                      ] unit-test
[ t 1               ] [ 0 t [ 1 ] [ 2 ] ?if          ] unit-test
[ 0 2               ] [ 0 f [ 1 ] [ 2 ] ?if          ] unit-test
[ 1                 ] [ t 1 and                      ] unit-test
[ f                 ] [ f 0 and                      ] unit-test
[ [ 0 0 assert ]    ] [ [ 0 0 assert ]               ] unit-test
[ [ assert-expect ] ] [ [ assert-expect ]            ] unit-test
[ [ assert-got ]    ] [ [ assert-got ]               ] unit-test
[                   ] [ 0 0 assert=                  ] unit-test
[ f                 ] [ "assert" assert?             ] unit-test
[ 15                ] [ 2 3 [ + ] [ * ] bi           ] unit-test
[ 20                ] [ 2 3 4 [ + ] [ * ] bi*        ] unit-test
[ 0 1 2 12          ] [ 0 1 2 3 4 5 [ + ] bi@        ] unit-test
