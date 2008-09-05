// DataTypesTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation DataTypesTest

- (void) unittest:(id)assert_equal {

  NSPoint point = NSMakePoint(1, 2);
  [assert_equal a:@"{1, 2}" NSPoint:point];

  NSSize size = NSMakeSize(100, 200);
  [assert_equal a:@"{100, 200}" NSSize:size];

  NSRect rect = NSMakeRect(1, 2, 100, 200);
  [assert_equal a:@"{{1, 2}, {100, 200}}" NSRect:rect];
  [assert_equal float:100 float:NSWidth(rect)];
  [assert_equal float:200 float:NSHeight(rect)];
  [assert_equal float:1 float:NSMinX(rect)];
  [assert_equal float:2 float:NSMinY(rect)];
  [assert_equal float:51 float:NSMidX(rect)];
  [assert_equal float:102 float:NSMidY(rect)];
  [assert_equal float:101 float:NSMaxX(rect)];
  [assert_equal float:202 float:NSMaxY(rect)];
  [assert_equal a:@"{{3, 5}, {100, 200}}" NSRect:NSOffsetRect(rect, 2, 3)];
  [assert_equal a:@"{{3, 5}, {100, 200}}" NSRect:NSOffsetRect(rect, 2, 3)];
  [assert_equal _false:NSIsEmptyRect(rect)];
  [assert_equal _true:NSIsEmptyRect(NSMakeRect(1,1,0,1))];
  // NSContainsRect  
  // NSDivideRect  
  // NSInsetRect  
  // NSIntegralRect  
  // NSIntersectionRect  
  // NSIntersectsRect  
  // NSMouseInRect  
  // NSPointInRect  
  // NSUnionRect  

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

}

@end
