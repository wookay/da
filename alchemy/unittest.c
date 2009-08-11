// unittest.c
//                           wookay.noh at gmail.com

#include <stdio.h>
#include "AS3.h"

static AS3_Val assert_equal(void* self, AS3_Val args) {
  int expected, got;
  AS3_ArrayValue(args, "IntType, IntType", &expected, &got);

  char buf[256];
  if (expected == got) {
    sprintf(buf, "passed: %d\n", expected); 
  } else {
    sprintf(buf, "Assertion failed\nExpected: %d\nGot: %d\n", expected, got);
  }
  return AS3_String(buf);
}

int main() {

  AS3_Val assert_equal_method = AS3_Function(NULL, assert_equal);
  AS3_Val result = AS3_Object("assert_equal: AS3ValType", assert_equal_method);
  AS3_Release(assert_equal_method);
  AS3_LibInit(result);
  return 0;

}
