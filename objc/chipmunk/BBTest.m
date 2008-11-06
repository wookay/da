// BBTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation BBTest

- (void) unittest {

  cpBB boundingBox = cpBBNew(1, 2, 5, 6); // l b r t
  [assert_equal a:@"1, 2, 5, 6" cpBB:boundingBox];

}

@end
