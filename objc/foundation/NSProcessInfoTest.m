// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSProcessInfo)

- (void) test_NSProcessInfo {

  NSProcessInfo* info = [NSProcessInfo processInfo];
  assert_equal(true, ([[info environment] count] > 0));

}

@end
