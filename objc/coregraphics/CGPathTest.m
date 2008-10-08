// CGPathTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CGPathTest

- (void) unittest {

  CGPathElement pathElement = { .type = kCGPathElementMoveToPoint };
  [assert_equal int:kCGPathElementMoveToPoint int:pathElement.type];

}

@end
