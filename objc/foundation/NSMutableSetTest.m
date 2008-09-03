// NSMutableSetTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableSetTest

- (void) unittest:(id)assert_equal {

  NSMutableSet* mutableSet = [[NSMutableSet alloc] init];
  [mutableSet addObject:@"a"];
  [mutableSet addObject:@"b"];
  [mutableSet addObject:@"a"];
  [assert_equal int:2 int:[mutableSet count]];
  [assert_equal a:nil b:[mutableSet member:@"c"]];
  [assert_equal bool:true bool:[mutableSet containsObject:@"a"]];

}

@end
