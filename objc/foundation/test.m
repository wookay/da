// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* assert_equal = [[UnitTest alloc] init];
  NSLog(@"NSNumberTest");
  [[NSNumberTest alloc] unittest:assert_equal];
  NSLog(@"NSStringTest");
  [[NSStringTest alloc] unittest:assert_equal];
  NSLog(@"NSArrayTest");
  [[NSArrayTest alloc] unittest:assert_equal];
  NSLog(@"NSMutableArrayTest");
  [[NSMutableArrayTest alloc] unittest:assert_equal];
  NSLog(@"NSMutableSetTest");
  [[NSMutableSetTest alloc] unittest:assert_equal];
  NSLog(@"NSMutableDictionaryTest");
  [[NSMutableDictionaryTest alloc] unittest:assert_equal];

  assert_equal.report;

  [pool release];
  return 0;
}
