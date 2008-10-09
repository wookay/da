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

  NSArray* empty = [NSArray array];
  [assert_equal a:@"()" b:empty];
  [assert_equal a:@"" b:[empty to_s]];
  [assert_equal _true:[empty empty:'?']];

  NSMutableArray* stack = [NSMutableArray array];
  [assert_equal a:@"(a)" b:[stack push:@"a"]];
  [assert_equal a:@"(a)" b:stack];
  [assert_equal _false:[stack empty:'?']];
  [assert_equal a:@"a" b:[stack pop]];
  [assert_equal a:@"()" b:stack];
  [assert_equal _true:[stack empty:'?']];

}

@end
