// CGContextTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIGraphicsTest

- (void) unittest {

  CGContextRef context = UIGraphicsGetCurrentContext();
  [assert_equal int:0 int:(int)context];

}

@end
