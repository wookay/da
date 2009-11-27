// test.go
//                           wookay.noh at gmail.com

package main

func assert_equal(expected, got int) {
  if expected == got {
    print("passed: ", expected, "\n")
  } else {
    print("Assertion failed\nExpected: ", expected, "\nGot: ", got, "\n")
  }
}

func main() {
  assert_equal( 1 , 1   );
  assert_equal( 3 , 1+2 );
  assert_equal( 1 , 1./3.+1./3.+1./3. );
}
