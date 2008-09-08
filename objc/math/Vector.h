// Vector.h
//                           wookay.noh at gmail.com

#import <QuartzCore/QuartzCore.h>

@interface Vector : CIVector {
}
- (float) length ;
- (id) normalize ;
- (id) plus:(id)vector ;
- (id) minus:(id)vector ;
- (id) scale:(float)k ;
- (float) dot:(id)vector ;
- (id) projection:(Vector*)vector ;

+ (id) vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z ; 
@end
