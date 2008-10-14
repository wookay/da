// UIColorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIColorTest

- (void) unittest {

  UIColor* red = [UIColor redColor];
  [assert_equal a:@"UIDeviceRGBColorSpace 1 0 0 1" b:red];
  
  UIColor* blue = [UIColor blueColor];
  [assert_equal a:@"UIDeviceRGBColorSpace 0 0 1 1" b:blue];
}

@end
