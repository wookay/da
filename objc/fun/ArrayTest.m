// ArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation ArrayTest

- (void) unittest {

  NSArray* ary = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
  [assert_equal a:@"abc" b:[ary to_s]];
  [assert_equal a:@"abc" b:[ary join]];
  [assert_equal a:@"a, b, c" b:[ary join:@", "]];
  [assert_equal a:@"a" b:[ary first]];
  [assert_equal a:@"c" b:[ary last]];
  [assert_equal a:@"(c, b, a)" b:[ary reverse]];
  [assert_equal int:3 int:[ary size]];
  [assert_equal int:3 int:[ary length]];

  NSArray* empty = [NSArray array];
  [assert_equal a:@"()" b:empty];
  [assert_equal a:@"" b:[empty to_s]];

}

@end
