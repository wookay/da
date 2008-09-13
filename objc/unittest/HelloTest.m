// HelloTest.m
//                           wookay.noh at gmail.com

#import "HelloTest.h"

@implementation HelloTest

- (void) unittest {

  NSString* str = @"1 2 3";
  NSArray* ary = [str componentsSeparatedByString:@" "];
  [assert_equal a:@"(1, 2, 3)" b:ary];
  [assert_equal a:@"1,2,3" b:[ary componentsJoinedByString:@","]];
  [assert_equal int:6 int:1+2+3];

}

@end
