// Body.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import "src/chipmunk.h"

@interface Body : NSObject {
  cpBody* body;
}

- (id) initWithMass:(float)mass inertia:(float)inertia ;
- (void) setMass:(float)mass ;
- (float) mass ;

@end
