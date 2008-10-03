// CAKeyframeAnimationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CAKeyframeAnimationTest

- (void) unittest {

  #if TARGET_CPU_X86
  CAKeyframeAnimation* ka = [CAKeyframeAnimation animation];
  [assert_equal bool:false bool:[ka isAdditive]];
  [assert_equal bool:false bool:[ka isCumulative]];
  [assert_equal bool:true bool:[ka isRemovedOnCompletion]];
  [assert_equal _NULL:[ka timingFunctions]];
  [assert_equal _NULL:[ka rotationMode]];
  #endif

}

@end
