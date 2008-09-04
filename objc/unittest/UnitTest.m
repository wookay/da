// UnitTest.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

@implementation UnitTest

- (id)init {
  passed = [NSMutableArray array];
  failed = [NSMutableArray array];
  return self;
}

- (void) report {
  if ([passed count] == 0) {
  } else if ([passed count] == 1) {
    NSLog(@"OK, passed 1 test.");
  } else {
    NSLog(@"OK, passed %d tests.", [passed count]);
  }
  if ([failed count] == 0) {
  } else if ([failed count] == 1) {
    NSLog(@"Oops, failed 1 test.");
  } else {
    NSLog(@"Oops, failed %d tests.", [failed count]);
  }
}

- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got {
  if (cond) {
    [passed addObject:[NSNumber numberWithBool:true]];
    NSLog(@"passed: %@", expected);
  } else {
    [failed addObject:[NSNumber numberWithBool:false]];
    NSLog(@"Assertion failed\nExpected: %@\nGot: %@", expected, got);
  }
  // NSAssert(cond, got);
}

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
    [self add_result:[expected isEqualToString:gotDescription]
          expected:expected
          got:got];
  } else if ([expectedClass isEqualToString:@"NSCFArray"]) {
    [self add_result:[expected isEqualToArray:got]
          expected:expectedDescription
          got:gotDescription];
  } else {
    [self add_result:(expected == got)
          expected:expectedDescription
          got:gotDescription];
  }
}

- (void) bool:(BOOL)expected bool:(BOOL)got {
  NSString* expectedBool = expected ? @"true" : @"false";
  NSString* gotBool = got == true ? @"true" : @"false";
  [self add_result:(expected == got)
        expected:expectedBool
        got:gotBool];
}

- (void) _true:(BOOL)got {
  [self bool:true bool:got];
}

- (void) _false:(BOOL)got {
  [self bool:false bool:got];
}

- (void) int:(int)expected int:(int)got {
  NSString* expectedString = [NSString stringWithFormat:@"%d", expected, nil];
  NSString* gotString = [NSString stringWithFormat:@"%d", got, nil];
  [self add_result:(expected == got)
        expected:expectedString
        got:gotString];
}

- (void) int:(int)expected b:(id)got {
  [self int:expected int:[got intValue]];
}

- (void) float:(float)expected float:(float)got {
  [self float:expected b:[NSNumber numberWithFloat:got]];
}

- (void) float:(float)expected b:(id)got {
  NSNumber* expectedNumber = [NSNumber numberWithFloat:expected];
  NSString* expectedString = [NSString stringWithFormat:@"%@f", expectedNumber, nil];
  NSString* gotString = [NSString stringWithFormat:@"%@f", got, nil];
  [self add_result:[expectedNumber isEqualToNumber:got]
        expected:expectedString
        got:gotString];
}

@end
