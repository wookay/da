// NSMutableSetTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSMutableSet)

- (void) test_NSMutableSet {

  NSMutableSet* set = [NSMutableSet set];
  [set addObject:@"a"];
  [set addObject:@"b"];
  [set addObject:@"a"];
  assert_equal(2, [set count]);
  assert_equal(nil, [set member:@"c"]);
  assert_equal(true, [set containsObject:@"a"]);

  for(id obj in set) {
    assert_equal(true, [set containsObject:obj]);
  }

}

@end
