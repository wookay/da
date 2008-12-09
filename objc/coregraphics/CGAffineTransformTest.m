// CGAffineTransformTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CGAffineTransformTest

- (void) unittest {

  CGAffineTransform t = CGAffineTransformMakeScale(2, 2);
  [assert_equal float:2 float:t.a];

}

@end
