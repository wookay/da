// test_func.c
//                           wookay.noh at gmail.com

#include <stdio.h>

int next(int number) {
  return number + 1;
}

typedef int( *funcPtr )( int );

int send(int number, funcPtr method) {
  return method(number); 
}

void assert_equal(int expected, int got) {
  if (expected==got) {
    printf("passed: %d\n", expected);
  } else {
    printf("Assertion failed\nExpected: %d\nGot: %d\n", expected, got);
  }
}

int main(int argc, char* argv[]) {

  assert_equal( 2 , send(1, next) );
  return 0;

}
