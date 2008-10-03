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

  double d = 10.1;
  [assert_equal a:@"10.100000" b:[NSString stringWithFormat:@"%f", d]];
  [assert_equal a:@"1.010000e+01" b:[NSString stringWithFormat:@"%e", d]];
  [assert_equal a:@"1.010000E+01" b:[NSString stringWithFormat:@"%E", d]];
  [assert_equal a:@"10.1" b:[NSString stringWithFormat:@"%g", d]];
  [assert_equal a:@"10.1" b:[NSString stringWithFormat:@"%G", d]];

  NSMutableAttributedString* mas = [[NSMutableAttributedString alloc] initWithString:@"test"];
  [assert_equal a:@"test{\n}" b:mas];

}

@end
