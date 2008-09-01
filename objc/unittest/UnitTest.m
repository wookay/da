// UnitTest.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

@implementation UnitTest

- (void) a:(id)expected b:(id)got {
  NSString* expectedClass = [expected className];
  NSString* gotClass = [got className];
  if ([expectedClass isEqualToString:@"NSCFString"]) {
    if ([gotClass isEqualToString:@"NSCFArray"]) {
      got = [got description];
    } 
    if ([expected isEqualToString:got]) {
      NSLog(@"true: %@", expected);
    } else {
      NSLog(@"Assertion failed\nExpected: %@\nGot: %@", expected, got);
    }
  } else if ([expectedClass isEqualToString:@"NSCFArray"]) {
    if ([expected isEqualToArray:got]) {
      NSLog(@"true: %@", [expected description]);
    } else {
      NSLog(@"Assertion failed\nExpected: %@\nGot: %@",
        [expected description], [got description]);
    }
  }
}

- (void) i:(int)expected j:(int)got {
  if (expected == got) {
    NSLog(@"true: %d", expected);
  } else {
    NSLog(@"Assertion failed\nExpected: %d\nGot: %d", expected, got);
  }
}

@end
