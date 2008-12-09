// test_func.c
//                           wookay.noh at gmail.com

#include <stdio.h>

typedef struct t {
  int value;
  char		sa_data[14]; 
} t;

void assert_equal(t expected, t got) {
  if (expected.value==got.value) {
    printf("passed: %d\n", expected.value);
  } else {
    printf("Assertion failed\nExpected: %d\nGot: %d\n",
      expected.value, got.value);
  }

  if (! strcmp(expected.sa_data, got.sa_data)) {
    printf("passed: %s\n", expected.sa_data);
  } else {
    printf("Assertion failed\nExpected: %s\nGot: %s\n",
      expected.sa_data, got.sa_data);
  }
}

int main(int argc, char* argv[]) {

  t a = { 3   , "abc" };
  t b = { 1+2 , "abc" };
  assert_equal( a , b );
  return 0;

}
