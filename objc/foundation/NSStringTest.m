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

  [assert_equal a:@"{6, 3}" NSRange:[@"hello apple" rangeOfString:@"app"]];
  [assert_equal a:@"{NSNotFound, 0}" NSRange:[@"hello apple" rangeOfString:@"mac"]];
  
  [assert_equal _true:[@"abc" isEqualToString:@"abc"]];
  [assert_equal _true:[@"abc" hasPrefix:@"ab"]];
  [assert_equal _true:[@"abc" hasSuffix:@"bc"]];

  [assert_equal a:@"0f" b:[NSString stringWithFormat:@"%02x", 15]];

  NSString* file = @"test.png";
  NSRange range = [file rangeOfString:@"." options:NSBackwardsSearch];
  if (range.location != NSNotFound) {
    [assert_equal a:@"test" b:[file substringToIndex:range.location]];
    range.location += 1;
    range.length = file.length - range.location;
    [assert_equal a:@"png" b:[file substringWithRange:range]];
  }

  [assert_equal int:1 int:[@"1/" intValue]];

}

@end
