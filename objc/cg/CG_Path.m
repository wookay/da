// CG_Path.m
//                           wookay.noh at gmail.com

#import "CG_Path.h"

@implementation CG_Path

- (void) addArc:(id)_ x:(float)x y:(float)y radius:(float)radius startAngle:(float)startAngle endAngle:(float)endAngle clockwise:(int)clockwise {
  if (context) {
    CGContextAddArc(context, x, y, radius, startAngle, endAngle, clockwise);
  } else {
    [self called:@"CGContextAddArc"];
  }
}

- (void) addArcToPoint:(id)_ x1:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius {
  if (context) {
    CGContextAddArcToPoint(context, x1, y1, x2, y2, radius);
  } else {
    [self called:@"CGContextAddArcToPoint"];
  }
}

- (void) addCurveToPoint:(id)_ cp1x:(float)cp1x cp1y:(float)cp1y cp2x:(float)cp2x cp2y:(float)cp2y x:(float)x y:(float)y {
  if (context) {
    CGContextAddCurveToPoint(context, cp1x, cp1y, cp2x, cp2y, x, y);
  } else {
    [self called:@"CGContextAddCurveToPoint"];
  } 
}

- (void) addEllipseInRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height {
  if (context) {
    CGContextAddEllipseInRect(context, CGRectMake(x, y, width, height));
  } else {
    [self called:@"CGContextAddEllipseInRect"];
  }
}

- (void) addLines:(id)_ points:(const CGPoint [])points count:(int)count {
  if (context) {
    CGContextAddLines(context, points, count);
  } else {
    [self called:@"CGContextAddLines"];
  }
}

- (void) addLineToPoint:(id)_ x:(float)x y:(float)y {
  if (context) {
    CGContextAddLineToPoint(context, x, y);
  } else {
    [self called:@"CGContextAddLineToPoint"];
  }
}

- (void) moveToPoint:(id)_ x:(float)x y:(float)y {
  if (context) {
    CGContextMoveToPoint(context, x, y);
  } else {
    [self called:@"CGContextMoveToPoint"];
  }
}


- (void) strokeRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height {
  if (context) {
    CGContextStrokeRect(context, CGRectMake(x, y, width, height));
  } else {
    [self called:@"CGContextStrokeRect"];
  }
}

- (bool) empty:(char)q {
  if (context) {
    return CGContextIsPathEmpty(context);
  } else {
    [self called:@"CGContextIsPathEmpty"];
    return false;
  }
}

@end
