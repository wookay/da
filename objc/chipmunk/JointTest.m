// JointTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation JointTest

- (void) unittest {

  cpBody* a = cpBodyNew(1, 2);
  cpBody* b = cpBodyNew(5, 6);

  cpVect anchr1 = cpv(1, 2);
  cpVect anchr2 = cpv(5, 6);
  cpJoint* pinJoint = cpPinJointNew(a, b, anchr1, anchr2);
  [assert_equal float:a->m float:pinJoint->a->m];
  cpJointFree(pinJoint);

  cpVect pivot = cpv(7, 8);
  cpJoint* pivotJoint = cpPivotJointNew(a, b, pivot);
  [assert_equal float:a->m float:pivotJoint->a->m];
  cpJointFree(pivotJoint);
  
  cpVect groove_a = cpv(1, 2);
  cpVect groove_b = cpv(3, 4);
  cpJoint* grooveJoint = cpGrooveJointNew(a, b, groove_a, groove_b, anchr2);
  [assert_equal float:a->m float:grooveJoint->a->m];
  cpJointFree(grooveJoint);

  cpBodyFree(a);
  cpBodyFree(b);

}

@end
