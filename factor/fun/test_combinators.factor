USING: kernel tools.test math sequences ;
IN: test_combinators

! fundamental combinators : call execute(
[ 3            ] [ [ 1 2 + ] call              ] unit-test
[ 3            ] [ 1 [ 2 + ] call              ] unit-test
[ 3            ] [ 1 2 [ + ] call              ] unit-test
[ 3            ] [ 1 2 + [ ] call              ] unit-test

: three ( -- n ) 3 ;
[ { 3 3 }      ] [ { three three } [ execute ( -- n ) ] map ] unit-test



! data flow combinators
  ! retain stack combinators : dip keep
  [ 3 9        ] [ 1 2 9 [ + ] dip         ] unit-test
  [ 3 9 9      ] [ 1 2 9 9 [ + ] 2dip      ] unit-test
  [ 3 9 9 9    ] [ 1 2 9 9 9 [ + ] 3dip    ] unit-test
  [ 3 9 9 9 9  ] [ 1 2 9 9 9 9 [ + ] 4dip  ] unit-test

  [ 1 2 [ + ]  ] [ 1 [ + ] [ 2 ] dip       ] unit-test
  [ 1 [ 2 ]    ] [ 0 1 [ 2 ] [ + ] dip     ] unit-test

  [ 11 6       ] [ 5 6 [ + ] keep          ] unit-test
  [ 11 5 6     ] [ 5 6 [ + ] 2keep         ] unit-test
  [ 4 11 6     ] [ 4 5 6 [ + ] keep        ] unit-test
  [ 4 11 5 6   ] [ 4 5 6 [ + ] 2keep       ] unit-test
  [ 4 11 4 5 6 ] [ 4 5 6 [ + ] 3keep       ] unit-test

  [ 5 [ + ] 6 [ + ] ] [ 5 [ + ] [ 6 ] keep ] unit-test

  ! cleave combinators : bi
  [ 8 9        ] [ 6 [ 2 + ] [ 3 + ] bi    ] unit-test

  ! spread combinators : bi*
  [ 7 9        ] [ 5 6 [ 2 + ] [ 3 + ] bi* ] unit-test

  ! apply combinators : bi@
  [ 7 8        ] [ 5 6 [ 2 + ] bi@         ] unit-test


! curried dataflow combinators 
  ! curried cleave combinators : bi-curry
  [ [ 6 2 + ] [ 6 3 + ]   ] [ 6 [ 2 + ] [ 3 + ] bi-curry    ] unit-test

  ! curried spread combinators : bi-curry*
  [ [ 5 2 + ] [ 6 3 + ]   ] [ 5 6 [ 2 + ] [ 3 + ] bi-curry*   ] unit-test

  ! curried apply combinators : bi-curry@
  [ [ 5 2 + ] [ 6 2 + ]   ] [ 5 6 [ 2 + ] bi-curry@   ] unit-test


! conditional combinators : if when unless
[ 1 ] [ t [ 1 ] [ 0 ] if ] unit-test
[ 0 ] [ f [ 1 ] [ 0 ] if ] unit-test
[ 1 ] [ t [ 1 ] when ] unit-test
[ ] [ f [ 0 ] when ] unit-test
[ ] [ t [ 1 ] unless ] unit-test
[ 0 ] [ f [ 0 ] unless ] unit-test

[ t 1 ] [ t [ 1 ] [ 0 ] if* ] unit-test
[ 0 ] [ f [ 1 ] [ 0 ] if* ] unit-test
[ t 1 ] [ t [ 1 ] when* ] unit-test
[ ] [ f [ 0 ] when* ] unit-test
[ t ] [ t [ 1 ] unless* ] unit-test
[ 0 ] [ f [ 0 ] unless* ] unit-test

[ t 1 ] [ "default" t [ 1 ] [ 0 ] ?if ] unit-test
[ "default" 0 ] [ "default" f [ 1 ] [ 0 ] ?if ] unit-test

[ 1 ] [ t 1 0 ? ] unit-test
[ 0 ] [ f 1 0 ? ] unit-test


! looping combinators : while until do


! compositional combinators : curry compose
[ [ 1 2 + ] ] [ 1 [ 2 + ] curry ] unit-test
[ [ 1 2 + ] ] [ [ 1 ] [ 2 + ] compose ] unit-test


! short-circuit combinators


! smart combinators
USE: combinators.smart
[   ] [ [ 2 ] drop-outputs ] unit-test
[ 1 ] [ 1 [ 2 ] drop-outputs ] unit-test
[ 1 ] [ 1 [ 2 3 ] drop-outputs ] unit-test

[ 7 ] [ [ 3 4 + ] keep-inputs ] unit-test
[ 2 7 ] [ [ 2 3 4 + ] keep-inputs ] unit-test
