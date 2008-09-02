// NSNumberTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSNumberTest

- (void) unittest:(id)assert_equal {

  NSNumber* number = [[NSNumber alloc]initWithInt:100];
  [assert_equal int:100 int:[number intValue]];
  [assert_equal bool:true bool:[number boolValue]];
  [assert_equal a:@"100" b:[number stringValue]];

}

@end
