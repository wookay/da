// Vector.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface Vector : NSObject {
  NSNumber *X, *Y, *Z;
}

- (float) X ;
- (float) Y ;
- (float) Z ;

- (float) length ;
- (id) normalize ;
- (id) plus:(id)vector ;
- (id) minus:(id)vector ;
- (id) scale:(float)k ;
- (float) dot_product:(id)vector ;
- (id) cross_product:(Vector*)vector ;
- (id) projection:(Vector*)vector ;

+ (id) vectorWithX:(float)x Y:(float)y Z:(float)z ; 
@end
