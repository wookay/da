// EnumerableTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation EnumerableTest

- (void) unittest {

  NSArray* ary = [@"1 2 3 4 5" split];
  [assert_equal a:@"(1, 2, 3, 4, 5)" b:ary];

  int sum = [[ary reduce:@"+"] to_i];
  [assert_equal int:15 int:sum];

  int product = [[ary reduce:@"*"] to_i];
  [assert_equal int:120 int:product];

  int subtraction = [[ary reduce:@"-"] to_i];
  [assert_equal int:-13 int:subtraction];

  int divide = [[ary reduce:@"/"] to_i];
  [assert_equal int:0 int:divide];

  int modulo = [[ary reduce:@"%"] to_i];
  [assert_equal int:1 int:modulo];

  id range = [@"1..10" to_range];
  [assert_equal int:55 int:[[range sum] to_i]];

}

@end
