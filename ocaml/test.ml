(* test.ml
                             wookay.noh at gmail.com
                             http://wookay.egloos.com
*)

open Printf ;;
let assert_equal expected got =
  if expected=got then
    printf "passed: %d\n" expected
  else
    printf "Assertion failed\nExpected: %d\nGot: %d\n" expected got
  ;;

assert_equal 1 1     ;;
assert_equal 3 (1+2) ;;
