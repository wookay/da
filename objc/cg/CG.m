// CG.m
//                           wookay.noh at gmail.com

#import "CG.h"

@implementation CG

+ (id) create:(CGContextRef)ref {
  return [self create:ref parent:nil];
}

- (id) path {
  return [CG_Path create:context parent:self];
}

- (CGContextRef) context {
  return context;
}

@end
