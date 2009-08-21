// test.cpp
//                           wookay.noh at gmail.com

#include <iostream>
#include <vector>
using namespace std;

void assert_equal(int expected, int got) {
  if (expected==got) {
    cout << "passed: " << expected << "\n";
  } else {
    cout << "Assertion failed\n"
         << "Expected: " << expected << "\n"
         << "Got: " << got << "\n";
  }
}

int main() {
  assert_equal( 1, 1   );
  assert_equal( 3, 1+2 );
}
