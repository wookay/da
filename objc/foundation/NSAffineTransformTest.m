// NSAffineTransformTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSAffineTransformTest

- (void) unittest:(id)assert_equal {

  NSAffineTransform* aff = [NSAffineTransform transform];
  [assert_equal a:@"{1, 0, 0, 1, 0, 0}"
                NSAffineTransformStruct:[aff transformStruct]];
  [aff translateXBy:0.11f yBy:0.21f];
  [assert_equal a:@"{1, 0, 0, 1, 0.11, 0.21}"
                NSAffineTransformStruct:[aff transformStruct]];

}

@end
