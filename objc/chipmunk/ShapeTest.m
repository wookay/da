// ShapeTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation ShapeTest

- (void) unittest {

  cpBody* body = cpBodyNew(INFINITY, INFINITY);
  cpShape* shape = NULL;

  shape = cpCircleShapeNew(body, 5, cpv(2, 3)); // body radius offset
  [assert_equal int:CP_CIRCLE_SHAPE int:shape->klass->type];
  // Coefficient of restitution. (elasticity)
  [assert_equal float:0 float:shape->e];
  // Coefficient of friction
  [assert_equal float:0 float:shape->u];
  // Surface velocity used when solving for friction.
  [assert_equal cpVect:cpvzero cpVect:shape->surface_v];
  // User defined collision type for the shape.
  [assert_equal float:0 float:shape->collision_type];
  // User defined collision group for the shape.
  [assert_equal float:0 float:shape->group];
  // User defined layer bitmask for the shape.
  [assert_equal float:0xFFFF float:shape->layers];
  // User defined data pointer for the shape.
  [assert_equal a:NULL b:shape->data];
  cpShapeFree(shape);

  shape = cpSegmentShapeNew(body, cpv(2, 5), cpv(2, 5), 10.0); // body a b r
  [assert_equal int:CP_SEGMENT_SHAPE int:shape->klass->type];
  [assert_equal float:0 float:shape->e];
  [assert_equal float:0 float:shape->u];
  [assert_equal cpVect:cpvzero cpVect:shape->surface_v];
  [assert_equal float:0 float:shape->collision_type];
  [assert_equal float:0 float:shape->group];
  [assert_equal float:0xFFFF float:shape->layers];
  [assert_equal a:NULL b:shape->data];
  cpShapeFree(shape);
  
  cpVect verts[3] = { cpv(1, 1), cpv(2, 2), cpv(3, 3) };
  // body numVerts verts offset
  shape = cpPolyShapeNew(body, 3, verts, cpv(0, 2));
  [assert_equal int:CP_POLY_SHAPE int:shape->klass->type];
  [assert_equal int:3 int:((cpPolyShape*)shape)->numVerts];
  [assert_equal cpVect:cpv(1, 3) cpVect:((cpPolyShape*)shape)->tVerts[0]];
  [assert_equal cpVect:cpv(2, 4) cpVect:((cpPolyShape*)shape)->tVerts[1]];
  [assert_equal cpVect:cpv(3, 5) cpVect:((cpPolyShape*)shape)->tVerts[2]];
  cpShapeFree(shape);

  cpBodyFree(body);

}

@end
