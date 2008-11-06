// SpaceTest.m
//                           wookay.noh at gmail.com

#import "test.h"

int collisionPairFunc(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
  return 0;
}

void bodyVelocityFunc(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt) {
  body->v = cpvadd(cpvmult(body->v, damping), cpvmult(cpvadd(gravity, cpvmult(body->f, body->m_inv)), dt));
  body->w = body->w*damping + body->t*body->i_inv*dt;
}

void bodyPositionFunc(cpBody *body, cpFloat dt) {
  body->p = cpvadd(body->p, cpvmult(cpvadd(body->v, body->v_bias), dt));
  cpBodySetAngle(body, body->a + (body->w + body->w_bias)*dt);
  body->v_bias = cpvzero;
  body->w_bias = 0.0f;
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

  [assert_equal cpVect:cpvzero cpVect:body->v];
  [assert_equal cpVect:cpvzero cpVect:body->p];
  body->velocity_func = bodyVelocityFunc;
  body->position_func = bodyPositionFunc;
  float dt = 1;
  cpSpaceStep(space, dt);
  [assert_equal a:@"(nan, nan)" cpVect:body->v];
  [assert_equal cpVect:cpv(0, 0) cpVect:body->p];

  cpJointFree(joint);
  cpBodyFree(body);
  cpSpaceFree(space);

}

@end
