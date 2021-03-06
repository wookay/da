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

#define true 1

int main(int argc, char* argv[]) {

  assert_equal( 1    , 1              );
  assert_equal( 3    , 1+2            );
  assert_equal( 'a'  , 97             );
  assert_equal( true , 1==1           );
  assert_equal( 1    , 1./3+1./3+1./3 );

  return 0;

}
