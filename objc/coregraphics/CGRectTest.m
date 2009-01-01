// CGRectTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CGRectTest

- (void) unittest {

  CGRect rect = CGRectMake(0, 0, 5, 5);
  [assert_equal _true:CGRectContainsPoint(rect, CGPointMake(1, 1))];
  [assert_equal _true:CGRectContainsRect(rect, CGRectMake(1, 1, 1, 1))];
  [assert_equal _false:CGRectContainsRect(rect, CGRectMake(4, 4, 2, 2))];
  [assert_equal _true:CGRectIntersectsRect(rect, CGRectMake(4, 4, 2, 2))];
  [assert_equal CGRect:CGRectMake(4, 4, 1, 1) CGRect:
    CGRectIntersection(rect, CGRectMake(4, 4, 2, 2))];
}

@end
