// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSArrayTest

- (void) unittest {

  NSArray* ary = [NSArray array];
  [assert_equal a:@"()" b:ary];

  ary = [NSArray arrayWithObjects: @"a", @"b", nil];
  [assert_equal a:@"(a, b)" b:ary];
  [assert_equal a:@"a,b" b:[ary componentsJoinedByString:@","]];

  ary = [NSArray arrayWithObjects: @"a", [NSNumber numberWithInt:5], nil];
  [assert_equal a:@"(a, 5)" b:ary];
  [assert_equal a:@"5" b:[ary objectAtIndex:1]];

  for(id a in ary) {
    [assert_equal _true:[ary containsObject:a]];
  }

  [assert_equal a:@"(a)" b:[ary subarrayWithRange:NSMakeRange(0, 1)]];
  [assert_equal a:@"(a, 5)" b:[ary subarrayWithRange:NSMakeRange(0, 2)]];

}

@end
