// NSStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSStringTest

- (void) unittest {

  NSString* str = [NSString stringWithFormat:@"%d", 200];
  [assert_equal a:@"200" b:str];
  [assert_equal int:200 int:[str intValue]];

}

@end
