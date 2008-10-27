// BodyTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation BodyTest

- (void) unittest {

  Body* body = [[Body alloc] initWithMass:1 inertia:2];
  [assert_equal a:@"body{mass: 1, inertia: 2}" b:body];
  [assert_equal float:1 float:body.mass];

}

@end
