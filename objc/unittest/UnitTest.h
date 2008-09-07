// UnitTest.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h> 

@interface UnitTest : NSObject {
  NSMutableArray* passed;
  NSMutableArray* failed;
}

- (void) a:(id)expected b:(id)got ;
- (void) a:(id)expected NSPoint:(NSPoint)got ;
- (void) a:(id)expected NSSize:(NSSize)got ;
- (void) a:(id)expected NSRect:(NSRect)got ;
- (void) a:(id)expected NSRange:(NSRange)got ;
- (void) a:(id)expected NSAffineTransformStruct:(NSAffineTransformStruct)got ;
- (void) a:(id)expected CGPoint:(CGPoint)got ;
- (void) a:(id)expected CGSize:(CGSize)got ;
- (void) a:(id)expected CGRect:(CGRect)got ;
- (void) a:(id)expected Class:(Class)got ;
- (void) a:(id)expected SEL:(SEL)got ;
- (void) bool:(BOOL)expected bool:(BOOL)got ;
- (void) _true:(BOOL)got ;
- (void) _false:(BOOL)got ;
- (void) _nil:(id)got ;
- (void) int:(int)expected int:(int)got ;
- (void) int:(int)expected b:(id)got ;
- (void) float:(float)expected float:(float)got ; 
- (void) float:(float)expected b:(id)got ; 

- (void) report ;
- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got ;
- (void) puts:(id)message ;
- (void) run:(id)targetClass ;

@end



@interface UnitTestable : NSObject {
}
- (void) unittest:(id)assert_equal ;
@end
