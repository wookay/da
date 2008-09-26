// CG.m
//                           wookay.noh at gmail.com

#import "CG.h"

@implementation CG


- (void) fillRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height {
  if (context) {
    CGContextFillRect(context, CGRectMake(x, y, width, height));
  } else {
    [self called:@"CGContextFillRect"];
  }
}

- (void) setRGBFillColor:(id)_ red:(float)red green:(float)green blue:(float)blue {
  return [self setRGBFillColor:_ red:red green:green blue:blue alpha:1.0f];
}

- (void) setRGBFillColor:(id)_ red:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
  if (context) {
    CGContextSetRGBFillColor(context, red, green, blue, alpha);
  } else {
    [self called:@"CGContextSetRGBFillColor"];
  }
}

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
