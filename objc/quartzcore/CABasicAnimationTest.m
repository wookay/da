// CABasicAnimationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CABasicAnimationTest

- (void) unittest {

  #if TARGET_CPU_X86
  CABasicAnimation* ba = [CABasicAnimation animation];
  [assert_equal bool:false bool:[ba isAdditive]];
  [assert_equal bool:false bool:[ba isCumulative]];
  [assert_equal bool:true bool:[ba isRemovedOnCompletion]];
  #endif

}

@end
