// CG.h
//                           wookay.noh at gmail.com

#import "CG_Base.h"
#import "CG_Path.h"

@interface CG : CG_Base {
}

- (id) path;
- (CGContextRef) context ;
+ (id) create:(CGContextRef)ref ;

@end
