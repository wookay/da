// UIColorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIColorTest

- (void) unittest {

  UIColor* red = [UIColor redColor];
  [assert_equal a:"red" b:red];

}

@end
