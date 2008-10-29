// SpaceTest.m
//                           wookay.noh at gmail.com

#import "test.h"

int collisionPairFunc(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
  return 0;
}

@implementation SpaceTest

- (void) unittest {

  cpSpace* space = cpSpaceNew();

  [assert_equal float:10 float:space->iterations];
  [assert_equal float:0 float:space->elasticIterations];
  [assert_equal a:@"( 0.000,  0.000)" cpVect:space->gravity];
  [assert_equal float:1 float:space->damping];
  [assert_equal float:0 float:space->stamp];

  cpBody* body = cpBodyNew(INFINITY, INFINITY);
  cpSpaceAddBody(space, body);

  cpJoint* joint = cpPinJointNew(body, body, cpvzero, cpvzero);
  cpSpaceAddJoint(space, joint);
  [assert_equal a:@"(pin)" joints:space->joints];
  [assert_equal a:@"()" shapes:space->staticShapes];
  [assert_equal a:@"()" shapes:space->activeShapes];
  [assert_equal a:@"(inf)" bodies:space->bodies];
  [assert_equal a:@"()" arbiters:space->arbiters];
  [assert_equal a:@"()" contactSet:space->contactSet];
  [assert_equal a:@"()" collFuncSet:space->collFuncSet];

  cpSpaceAddCollisionPairFunc(space, 0, 0, &collisionPairFunc, NULL);
  [assert_equal a:@"(0)" collFuncSet:space->collFuncSet];

  cpJointFree(joint);
  cpBodyFree(body);
  cpSpaceFree(space);

}

@end
