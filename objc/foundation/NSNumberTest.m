// NSNumberTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSNumberTest

- (void) unittest {

  NSNumber* number = [NSNumber numberWithInt:100];
  [assert_equal int:100 int:[number intValue]];
  [assert_equal int:100 b:number];
  [assert_equal bool:true bool:[number boolValue]];
  [assert_equal a:@"100" b:[number stringValue]];
  [assert_equal a:@"100" b:number];

  [assert_equal float:0.9f float:1.0f - 0.1f];
  [assert_equal float:1.2f b:[NSNumber numberWithFloat:1.2f]];

}

@end
