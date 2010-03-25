// NSArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSArray)

- (void) test_NSArray {

  NSArray* ary = [NSArray array];
  assert_equal(@"[]", [ary inspect]);

  ary = [NSArray arrayWithObjects: @"a", @"b", nil];
  assert_equal(@"[a, b]", [ary inspect]);
  assert_equal(@"a,b", [ary componentsJoinedByString:@","]);

  ary = [NSArray arrayWithObjects: @"a", [NSNumber numberWithInt:5], nil];
  assert_equal(@"[a, 5]", [ary inspect]);
  assert_equal(NUM(5), [ary objectAtIndex:1]);

  for(id a in ary) {
    assert_equal(true, [ary containsObject:a]);
  }

  assert_equal(@"[a]", [[ary subarrayWithRange:NSMakeRange(0, 1)] inspect]);
  assert_equal(@"[a, 5]", [[ary subarrayWithRange:NSMakeRange(0, 2)] inspect]);

}

@end
