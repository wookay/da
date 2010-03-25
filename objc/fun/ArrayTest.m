// ArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "Array.h"

NSInteger randomSort(id a, id b, void *context) {
  return (arc4random() % 2);
}

@implementation TestSuite (Array)

- (void) test_Array {

  NSArray* ary = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
  assert_equal(@"abc", [ary to_s]);
  assert_equal(@"abc", [ary join]);
  assert_equal(@"a, b, c", [ary join:@", "]);
  assert_equal(@"a", [ary first]);
  assert_equal(@"c", [ary last]);
  //assert_equal(@"(c, b, a)", [[ary reverse] inspect]);
  assert_equal(3, [ary size]);
  //assert_equal(@"(A, B, C)", [ary map:@selector(uppercaseString)]);
  //assert_equal(@"(A, B, C)", [[ary map] uppercaseString]);
  //assert_equal(@"()", [[[NSArray array] map] uppercaseString]);

  NSArray* empty = [NSArray array];
  //assert_equal(@"()", empty);
  assert_equal(@"", [empty to_s]);
  //assert_equal(true, [empty empty:'?']);

  NSMutableArray* stack = [NSMutableArray array];
  //assert_equal(@"(a)", [stack push:@"a"]);
  //assert_equal(@"(a)", stack);
  //assert_equal(false, [stack empty:'?']);
  //assert_equal(@"a", [stack pop]);
  //assert_equal(@"()", stack);
  //assert_equal(true, [stack empty:'?']);

}

@end
