// CALayerTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CALayerTest

- (void) unittest {

  #if TARGET_CPU_X86
  CALayer* myLayer = [CALayer layer];
  myLayer.bounds = CGRectMake(0,0,150,150);
  myLayer.position = CGPointMake(20,20);
  [assert_equal a:@"{150, 150}" CGSize:[myLayer preferredFrameSize]];
  [assert_equal a:@"{20, 20}" CGPoint:[myLayer position]];
  #endif

}

@end
