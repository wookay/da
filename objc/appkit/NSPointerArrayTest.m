// NSPointerArrayTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSPointerArrayTest

- (void) unittest {

  NSPointerArray* ary = [NSPointerArray pointerArrayWithStrongObjects];
  [assert_equal int:0 int:[ary count]];
 
  [ary addPointer:NULL];
  [assert_equal int:1 int:[ary count]];

}

@end
