// test_string.c
//                           wookay.noh at gmail.com

#include <stdio.h>

void assert_equal(const char* expected, const char* got) {
  if (0 == strcmp(expected, got)) {
    printf("passed: %s\n", expected);
  } else {
    printf("Assertion failed\nExpected: %s\nGot: %s\n", expected, got);
  }
}

int main(int argc, char* argv[]) {

  assert_equal( "a" , "a" );
  return 0;

}
