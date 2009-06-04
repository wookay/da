// test.fs
//                            wookay.noh at gmail.com

let assert_equal expected got =
  if expected=got then
    printfn "passed: %d" expected
  else
    printfn "Assertion failed\nExpected: %d\nGot: %d" expected got
  ;;

assert_equal 1 1     ;;
assert_equal 3 (1+2) ;;
