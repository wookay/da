// NSMutableArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSMutableArray)

- (void) test_NSMutableArray {

  NSMutableArray* ary = [NSMutableArray array];
  assert_equal(@"[]", [ary inspect]);

  [ary addObject:@"a"];
  assert_equal(@"[a]", [ary inspect]);
  
}

@end
