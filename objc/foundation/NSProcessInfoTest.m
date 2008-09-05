// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSProcessInfoTest

- (void) unittest:(id)assert_equal {

  NSProcessInfo* info = [NSProcessInfo processInfo];
  [assert_equal _true:[[[info arguments] objectAtIndex:0] hasSuffix:@"/test"]];
  [assert_equal _true:([[info environment] count] > 0)];

}

@end
