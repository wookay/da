// NSMutableSetTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableSetTest

- (void) unittest:(id)assert_equal {

  NSMutableSet* set = [NSMutableSet set];
  [set addObject:@"a"];
  [set addObject:@"b"];
  [set addObject:@"a"];
  [assert_equal int:2 int:[set count]];
  [assert_equal a:nil b:[set member:@"c"]];
  [assert_equal bool:true bool:[set containsObject:@"a"]];

}

@end
