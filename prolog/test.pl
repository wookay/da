/* test.pl
                          wookay.noh at gmail.com
                          http://wookay.egloos.com
*/

assert_equal(Expected, Got):-
  Expected=Got,
  write('passed: '), write(Expected), write('\n').

main:- 
  assert_equal( 1   , 1   ),
  assert_equal( 'a' , 'a' ),
  true.
