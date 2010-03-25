// EnumerableTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "String.h"
#import "Array.h"
#import "Enumerable.h"

@implementation TestSuite (Enumerable)

- (void) test_Enumerable {

  NSArray* ary = [@"1 2 3 4 5" split];
  assert_equal(@"(1, 2, 3, 4, 5)", ary.inspect);

  int sum = [[ary reduce:@"+"] to_i];
  assert_equal(15, sum);

  int product = [[ary reduce:@"*"] to_i];
  assert_equal(120, product);

  int subtraction = [[ary reduce:@"-"] to_i];
  assert_equal(-13, subtraction);

  int divide = [[ary reduce:@"/"] to_i];
  assert_equal(0, divide);

  int modulo = [[ary reduce:@"%"] to_i];
  assert_equal(1, modulo);

  id range = [@"1..10" to_range];
  assert_equal(55, [[range sum] to_i]);

  range = [@"-3..3" to_range];
  assert_equal(@"(-3, -2, -1, 0, 1, 2, 3)", range);
  assert_equal(0, [[range sum] to_i]);
  assert_equal(-6, [[range reduce:@"-"] to_i]);

}

@end
