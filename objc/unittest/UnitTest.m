// UnitTest.m
//                           wookay.noh at gmail.com
#import "UnitTest.h"

@implementation UnitTest

- (void) a:(id)expected b:(id)got {
  NSString* expectedDescription =
    expected == nil ? @"nil" : [expected description];
  NSString* gotDescription =
    got == nil ? @"nil" : [got description];
  if ([expected respondsToSelector:@selector(isEqualToString:)]) {
    if ([got respondsToSelector:@selector(isEqualToArray:)]) {
      gotDescription = [NSString stringWithFormat:@"(%@)",
        [got componentsJoinedByString:@", "]];
    } else if ([got respondsToSelector:@selector(isEqualToDictionary:)]) {
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
  } else if ([expected respondsToSelector:@selector(isEqualToArray:)]) {
    [self add_result:[expected isEqualToArray:got]
          expected:expectedDescription
          got:gotDescription];
  } else {
    if (expected == got) {
      [self add_result:true
            expected:expectedDescription
            got:gotDescription];
    } else {
      [self add_result:[expectedDescription isEqualToString:gotDescription]
            expected:expectedDescription
            got:gotDescription];
    }
  }
}

- (void) a:(id)expected SEL:(SEL)got {
  [self a:expected b:NSStringFromSelector(got)];
}

- (void) a:(id)expected Class:(Class)got {
  [self a:expected b:NSStringFromClass(got)];
}

- (void) a:(id)expected NSRange:(NSRange)got {
  [self add_result:NSEqualRanges(NSRangeFromString(expected), got)
     expected:expected got:NSStringFromRange(got)];
}

#define F(v) [NSNumber numberWithFloat:(v)]

- (void) a:(id)expected CGPoint:(CGPoint)got {
  NSString* gotString = [NSString stringWithFormat:@"{%@, %@}",
    F(got.x), F(got.y)];
  [self a:expected b:gotString];
}

- (void) a:(id)expected CGSize:(CGSize)got {
  NSString* gotString = [NSString stringWithFormat:@"{%@, %@}",
    F(got.width), F(got.height)];
  [self a:expected b:gotString];
}

- (void) a:(id)expected CGRect:(CGRect)got {
  NSString* gotString = [NSString stringWithFormat:@"{{%@, %@}, {%@, %@}}",
    F(got.origin.x), F(got.origin.y), F(got.size.width), F(got.size.height)];
  [self a:expected b:gotString];
}

- (void) a:(id)expected CGAffineTransform:(CGAffineTransform)got {
  NSString* gotString = [NSString stringWithFormat:@"{%@, %@, %@, %@, %@, %@}",
    F(got.a), F(got.b), F(got.c), F(got.d), F(got.tx), F(got.ty)];
  [self a:expected b:gotString];
}

- (void) a:(id)expected CATransform3D:(CATransform3D)got {
  NSString* gotString = [NSString stringWithFormat:
    @"{%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@}",
    F(got.m11), F(got.m12), F(got.m13), F(got.m14),
    F(got.m21), F(got.m22), F(got.m23), F(got.m24),
    F(got.m31), F(got.m32), F(got.m33), F(got.m34),
    F(got.m41), F(got.m42), F(got.m43), F(got.m44)];
  [self a:expected b:gotString];
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

- (void) _nil:(id)got {
  [self a:nil b:got];
}

- (void) int:(int)expected int:(int)got {
  NSString* expectedString = [NSString stringWithFormat:@"%d", expected];
  NSString* gotString = [NSString stringWithFormat:@"%d", got];
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
  NSString* expectedString = [NSString stringWithFormat:@"%@f", expectedNumber];
  NSString* gotString = [NSString stringWithFormat:@"%@f", got];
  [self a:expectedString b:gotString];
}

- (id)init {
  passed = [NSMutableArray array];
  failed = [NSMutableArray array];
  return self;
}

- (void) report {
  if ([passed count] == 0) {
  } else if ([passed count] == 1) {
    [self puts:@"OK, passed 1 test."];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"OK, passed %d tests.", [passed count]];
    [self puts:message];
  }
  if ([failed count] == 0) {
  } else if ([failed count] == 1) {
    [self puts:@"Oops, failed 1 test."];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"Oops, failed %d tests.", [failed count]];
    [self puts:message];
  }
}

- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got {
  if (cond) {
    [passed addObject:[NSNumber numberWithBool:true]];
    NSProcessInfo* info = [NSProcessInfo processInfo];
    if (! [[info environment] valueForKey:@"PASSED"]) {
      NSString* message = [NSString stringWithFormat:
        @"  passed: %@", expected];
      [self puts:message];
    }
  } else {
    [failed addObject:[NSNumber numberWithBool:false]];
    NSString* message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %@\nGot: %@", expected, got];
    [self puts:message];
  }
  // NSAssert(cond, got);
}

- (void) puts:(id)message {
  printf("%s\n", [message UTF8String]);
}

- (void) run:(id)targetClass {
  Class class = NSClassFromString(targetClass);
  NSProcessInfo* info = [NSProcessInfo processInfo];
  if (! [[info environment] valueForKey:@"PASSED"]) {
    [self puts:targetClass];
  }
  [[class alloc] unittest:self];
}

@end



@implementation UnitTestable
- (void) unittest:(id)assert_equal {
}
@end
