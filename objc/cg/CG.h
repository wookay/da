// CG.h
//                           wookay.noh at gmail.com

#import "CG_Base.h"
#import "CG_Path.h"

@interface CG : CG_Base {
}

- (void) fillRect:(id)_ x:(float)x y:(float)y width:(float)width height:(float)height ;
- (void) setRGBFillColor:(id)_ red:(float)red green:(float)green blue:(float)blue ;
- (void) setRGBFillColor:(id)_ red:(float)red green:(float)green blue:(float)blue alpha:(float)alpha ;

- (id) path;
- (CGContextRef) context ;
+ (id) create:(CGContextRef)ref ;

@end
