// test_func.c
//                           wookay.noh at gmail.com

#include <stdio.h>

typedef struct t {
  int value;
} t;

void assert_equal(t expected, t got) {
  if (expected.value==got.value) {
    printf("passed: %d\n", expected.value);
  } else {
    printf("Assertion failed\nExpected: %d\nGot: %d\n",
      expected.value, got.value);
  }
}

int main(int argc, char* argv[]) {

  t a = { 3 };
  t b = { 1+2 };
  assert_equal( a , b );
  return 0;

}
