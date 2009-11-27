// test.m
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface Number : NSObject
@end
@implementation Number
+ (void) assert:(int)expected equals:(int)got {
  NSString* message;
  if (expected==got) {
    message = [NSString stringWithFormat:@"passed: %d", expected];
  } else {
    message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %d\nGot: %d", expected, got];
  }
  printf("%s\n", [message UTF8String]);
}
@end

@interface String : NSObject
@end
@implementation String
+ (void) assert:(id)expected equals:(id)got {
  NSString* message;
  if ([expected isEqualToString:got]) {
    message = [NSString stringWithFormat:@"passed: %@", expected];
  } else {
    message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %@\nGot: %@", expected, got];
  }
  printf("%s\n", [message UTF8String]);
}
@end

@interface Bool : NSObject
@end
@implementation Bool
+ (void) assert:(bool)expected equals:(bool)got {
  NSString* expectedString = expected ? @"true" : @"false";
  NSString* gotString = got ? @"true" : @"false";
  NSString* message;
  if (expected==got) {
    message = [NSString stringWithFormat:@"passed: %@", expectedString];
  } else {
    message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %@\nGot: %@", expectedString, gotString];
  }
  printf("%s\n", [message UTF8String]);
}
@end

int main (int argc, const char * argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  [Number assert:1    equals:1              ];
  [Number assert:3    equals:1+2            ];
  [String assert:@"a" equals:@"a"           ];
  [Bool   assert:true equals:1==1           ];
  [Number assert:1    equals:1./3+1./3+1./3 ];

  [pool release];
  return 0;
}
