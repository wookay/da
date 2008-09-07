// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSArrayTest

- (void) unittest:(id)assert_equal {

  NSArray* ary = [NSArray array];
  [assert_equal a:@"()" b:ary];

  ary = [NSArray arrayWithObjects: @"a", @"b", nil];
  [assert_equal a:@"(a, b)" b:ary];
  [assert_equal a:@"a,b" b:[ary componentsJoinedByString:@","]];

  ary = [NSArray arrayWithObjects: @"a", [NSNumber numberWithInt:5], nil];
  [assert_equal a:@"(a, 5)" b:ary];
  NSPredicate* predicate = [NSPredicate predicateWithFormat:@"intValue == 5"];
  [assert_equal a:@"(5)" b:[ary filteredArrayUsingPredicate:predicate]];

  for(id a in ary) {
    [assert_equal _true:[ary containsObject:a]];
  }

}

@end
