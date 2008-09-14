// NSStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSStringTest

- (void) unittest {

  NSString* str = [NSString stringWithFormat:@"%d", 200];
  [assert_equal a:@"200" b:str];
  [assert_equal int:200 int:[str intValue]];
  
  NSArray* ary = [@"1 2 3" componentsSeparatedByString:@" "];
  [assert_equal a:@"(1, 2, 3)" b:ary];

  [assert_equal a:@"1 2.100000" b:[@"1" stringByAppendingFormat:@" %f", 2.1f]];

}

@end
