// CG_Base.m
//                           wookay.noh at gmail.com

#import "CG_Base.h"

@implementation CG_Base

+ (id) create:(CGContextRef)ref parent:(id)obj {
  return [[self alloc] init:ref parent:obj];
}

- (id) init:(CGContextRef)ref parent:(id)obj {
  context = ref; 
  parent = obj;
  ok = [NSMutableArray array];
  return self;
}

- (void) called:(id)func {
  [ok addObject:func];
  if (parent) {
    [parent called:func];
  }
}

- (id) description {
  return [NSString stringWithFormat:@"%@", ok];
}

- (int) count {
  return -1;
}

@end
