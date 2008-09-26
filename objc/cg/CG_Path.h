// CG_Path.h
//                           wookay.noh at gmail.com

#import "CG_Base.h"

@interface CG_Path : CG_Base {
}

- (void) addArc:(id)_ x:(float)x y:(float)y radius:(float)radius startAngle:(float)startAngle endAngle:(float)endAngle clockwise:(int)clockwise ;
- (void) addArcToPoint:(id)_ x1:(float)x1 y1:(float)y1 x2:(float)x2 y2:(float)y2 radius:(float)radius ;
- (void) addCurveToPoint:(id)_ cp1x:(float)cp1x cp1y:(float)cp1y cp2x:(float)cp2x cp2y:(float)cp2y x:(float)x y:(float)y ;
- (void) addEllipseInRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height ;
- (void) addLines:(id)_ points:(const CGPoint [])points count:(int)count ;
- (void) addLineToPoint:(id)_ x:(float)x y:(float)y ; 
- (void) moveToPoint:(id)_ x:(float)x y:(float)y ;
- (void) strokeRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height ;
- (bool) empty:(char)q ;

@end
