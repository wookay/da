// RotationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation RotationTest

- (void) unittest {
  int width = 100;
  int height = 100;
  CGFloat platterRadius = 600.0f; 
  CGFloat platterXCenter = (width * 3.0f/4.0f) - platterRadius;
  CGFloat platterYCenter = height / 2.0f; 
  CATransform3D platterCenterTranslate = 
    CATransform3DMakeTranslation(platterXCenter, platterYCenter, 0.0f); 
  CATransform3D platterRadiusTranslate = CATransform3DMakeTranslation(platterRadius,0.0f,0.0f);
  CGFloat xRotationAngle = 2.5f * M_PI/180.0f; 
  CATransform3D xRotation = CATransform3DMakeRotation(xRotationAngle, 1.0f, 0.0f, 0.0f); 

  int selectedItemIndexInt = 0;
  int count = 6;
  NSInteger index = 0; 
  for (index = 0; index < count; index++) { 
    NSInteger offset = index - selectedItemIndexInt; 
    CGFloat angle = offset * 360.0f/7.0f * M_PI/180.f; 
    CATransform3D yRotation = CATransform3DMakeRotation(angle, 0.0f, 1.0f, 0.0f); 
    CATransform3D intermediate = 
      CATransform3DConcat(xRotation, platterCenterTranslate); 
      intermediate = CATransform3DConcat(yRotation, intermediate); 
      intermediate = CATransform3DConcat(platterRadiusTranslate, intermediate); 
  }
}

@end
