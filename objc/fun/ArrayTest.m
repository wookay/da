// ArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

NSInteger randomSort(id a, id b, void *context) {
  return (arc4random() % 2);
}

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
  [assert_equal a:@"(A, B, C)" b:[ary map:@selector(uppercaseString)]];
  [assert_equal a:@"(A, B, C)" b:[[ary map] uppercaseString]];
  [assert_equal a:@"()" b:[[[NSArray array] map] uppercaseString]];

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

  //[assert_equal a:@"abc" b:[[ary sortedArrayUsingFunction:randomSort context:NULL] to_s]];

  //[stack map:^(NSString* string) { return [string uppercaseString] }]; 

}

@end
