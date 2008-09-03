// UnitTest.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

@implementation UnitTest

- (void) a:(id)expected b:(id)got {
  NSString* expectedClass = [expected className];
  NSString* gotClass = [got className];
  NSString* expectedDescription =
    expected == nil ? @"nil" : [expected description];
  NSString* gotDescription =
    got == nil ? @"nil" : [got description];
  if ([expectedClass isEqualToString:@"NSCFString"]) {
    if ([gotClass isEqualToString:@"NSCFArray"]) {
      gotDescription = [NSString stringWithFormat:@"(%@)",
        [got componentsJoinedByString:@", "]];
    } else if ([gotClass isEqualToString:@"NSCFDictionary"]) { 
      NSMutableArray* ary = [NSMutableArray array];
      for (id key in got) {
        [ary insertObject:
          [NSString stringWithFormat:@"%@ = %@; ", key, [got objectForKey:key]]
          atIndex: 0
        ];
      }
      gotDescription = [NSString stringWithFormat:@"{%@}",
        [ary componentsJoinedByString:@""]];
    }
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
