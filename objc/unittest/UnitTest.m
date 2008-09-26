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
      NSMutableArray* ary = [NSMutableArray array];
      for (id obj in got) {
        if ([obj respondsToSelector:@selector(isEqualToArray:)]) {
          [ary addObject:[NSString stringWithFormat:@"(%@)",
                                     [obj componentsJoinedByString:@", "]]];
        } else {
          [ary addObject:obj];
        }
      }
      gotDescription = [NSString stringWithFormat:@"(%@)",
                                   [ary componentsJoinedByString:@", "]];
    } else if ([got respondsToSelector:@selector(isEqualToDictionary:)]) {
      NSMutableArray* ary = [NSMutableArray array];
      for (id key in got) {
        [ary addObject:
          [NSString stringWithFormat:@"%@ = %@; ", key, [got objectForKey:key]]
        ];
      }
      gotDescription = [NSString stringWithFormat:@"{%@}",
        [ary componentsJoinedByString:@""]];
    }
    [self add_result:[expected isEqualToString:gotDescription]
          expected:expected
          got:got];
  } else if ([expected respondsToSelector:@selector(isEqualToArray:)]) {
    if ([expected isEqualToArray:got]) {
      [self add_result:true expected:expectedDescription got:gotDescription];
    } else {
      [self add_result:[expectedDescription isEqualToString:gotDescription]
            expected:expectedDescription
            got:gotDescription];
    }
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

- (void) a:(id)expected CGContextRef:(CGContextRef)got {
  [self a:expected b:(id)got];
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
  passedCount = 0;
  failedCount = 0;
  builder = nil;
  currentTargetClass = @"nil";
  return self;
}

- (int) passedCount {
  return passedCount;
}

- (int) failedCount {
  return failedCount;
}

- (void) report {
  if (passedCount == 0) {
  } else if (passedCount == 1) {
    [self puts:@"OK, passed 1 test."];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"OK, passed %d tests.", passedCount];
    [self puts:message];
  }
  if (failedCount == 0) {
  } else if (failedCount == 1) {
    [self puts:@"Oops, failed 1 test."];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"Oops, failed %d tests.", failedCount];
    [self puts:message];
  }
}

- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got {
  if (cond) {
    passedCount += 1;
    NSProcessInfo* info = [NSProcessInfo processInfo];
    if (! [[info environment] valueForKey:@"PASSED"]) {
      [self passed:expected got:got];
    }
  } else {
    failedCount += 1;
    [self failed:expected got:got];
  }
  // NSAssert(cond, got);
}

- (void) passed:(id)expected got:(id)got {
  if ([self builder]) {
    [self buildup:true expected:expected got:got];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"  passed: %@", expected];
    [self puts:message];
  }
}

- (void) failed:(id)expected got:(id)got {
  if (builder) {
    [self buildup:false expected:expected got:got];
  } else {
    NSString* message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %@\nGot: %@", expected, got];
    [self puts:message];
  }
}

- (void) buildup:(bool)success expected:(id)expected got:(id)got {
  id obj = [NSArray arrayWithObjects:[NSNumber numberWithBool:success],
                                     expected, got, nil];
  [builder addObject:[NSArray arrayWithObjects:obj, currentTargetClass, nil]];
}

- (void) puts:(id)message {
  printf("%s\n", [message UTF8String]);
}

- (void) run:(id)targetClassString {
  [self setValue:targetClassString forKey:@"currentTargetClass"];
  Class target = NSClassFromString(targetClassString);
  NSProcessInfo* info = [NSProcessInfo processInfo];
  if (! [[info environment] valueForKey:@"PASSED"]) {
    printf("%s\n", [targetClassString UTF8String]);
  }
  [[target create:self] unittest];
}

+ (id) create {
  return [[self alloc] init];
}

+ (id) createBuilder {
  id unit = [self alloc];
  [unit setValue:[NSMutableArray array] forKey:@"builder"];
  return unit;
}

- (NSArray*) builder {
  return builder;
}

@end



@implementation UnitTestable
+ (id) create:(id)obj {
  id unit = [self alloc];
  [unit setValue:obj forKey:@"assert_equal"];
  return unit;
}

- (void) unittest {
}
@end
