! test_shuffler.factor
!                               wookay.noh at gmail.com

USING: kernel tools.test math ;

! [ 1 2 3             ] [ 1 2 3 ??                       ] unit-test
[ 1 3 2             ] [ 1 2 3 swap                     ] unit-test
[ 2 1 3             ] [ 1 2 3 swapd                    ] unit-test
[ 2 3 1             ] [ 1 2 3 rot                      ] unit-test
[ 3 1 2             ] [ 1 2 3 -rot                     ] unit-test
[ 3 2 1             ] [ 1 2 3 spin                     ] unit-test
                                                       
[ 1                 ] [ 1 2 3 2drop                    ] unit-test
! [ 2               ] [ 1 2 3 ??                       ] unit-test
[ 3                 ] [ 1 2 3 2nip                     ] unit-test
[ 1 2               ] [ 1 2 3 drop                     ] unit-test
[ 1 3               ] [ 1 2 3 nip                      ] unit-test
! [ 2 3             ] [ 1 2 3 ??                       ] unit-test
[ 1 2 3 1           ] [ 1 2 3 pick                     ] unit-test
[ 1 2 3 2           ] [ 1 2 3 over                     ] unit-test
[ 1 2 3 3           ] [ 1 2 3 dup                      ] unit-test
! [ 1 1 2 3         ] [ 1 2 3 ??                       ] unit-test
[ 1 2 2 3           ] [ 1 2 3 dupd                     ] unit-test
[ 1 3 2 3           ] [ 1 2 3 tuck                     ] unit-test
[ 1 2 3 1 2         ] [ 1 2 3 2over                    ] unit-test
[ 1 2 3 2 3         ] [ 1 2 3 2dup                     ] unit-test
                                                       
[ 1                 ] [ 1 2 3 4 3drop                  ] unit-test
[ 2 3 4 1           ] [ 1 2 3 4 roll                   ] unit-test
[ 4 1 2 3           ] [ 1 2 3 4 -roll                  ] unit-test
[ 1 2 3 4 2 3 4     ] [ 1 2 3 4 3dup                   ] unit-test
                                                       
! [ [ ]             ] [ ??                             ] unit-test
[ [ 1 ]             ] [ 1 [ ] curry                    ] unit-test
[ [ 1 + ]           ] [ 1 [ + ] curry                  ] unit-test
[ [ + * ]           ] [ [ + ] [ * ] compose            ] unit-test
[ [ 1 2 + ]         ] [ [ + ] [ 1 2 ] prepose          ] unit-test
[ [ 2 3 + ]         ] [ 2 3 [ + ] 2curry               ] unit-test
[ [ 3 4 5 + ]       ] [ 3 4 5 [ + ] 3curry             ] unit-test
                                                       
[                   ] [ [ ] call                       ] unit-test
[ 5                 ] [ [ 2 3 + ] call                 ] unit-test
[ 1 2 3 1           ] [ 1 [ 2 3 ] keep                 ] unit-test
[ 1 5 4             ] [ 1 2 3 4  [ + ] dip             ] unit-test
[ 15                ] [ 2 3 [ + ] [ * ] bi             ] unit-test
[ 15                ] [ 2 3 + 3 *                      ] unit-test

! mnestic told me kindly, thanks
[ 2 3               ] [ 1 [ 1 + ] [ 2 + ] bi           ] unit-test
[ 2 4               ] [ 1 2 [ 1 + ] [ 2 + ] bi*        ] unit-test
[ 2 3               ] [ 1 2 [ 1 + ] bi@                ] unit-test


[ 20                ] [ 2 3 4 [ + ] [ * ] bi*          ] unit-test
[ 0 1 2 12          ] [ 0 1 2 3 4 5 [ + ] bi@          ] unit-test
[ 1 2 20            ] [ 1 2 3 4 [ * ] [ + ] [ + ] tri  ] unit-test
[ 9                 ] [ 1 2 3 4 [ * ] [ + ] [ + ] tri* ] unit-test
[ 10                ] [ 1 2 3 4 [ + ] tri@             ] unit-test
                                                     
[ 5 2 3             ] [ 2 3 [ + ] 2keep                ] unit-test
[ 5 4 5             ] [ 2 3 4 5 [ + ] 2dip             ] unit-test
[ 5 6               ] [ 2 3 [ + ] [ * ] 2bi            ] unit-test
[ 5 20              ] [ 2 3 4 5 [ + ] [ * ] 2bi*       ] unit-test
[ 5 9               ] [ 2 3 4 5 [ + ] 2bi@             ] unit-test
[ 5 -1 6            ] [ 2 3 [ + ] [ - ] [ * ] 2tri     ] unit-test
                                                       
[ 3 9 3 4 5         ] [ 3 4 5 [ + ] 3keep              ] unit-test
[ 3 9 3 20          ] [ 3 4 5 [ + ] [ * ] 3bi          ] unit-test
[ 3 9 3 -1 3 20     ] [ 3 4 5 [ + ] [ - ] [ * ] 3tri   ] unit-test

! [ { }             ] [ ??                             ] unit-test
