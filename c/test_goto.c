// test_goto.c
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

  int idx = 0;
  goto pass; 

fail:
  assert_equal( 1    , idx  );

pass:
  assert_equal( 0    , idx  );

  return 0;
}
