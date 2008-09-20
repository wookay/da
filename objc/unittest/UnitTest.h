// UnitTest.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h> 
#import <QuartzCore/CATransform3D.h>

@interface UnitTest : NSObject {
  int passedCount;
  int failedCount;

  id currentTargetClass;
  NSMutableArray* builder;
}

- (void) a:(id)expected b:(id)got ;
- (void) a:(id)expected SEL:(SEL)got ;
- (void) a:(id)expected Class:(Class)got ;
- (void) a:(id)expected NSRange:(NSRange)got ;
- (void) a:(id)expected CGPoint:(CGPoint)got ;
- (void) a:(id)expected CGSize:(CGSize)got ;
- (void) a:(id)expected CGRect:(CGRect)got ;
- (void) a:(id)expected CGAffineTransform:(CGAffineTransform)got ;
- (void) a:(id)expected CATransform3D:(CATransform3D)got ;
- (void) bool:(BOOL)expected bool:(BOOL)got ;
- (void) _true:(BOOL)got ;
- (void) _false:(BOOL)got ;
- (void) _nil:(id)got ;
- (void) int:(int)expected int:(int)got ;
- (void) int:(int)expected b:(id)got ;
- (void) float:(float)expected float:(float)got ; 
- (void) float:(float)expected b:(id)got ; 

- (int) passedCount ;
- (int) failedCount ;
- (void) report ;
- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got ;
- (void) passed:(id)expected got:(id)got ;
- (void) failed:(id)expected got:(id)got ;
- (void) puts:(id)message ;
- (void) run:(id)targetClassString ;
- (void) buildup:(bool)success expected:(id)expected got:(id)got ;

+ (id) create ;
+ (id) createBuilder ;
- (NSArray*) builder ;

@end



@interface UnitTestable : NSObject {
  id assert_equal;
}
- (void) unittest ;
+ (id) create:(id)obj ;
@end
