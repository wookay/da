// UIViewTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation UIViewTest

- (void) unittest {

  UIView* view = [UIView alloc];
  [assert_equal int:0 int:[[view subviews] count]];

}

@end
