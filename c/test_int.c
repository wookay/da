// test_int.c
//                           wookay.noh at gmail.com

#include <stdio.h>

void assert_equal(int expected, int got) {
  if (expected==got) {
    printf("passed: %d\n", expected);
  } else {
    printf("Assertion failed\nExpected: %d\nGot: %d\n", expected, got);
  }
}

int main(int argc, char* argv[]) {

  assert_equal( 1 , 1   );
  assert_equal( 3 , 1+2 );
  return 0;

}
