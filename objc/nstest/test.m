// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* assert_equal = [UnitTest alloc];
  [[NSNumberTest alloc] unittest:assert_equal];
  [[NSStringTest alloc] unittest:assert_equal];
  [[NSMutableSetTest alloc] unittest:assert_equal];

  [pool release];
  return 0;
}
