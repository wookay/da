// BodyTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation BodyTest

- (void) unittest {

  cpBody* body = cpBodyNew(INFINITY, INFINITY);
  [assert_equal float:INFINITY float:body->m]; // mass
  [assert_equal float:INFINITY float:body->i]; // moment
  [assert_equal cpVect:cpvzero cpVect:body->p]; // pos
  [assert_equal cpVect:cpvzero cpVect:body->v]; // vel
  [assert_equal cpVect:cpvzero cpVect:body->f]; // force
  [assert_equal float:0 float:body->a]; // angle
  [assert_equal float:0 float:body->w]; // avel
  [assert_equal float:0 float:body->t]; // torque
  [assert_equal cpVect:cpv(1, 0) cpVect:body->rot]; // rot

  cpBodySetMass(body, 1);
  [assert_equal float:1 float:body->m];

  cpBodySetMoment(body, 2);
  [assert_equal float:2 float:body->i];

  cpBodySetAngle(body, M_PI);
  [assert_equal float:M_PI float:body->a];
  [assert_equal cpVect:cpv(-1, 0) cpVect:body->rot];

  cpVect pos = cpv(2, 3);
  cpBodySlew(body, pos, 1);
  [assert_equal cpVect:cpv(2, 3) cpVect:body->v];
  cpBodySlew(body, pos, 2);
  [assert_equal cpVect:cpv(1, 1.5) cpVect:body->v];
  cpBodySlew(body, pos, 4);
  [assert_equal cpVect:cpv(0.5, 0.75) cpVect:body->v];
  cpBodySlew(body, pos, 10);
  [assert_equal cpVect:cpv(0.2, 0.3) cpVect:body->v];

  [assert_equal cpVect:cpv(0.2, 0.3) cpVect:body->v];
  cpVect gravity = cpv(0, 0);
  cpFloat damping = 10;
  cpBodyUpdateVelocity(body, gravity, damping, 1);
  [assert_equal cpVect:cpv(2, 3) cpVect:body->v];
  [assert_equal float:0 float:body->w];

  [assert_equal cpVect:cpv(0, 0) cpVect:body->p];
  [assert_equal cpVect:cpv(2, 3) cpVect:body->v];
  cpBodyUpdatePosition(body, 10);
  [assert_equal cpVect:cpv(20, 30) cpVect:body->p];
  cpBodyUpdatePosition(body, 1);
  [assert_equal cpVect:cpv(22, 33) cpVect:body->p];
  cpBodyUpdatePosition(body, 1);
  [assert_equal cpVect:cpv(24, 36) cpVect:body->p];
  
  cpVect f = cpv(5, 5);
  cpVect r = cpv(10, 10);
  cpBodyApplyForce(body, f, r);
  [assert_equal cpVect:cpv(5, 5) cpVect:body->f];
  [assert_equal float:0 float:body->t];

  [assert_equal cpVect:cpv(5, 5) cpVect:body->f];
  cpBodyResetForces(body);
  [assert_equal cpVect:cpv(0, 0) cpVect:body->f];

  cpBodyFree(body);

  cpBodySlew(body, pos, 1);
  cpBody* a = cpBodyNew(INFINITY, INFINITY);
  cpBody* b = cpBodyNew(INFINITY, INFINITY);
  b->p = cpv(0, 2);
  [assert_equal cpVect:cpv(0, 0) cpVect:a->p];
  [assert_equal cpVect:cpv(0, 2) cpVect:b->p];
  cpVect anchr1 = cpv(0, 0);
  cpVect anchr2 = cpv(2, 2);
  cpFloat rlen = 1;
  cpFloat k = 1;
  cpFloat dmp = 1;
  cpFloat dt = 1;
  cpDampedSpring(a, b, anchr1, anchr2, rlen, k, dmp, dt);
  [assert_equal cpVect:cpv(1.553,  3.106) cpVect:a->f];
  [assert_equal cpVect:cpv(-1.553,  -3.106) cpVect:b->f];
  
  cpBodyFree(a);
  cpBodyFree(b);

}

@end
