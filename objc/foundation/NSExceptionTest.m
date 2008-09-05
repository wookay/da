// NSExceptionTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSExceptionTest

- (void) unittest:(id)assert_equal {

  @try {
    [@"test" characterAtIndex:10];
  } @catch (NSException *exception) {
    [assert_equal _true:
      [[exception reason] hasSuffix:@"Range or index out of bounds"]];
  }

}

@end
