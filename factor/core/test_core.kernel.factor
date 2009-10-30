#! core.kernel
#!                               wookay.noh at gmail.com

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
! [ 5 0 0             ] [ 2 3 [ + ] 0 0 2slip          ] unit-test
[ 5 -1 6            ] [ 2 3 [ + ] [ - ] [ * ] 2tri   ] unit-test
[ 3 9 3 20          ] [ 3 4 5 [ + ] [ * ] 3bi        ] unit-test
! [ [ + - * ]         ] [ [ + ] [ - ] [ * ] 3compose   ] unit-test
[ [ 3 4 5 + ]       ] [ 3 4 5 [ + ] 3curry           ] unit-test
[ 3 4               ] [ 3 4 5 6 7 3drop              ] unit-test
[ 3 4 5 3 4 5       ] [ 3 4 5 3dup                   ] unit-test
[ 3 9 3 4 5         ] [ 3 4 5 [ + ] 3keep            ] unit-test
! [ 5 0 0 0           ] [ 2 3 [ + ] 0 0 0 3slip        ] unit-test
[ 3 9 3 -1 3 20     ] [ 3 4 5 [ + ] [ - ] [ * ] 3tri ] unit-test
[ 0 1 W{ 2 }        ] [ 0 1 2 <wrapper>              ] unit-test
[ f                 ] [ 0 1 =                        ] unit-test
[ t                 ] [ 1 >boolean                   ] unit-test
! [ [ >r ]            ] [ [ >r ]                       ] unit-test
[ 1                 ] [ t 1 2 ?                      ] unit-test
[ t 1               ] [ 0 t [ 1 ] [ 2 ] ?if          ] unit-test
[ 0 2               ] [ 0 f [ 1 ] [ 2 ] ?if          ] unit-test
[ 1                 ] [ t 1 and                      ] unit-test
[ f                 ] [ f 0 and                      ] unit-test
[ [ 0 0 assert ]    ] [ [ 0 0 assert ]               ] unit-test
! [ [ assert-expect ] ] [ [ assert-expect ]            ] unit-test
! [ [ assert-got ]    ] [ [ assert-got ]               ] unit-test
[                   ] [ 0 0 assert=                  ] unit-test
[ f                 ] [ "assert" assert?             ] unit-test
[ 15                ] [ 2 3 [ + ] [ * ] bi           ] unit-test
[ 20                ] [ 2 3 4 [ + ] [ * ] bi*        ] unit-test
[ 0 1 2 12          ] [ 0 1 2 3 4 5 [ + ] bi@        ] unit-test

USING: classes.tuple ; IN: scratchpad
TUPLE: color red green blue alpha ;
[ T{ color f 1 2 3 4 }  ] [ 1 2 3 4 color boa                   ] unit-test
C: colour color         
[ T{ color f 1 2 3 4 }  ] [ 1 2 3 4 colour                      ] unit-test
                        
[ t                     ] [ 1 2 [ 3 < ] both?                   ] unit-test
[ t                     ] [ build 438 >=                        ] unit-test
[ 5                     ] [ [ 2 3 + ] call                      ] unit-test
[ [ call-clear ]        ] [ [ call-clear ]                      ] unit-test
[ [ callstack ]         ] [ [ callstack ]                       ] unit-test
[ [ callstack>array ]   ] [ [ callstack>array ]                 ] unit-test
[ t                     ] [ callstack callstack?                ] unit-test
[                       ] [ 1 2 clear                           ] unit-test
[ 1 2                   ] [ 1 2 clone                           ] unit-test
[ [ + * ]               ] [ [ + ] [ * ] compose                 ] unit-test
! [ [ + ]                 ] [ [ + ] [ * ] compose compose-first   ] unit-test
! [ [ * ]                 ] [ [ + ] [ * ] compose compose-second  ] unit-test
[ t                     ] [ [ + ] [ * ] compose compose?        ] unit-test
! [ T{ color f 0 f f f }  ] [ 0 { set-color-red } color construct ] unit-test
! [ T{ color 0 f f f f }  ] [ 0 color construct-delegate          ] unit-test
[ [ 1 + ]               ] [ 1 [ + ] curry                       ] unit-test
! [ 1                     ] [ 1 [ + ] curry curry-obj             ] unit-test
! [ [ + ]                 ] [ 1 [ + ] curry curry-quot            ] unit-test
[ t                     ] [ 1 [ + ] curry curry?                ] unit-test
[ 1 2 3 { 1 2 3 }       ] [ 1 2 3 datastack                     ] unit-test
! [ 1 2 f                 ] [ 1 2 3 delegate                      ] unit-test
[ [ die ]               ] [ [ die ]                             ] unit-test
[ 1 5 4                 ] [ 1 2 3 4  [ + ] dip                  ] unit-test
[ 1 2 3                 ] [ 1 2 3 4 drop                        ] unit-test
[ 1 2 3 3               ] [ 1 2 3 dup                           ] unit-test
[ 1 2 2 3               ] [ 1 2 3 dupd                          ] unit-test
[ t                     ] [ 1 2 [ odd? ] either?                ] unit-test
[ f                     ] [ 1 2 eq?                             ] unit-test
[ f                     ] [ 1 2 equal?                          ] unit-test
! [ [ get-slots ]         ] [ [ get-slots ]                       ] unit-test
[ 3323                  ] [ "ab" hashcode                       ] unit-test
[ 3323                  ] [ 0 "ab" hashcode*                    ] unit-test

TUPLE: foo < identity-tuple ;
[ t                     ] [ T{ color } dup clone =              ] unit-test
[ f                     ] [ T{ foo } dup clone =                ] unit-test
[ t                     ] [ T{ foo } identity-tuple?            ] unit-test
                        
[ 1                     ] [ t [ 1 ] [ 0 ] if                    ] unit-test
[ 0                     ] [ f [ 1 ] [ 0 ] if                    ] unit-test
[ t 1                   ] [ t [ 1 ] [ 0 ] if*                   ] unit-test
[ 0                     ] [ f [ 1 ] [ 0 ] if*                   ] unit-test
[ 1 2 3 1               ] [ 1 [ 2 3 ] keep                      ] unit-test
[ [ loop ]              ] [ [ loop ]                            ] unit-test
[ 2                     ] [ 1 2 [ > ] most                      ] unit-test
[ 2                     ] [ 2 1 [ > ] most                      ] unit-test
[ T{ color f f f f f }  ] [ color new                           ] unit-test
[ 1 3                   ] [ 1 2 3 nip                           ] unit-test
[ f                     ] [ 1 not                               ] unit-test
[ null                  ] [ null                                ] unit-test
[ object                ] [ object                              ] unit-test
[ 1                     ] [ f 1 or                              ] unit-test
[ 1 2 3 2               ] [ 1 2 3 over                          ] unit-test
[ 1 2 3 1               ] [ 1 2 3 pick                          ] unit-test 
[ [ 1 2 + ]             ] [ [ + ] [ 1 2 ] prepose               ] unit-test
! [ [ r> ]                ] [ [ r> ]                              ] unit-test
[ [ retainstack ]       ] [ [ retainstack ]                     ] unit-test
[ 2 3 4 1               ] [ 1 2 3 4 roll                        ] unit-test
[ 2 3 1                 ] [ 1 2 3 rot                           ] unit-test
! [ [ set-assert-expect ] ] [ [ set-assert-expect ]               ] unit-test
! [ [ set-assert-got ]    ] [ [ set-assert-got ]                  ] unit-test
[ 1                     ] [ 1 callstack set-callstack           ] unit-test
! [                       ] [ 0 [ + ] [ * ] compose set-compose-first  ] unit-test
! [                       ] [ 0 [ + ] [ * ] compose set-compose-second ] unit-test
! [                       ] [ [ ] 0 [ + ] curry set-curry-obj     ] unit-test
! [                       ] [ [ ] 0 [ + ] curry set-curry-quot    ] unit-test
[ 1 2 3                 ] [ { 1 2 3 } set-datastack             ] unit-test
! [ 1                     ] [ 1 2 delegate T{ foo } set-delegate  ] unit-test
[                       ] [ retainstack set-retainstack         ] unit-test
! [ [ set-slots ]         ] [ [ set-slots ]                       ] unit-test
! [ [ set-tuple-delegate ] ] [ [ set-tuple-delegate ]             ] unit-test
! [ 3 0                   ] [ 1 2 [ + ] 0 slip                    ] unit-test
! [ 1 2 7 0               ] [ 1 2 [ 3 4 + ] 0 slip                ] unit-test
[ 3 2 1                 ] [ 1 2 3 spin                          ] unit-test
[ 2 1                   ] [ 1 2 swap                            ] unit-test
[ 2 1 3                 ] [ 1 2 3 swapd                         ] unit-test
[ [ "error" throw ]     ] [ [ "error" throw ]                   ] unit-test
[ 1 2 20                ] [ 1 2 3 4 [ * ] [ + ] [ + ] tri       ] unit-test
[ 9                     ] [ 1 2 3 4 [ * ] [ + ] [ + ] tri*      ] unit-test
[ 10                    ] [ 1 2 3 4 [ + ] tri@                  ] unit-test
[ 2 1 2                 ] [ 1 2 tuck                            ] unit-test
[ tuple                 ] [ tuple                               ] unit-test
! [ [ tuple-delegate ]    ] [ [ tuple-delegate ]                  ] unit-test
[ t                     ] [ T{ color } tuple?                   ] unit-test
[                       ] [ t [ 1 ] unless                      ] unit-test
[ 1                     ] [ f [ 1 ] unless                      ] unit-test
[ t                     ] [ t [ 1 ] unless*                     ] unit-test
[ 1                     ] [ f [ 1 ] unless*                     ] unit-test
[ 1                     ] [ t [ 1 ] when                        ] unit-test
[                       ] [ f [ 1 ] when                        ] unit-test
[ t 1                   ] [ t [ 1 ] when*                       ] unit-test
[                       ] [ f [ 1 ] when*                       ] unit-test
[ [ while ]             ] [ [ while ]                           ] unit-test
[ 2 [ 1 [ + ] swapd call ] ] [ 1 2 [ + ] with                   ] unit-test
[ wrapper               ] [ wrapper                             ] unit-test
[ f                     ] [ wrapper wrapper?                    ] unit-test
[ f                     ] [ 1 1 xor                             ] unit-test
[ f                     ] [ f f xor                             ] unit-test
