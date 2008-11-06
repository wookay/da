// VectTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation VectTest

- (void) unittest {

  [assert_equal a:@"( 0.000,  0.000)" cpVect:cpvzero];
  [assert_equal a:@"( 0.000,  0.000)" cpVect:cpv(0, 0)];

  cpVect v1 = cpv(1, 2);
  cpVect v2 = cpv(5, 7);
  [assert_equal cpVect:cpv(6, 9) cpVect:cpvadd(v1, v2)];
  [assert_equal cpVect:cpv(-1, -2) cpVect:cpvneg(v1)];
  [assert_equal cpVect:cpv(4, 5) cpVect:cpvsub(v2, v1)];
  [assert_equal cpVect:cpv(2, 4) cpVect:cpvmult(v1, 2)];
  [assert_equal float:19 float:cpvdot(v1, v2)];
  [assert_equal float:-3 float:cpvcross(v1, v2)];
  [assert_equal cpVect:cpv(-2, 1) cpVect:cpvperp(v1)];
  [assert_equal cpVect:cpv(2, -1) cpVect:cpvrperp(v1)];
  [assert_equal cpVect:cpv(1.284, 1.797) cpVect:cpvproject(v1, v2)];
  // cpvrotate = cpv(v1.x*v2.x - v1.y*v2.y, v1.x*v2.y + v1.y*v2.x)
  [assert_equal cpVect:cpv(-9, 17) cpVect:cpvrotate(v1, v2)];
  // cpvunrotate = cpv(v1.x*v2.x + v1.y*v2.y, v1.y*v2.x - v1.x*v2.y)
  [assert_equal cpVect:cpv(19, 3) cpVect:cpvunrotate(v1, v2)];

  [assert_equal float:sqrt(5) float:cpvlength(v1)];
  [assert_equal float:5 float:cpvlengthsq(v1)];
  [assert_equal cpVect:cpv(0.447,  0.894) cpVect:cpvnormalize(v1)];
  [assert_equal cpVect:cpv(cos(1), sin(1)) cpVect:cpvforangle(1)];
  [assert_equal float:atan2(2, 1) float:cpvtoangle(v1)];

}

@end
