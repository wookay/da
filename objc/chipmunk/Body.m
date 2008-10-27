// Body.m
//                           wookay.noh at gmail.com

#import "Body.h"

@implementation Body

- (id) initWithMass:(float)mass inertia:(float)inertia {
  body = cpBodyNew(mass, inertia);
  return self;
}

- (void) dealloc {
  cpBodyFree(body);
  [super dealloc];
}

- (void) setMass:(float)mass {
  cpBodySetMass(body, mass);
}

- (float) mass {
  return body->m;
}

- (id) description {
  return [NSString stringWithFormat:@"body{mass: %g, inertia: %g}",
    body->m, body->i
  ];
}

@end
