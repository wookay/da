// UnitTest.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

@implementation UnitTest

- (void) a:(id)expected b:(id)got {
  NSString* expectedClass = [expected className];
  NSString* expectedDescription =
    expected == nil ? @"nil" : [expected description];
  NSString* gotDescription =
    got == nil ? @"nil" : [got description];
  if ([expectedClass isEqualToString:@"NSCFString"]) {
    if ([expected isEqualToString:gotDescription]) {
      NSLog(@"passed: %@", expected);
    } else {
      NSLog(@"Assertion failed\nExpected: %@\nGot: %@",
        expected, got);
    }
  } else if ([expectedClass isEqualToString:@"NSCFArray"]) {
    if ([expected isEqualToArray:got]) {
      NSLog(@"passed: %@", expectedDescription);
    } else {
      NSLog(@"Assertion failed\nExpected: %@\nGot: %@",
        expectedDescription, gotDescription);
    }
  } else {
    if (expected == got) {
      NSLog(@"passed: %@", expectedDescription);
    } else {
      NSLog(@"Assertion failed\nExpected: %@\nGot: %@",
        expectedDescription, gotDescription);
    }
  }
}

- (void) bool:(BOOL)expected bool:(BOOL)got {
  NSString* expectedBool = expected ? @"true" : @"false";
  NSString* gotBool = got == true ? @"true" : @"false";
  if (expected == got) {
    NSLog(@"passed: %@", expectedBool);
  } else {
    NSLog(@"Assertion failed\nExpected: %@\nGot: %@", expectedBool, gotBool);
  }
}

- (void) int:(int)expected int:(int)got {
  if (expected == got) {
    NSLog(@"passed: %d", expected);
  } else {
    NSLog(@"Assertion failed\nExpected: %d\nGot: %d", expected, got);
  }
}

@end
