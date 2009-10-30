! test.factor
!                               wookay.noh at gmail.com

USING: kernel io sequences math present ;
IN: test
: assert_equal ( x y -- )
  2dup = 
   [ drop present "passed: " swap append ]
   [ { } 2sequence [ present ] map first2
     [ "Assertion failed\nExpected: " swap append ]
     [ "\nGot: " swap append ] bi* append ]
   if print ;

1   1     assert_equal 
3   1 2 + assert_equal 
"a" "a"   assert_equal 
t   1 1 = assert_equal
