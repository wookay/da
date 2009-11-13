#! core.sequences
#!                               wookay.noh at gmail.com

USING: sequences sequences.private kernel ;
USING: math ;
USING: tools.test ; #! unit-test

[ 1 ] [ t [ 1 ] [ 2 ] if ] unit-test 
[ 2 ] [ f [ 1 ] [ 2 ] if ] unit-test 

[ 1 ] [ { } [ 1 ] [ 2 ] if-empty ] unit-test 
[ 1 ] [ "" [ 1 ] [ 2 ] if-empty ] unit-test 
[ 1 ] [ f [ 1 ] [ 2 ] if-empty ] unit-test 
[ 1 ] [ 0 [ 1 ] [ 2 ] if-empty ] unit-test 

[ 1 6 ] [ 1 [ 5 ] [ 6 ] if-empty ] unit-test 
[ " " 6 ] [ " " [ 5 ] [ 6 ] if-empty ] unit-test 

! [ { 1 2 0 0 }  ] [ { 1 } { 2 } { 0 0 0 0 } ((append))     ] unit-test 
! [ { 1 2 3 }    ] [ { 1 } { 2 } { 3 } { } (3append)        ] unit-test 
! [ { 1 2 3 }    ] [ { 1 } { 2 3 } { } (append)             ] unit-test 
! [ [ (delete) ] ] [ [ (delete) ]                           ] unit-test 
