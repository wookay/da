// Matrix.h
//                           wookay.noh at gmail.com

#import <QuartzCore/QuartzCore.h>

@interface Matrix : NSObject {
  NSMutableArray* rows;
}

- (id) plus:(id)matrix ;
- (id) minus:(id)matrix ;
- (id) multiply:(id)matrix ;
- (id) operator:(CFStringRef)op with:(id)matrix ;
- (id) transpose ;

- (id) getElement:(int)i j:(int)j ;
- (void) setElement:(int)i j:(int)j with:(id)obj ;
- (int) row_size ;
- (int) column_size ;
- (NSString*) description ;

+ (id) zero:(int)size ;
+ (id) zero:(int)m by:(int)n ;
+ (id) identity:(int)size ;
+ (id) scalar:(int)size int:(int)value ;
+ (id) scalar:(int)size float:(float)value ;
+ (id) diagonal:(NSArray*)values ;

+ (id) matrixWithRows:(NSArray*)rows ;
+ (id) matrixWithColumns:(NSArray*)columns ;
+ (NSArray*) numbersFromString:(NSString*)string ;
+ (NSArray*) rowsFromString:(NSString*)string ;

@end