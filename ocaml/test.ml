(* test.ml
                             wookay.noh at gmail.com
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
assert_equal 1 (int_of_float(1./.3.+.1./.3.+.1./.3.)) ;; 

