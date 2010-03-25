// NSRangeTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import <QuartzCore/CATransform3D.h>

#define F(v) [NSNumber numberWithFloat:(v)]
NSString* NSStringFromCGPoint(CGPoint point) {
  return SWF(@"{%@, %@}", F(point.x), F(point.y));
}
NSString* NSStringFromCGSize(CGSize size) {
  return SWF(@"{%@, %@}", F(size.width), F(size.height));
}
NSString* NSStringFromCGRect(CGRect rect) {
  return SWF(@"{%@, %@}", NSStringFromCGPoint(rect.origin),
                          NSStringFromCGSize(rect.size));
}

@implementation TestSuite (NSRange)

- (void) test_NSRange {

  NSRange range = NSMakeRange(2, 5);
  assert_equal(@"{2, 5}", NSStringFromRange(range));
  assert_equal(7, NSMaxRange(range));
  assert_equal(false, NSLocationInRange(7, range));
  assert_equal(@"{3, 4}", NSStringFromRange(NSIntersectionRange(range, NSMakeRange(3, 8))));
  assert_equal(@"{2, 9}", NSStringFromRange(NSUnionRange(range, NSMakeRange(3, 8))));

  CGPoint cgPoint = CGPointMake(1.1f, 2.1f);
  assert_equal(@"{1.1, 2.1}", NSStringFromCGPoint(cgPoint));
  CGSize cgSize = CGSizeMake(100.1f, 200.1f);
  assert_equal(@"{100.1, 200.1}", NSStringFromCGSize(cgSize));
  CGRect cgRect = CGRectMake(1.1f, 2.1f, 100.1f, 200.1f);
  assert_equal(@"{{1.1, 2.1}, {100.1, 200.1}}", NSStringFromCGRect(cgRect));
  assert_equal((float)1.1, cgRect.origin.x);
  assert_equal((float)2.1, cgRect.origin.y);
  assert_equal((float)100.1, cgRect.size.width);
  assert_equal((float)200.1, cgRect.size.height);

}

@end
