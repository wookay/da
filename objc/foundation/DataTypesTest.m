// DataTypesTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation DataTypesTest

- (void) unittest:(id)assert_equal {

  NSPoint point = NSMakePoint(1, 2);
  NSSize size = NSMakeSize(100, 200);
  NSRect rect = NSMakeRect(1, 2, 100, 200);
  NSRange range = NSMakeRange(1, 5);

  [assert_equal a:@"{1, 2}" NSPoint:point];
  [assert_equal a:@"{100, 200}" NSSize:size];
  [assert_equal a:@"{{1, 2}, {100, 200}}" NSRect:rect];
  [assert_equal a:@"{1, 5}" NSRange:range];

  // BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint);
  // BOOL NSEqualSizes(NSSize aSize, NSSize bSize);
  // BOOL NSEqualRects(NSRect aRect, NSRect bRect);
  // BOOL NSIsEmptyRect(NSRect aRect);
  // NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY);
  // NSRect NSIntegralRect(NSRect aRect);
  // NSRect NSUnionRect(NSRect aRect, NSRect bRect);
  // NSRect NSIntersectionRect(NSRect aRect, NSRect bRect);
  // NSRect NSOffsetRect(NSRect aRect, CGFloat dX, CGFloat dY);
  // BOOL NSPointInRect(NSPoint aPoint, NSRect aRect);
  // BOOL NSMouseInRect(NSPoint aPoint, NSRect aRect, BOOL flipped);
  // BOOL NSContainsRect(NSRect aRect, NSRect bRect);
  // BOOL NSIntersectsRect(NSRect aRect, NSRect bRect);

}

@end
