// NSMutableArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableArrayTest

- (void) unittest {

  NSMutableArray* ary = [NSMutableArray array];
  [assert_equal a:@"()" b:ary];

  [ary addObject:@"a"];
  [assert_equal a:@"(a)" b:ary];
  
}

@end
