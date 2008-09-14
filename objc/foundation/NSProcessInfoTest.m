// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSProcessInfoTest

- (void) unittest {

  NSProcessInfo* info = [NSProcessInfo processInfo];
  [assert_equal _true:([[info environment] count] > 0)];

}

@end
