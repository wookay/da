// NSStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSStringTest

- (void) unittest:(id)assert_equal {

  NSString* s = [NSString string];
  [assert_equal a:@"" b:s];

  s = [NSString stringWithFormat:@"%d", 200];
  [assert_equal a:@"200" b:s];
  [assert_equal int:200 int:[s intValue]];

}

@end
