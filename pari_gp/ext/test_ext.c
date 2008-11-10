// test_ext.c
//                           wookay.noh at gmail.com

#include <pari/pari.h>

void assert_equal(GEN expected, GEN got) {
  if (gequal(expected, got)) {
    pariprintf("passed: %Z\n", expected);
  } else {
    pariprintf("Assertion failed\nExpected: %Z\nGot: %Z\n", expected, got);
  }
}

int main() {
  pari_init(0, 0);

  assert_equal( stoi(1) , stoi(1)   );
  assert_equal( stoi(3) , stoi(1+2) );

  return 0;
}
