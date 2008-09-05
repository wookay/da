// test.m
//                           wookay.noh at gmail.com

#import "test.h"

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  UnitTest* assert_equal = [[UnitTest alloc] init];
  NSLog(@"SBElementArrayTest");
  [[SBElementArrayTest alloc] unittest:assert_equal];

  assert_equal.report;

  [pool release];
  return 0;
}
