! USE: formatting
! [ "1" ] [ 1 "%d" sprintf ] unit-test

! from John Benediktsson's formatting.factor
USING: tools.test math kernel math.functions math.parser sequences splitting ;
IN: test_formatting

: pad-digits ( string digits -- string' )
    [ "." split1 ] dip [ CHAR: 0 pad-tail ] [ head-slice ] bi "." glue ;

: max-digits ( n digits -- n' )
    10^ [ * round ] keep / ; inline

: >exp ( x -- exp base )
    [
        abs 0 swap
        [ dup [ 10.0 >= ] [ 1.0 < ] bi or ]
        [ dup 10.0 >=
          [ 10.0 / [ 1 + ] dip ]
          [ 10.0 * [ 1 - ] dip ] if
        ] while
     ] keep 0 < [ neg ] when ;

[ 0 1 ] [ 1 >exp ] unit-test
[ 0 3.14 ] [ 3.14 >exp ] unit-test
[ -314000.0 ] [ -3.14e5 ] unit-test

: exp>string ( exp base digits -- string )
    [ max-digits ] keep -rot
    [
        [ 0 < "-" "+" ? ]
        [ abs number>string 2 CHAR: 0 pad-head ] bi
        "e" -rot 3append
    ]
    [ number>string ] bi*
    rot pad-digits prepend ;

[ "-3.1400000000000000000000000000000e+05" ] [ -3.14e5 >exp 31 exp>string ] unit-test
