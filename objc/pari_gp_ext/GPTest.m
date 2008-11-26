// GPTest.m
//                           wookay.noh at gmail.com

#import "GP.h"

@interface String : NSObject
@end
@implementation String
+ (void) assert:(id)expected equals:(id)got {
  NSString* message;
  if ([expected isEqualTo:got]) {
    message = [NSString stringWithFormat:@"passed: %@", expected];
  } else {
    message = [NSString stringWithFormat:
      @"Assertion failed\nExpected: %@\nGot: %@", expected, got];
  }
  printf("%s\n", [message UTF8String]);
}   
@end

int main (int argc, const char * argv[]) {
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  GP* gp = [[GP alloc] init];
  [String assert:@"3" equals:[gp eval:@"1+2"]               ];
  [String assert:@"x" equals:[gp polinterpolate:@"[1,2,3]"] ];

  [pool release];
  return 0;
}
