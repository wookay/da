// CG_Base.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface CG_Base : NSObject {
  CGContextRef context;
  id parent;
  NSMutableArray* ok;
}

- (void) called:(id)func ;
- (id) init:(CGContextRef)ref parent:(id)obj ;
+ (id) create:(CGContextRef)ref parent:(id)obj ;

@end
