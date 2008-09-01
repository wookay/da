#! core.sequences
#!                               wookay.noh at gmail.com

USING: sequences ;
USING: math ;
USING: tools.test ; #! unit-test

[ { 1 2 0 0 }  ] [ { 1 } { 2 } { 0 0 0 0 } ((append))     ] unit-test 
[ { 1 2 3 }    ] [ { 1 } { 2 } { 3 } { } (3append)        ] unit-test 
[ { 1 2 3 }    ] [ { 1 } { 2 3 } { } (append)             ] unit-test 
[ [ (delete) ] ] [ [ (delete) ]                           ] unit-test 
