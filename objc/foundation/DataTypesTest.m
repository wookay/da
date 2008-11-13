// DataTypesTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation DataTypesTest

- (void) unittest {

  NSRange range = NSMakeRange(2, 5);
  [assert_equal a:@"{2, 5}" NSRange:range];
  [assert_equal int:7 int:NSMaxRange(range)];
  [assert_equal _false:NSLocationInRange(7, range)];
  [assert_equal a:@"{3, 4}"
                NSRange:NSIntersectionRange(range, NSMakeRange(3, 8))];
  [assert_equal a:@"{2, 9}"
                NSRange:NSUnionRange(range, NSMakeRange(3, 8))];

  CGPoint cgPoint = CGPointMake(1.1f, 2.1f);
  [assert_equal a:@"{1.1, 2.1}" CGPoint:cgPoint];
  CGSize cgSize = CGSizeMake(100.1f, 200.1f);
  [assert_equal a:@"{100.1, 200.1}" CGSize:cgSize];
  CGRect cgRect = CGRectMake(1.1f, 2.1f, 100.1f, 200.1f);
  [assert_equal a:@"{{1.1, 2.1}, {100.1, 200.1}}" CGRect:cgRect];
  [assert_equal float:1.1 float:cgRect.origin.x];
  [assert_equal float:2.1 float:cgRect.origin.y];
  [assert_equal float:100.1 float:cgRect.size.width];
  [assert_equal float:200.1 float:cgRect.size.height];

}

@end
