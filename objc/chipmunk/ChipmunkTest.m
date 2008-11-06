// ChipmunkTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation ChipmunkTest

- (void) unittest {

  float m = 2.0;
  float r1 = 1;
  float r2 = 2;
  cpVect offset = cpvzero;
  float momentForCircle = cpMomentForCircle(m, r1, r2, offset);
  [assert_equal float:5 float:momentForCircle];

  float width = 20/6;
  float height = 20/6;
  int numVerts = 4;
  cpVect verts[] = {
    cpv(-width/2, -height/2),
    cpv(-width/2,  height/2),
    cpv( width/2,  height/2),
    cpv( width/2, -height/2)
  };
  float momentForPoly = cpMomentForPoly(m, numVerts, verts, offset);
  [assert_equal float:3 float:momentForPoly];

}

@end
