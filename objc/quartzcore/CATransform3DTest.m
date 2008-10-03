// CATransform3DTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CATransform3DTest

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;};

- (void) unittest {

  CATransform3D t = CATransform3DMakeTranslation(2.0f, 3.0f, 4.0f);
  [assert_equal a:@"{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 2, 3, 4, 1}"
                CATransform3D:t];

  CGPoint center = CGPointMake(100, 100);
  float theta = 5.0f;
  t = CATransform3DTranslate(t, center.x, center.y, 0.0);
  [assert_equal a:@"{1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 102, 103, 4, 1}"
                CATransform3D:t];
  t = CATransform3DRotate(t, DegreesToRadians(theta), 1, 0, 0);
  [assert_equal a:@"{1, 0, 0, 0, 0, 0.9961947, 0.08715574, 0, 0, -0.08715574, 0.9961947, 0, 102, 103, 4, 1}"
                CATransform3D:t];
  t = CATransform3DTranslate(t, -center.x, -center.y, 0.0);
  [assert_equal a:@"{1, 0, 0, 0, 0, 0.9961947, 0.08715574, 0, 0, -0.08715574, 0.9961947, 0, 2, 3.380528, -4.715574, 1}"
                CATransform3D:t];

  t = CATransform3DMakeScale(2.0f, 3.0f, 4.0f);
  [assert_equal a:@"{2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1}"
                CATransform3D:t];

  CGAffineTransform aff = CATransform3DGetAffineTransform(t);
  [assert_equal a:@"{2, 0, 0, 3, 0, 0}"
                CGAffineTransform:aff];

  t = CATransform3DMakeRotation(DegreesToRadians(theta), 1, 1, 0);
  [assert_equal a:@"{0.9980974, 0.001902651, -0.06162841, 0, 0.001902651, 0.9980974, 0.06162841, 0, 0.06162841, -0.06162841, 0.9961947, 0, 0, 0, 0, 1}"
                CATransform3D:t];

}

@end
