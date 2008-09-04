// UnitTest.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h> 

@interface UnitTest : NSObject {
  NSMutableArray* passed;
  NSMutableArray* failed;
}

- (void) a:(id)expected b:(id)got ;
- (void) bool:(BOOL)expected bool:(BOOL)got ;
- (void) _true:(BOOL)got ;
- (void) _false:(BOOL)got ;
- (void) int:(int)expected int:(int)got ;
- (void) int:(int)expected b:(id)got ;
- (void) float:(float)expected float:(float)got ; 
- (void) float:(float)expected b:(id)got ; 

- (void) report ;
- (void) add_result:(BOOL)cond expected:(id)expected got:(id)got ;

@end
