// GL.m
//                           wookay.noh at gmail.com

#import "GL.h"

@implementation GL

- (void) loadIdentity {
  if (context) {
    glLoadIdentity();
  } else {
    [self called:@"glLoadIdentity"];
  }
}

- (void) called:(id)func {
  [ok addObject:func];
}

- (id) description {
  return [NSString stringWithFormat:@"%@", ok];
}

- (int) count {
  return -1;
}

- (id) init {
  ok = [NSMutableArray array];
  return self;
}

+ (id) create {
  return [[self alloc] init];
}

@end
