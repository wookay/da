// UnitTestCategory.h
//                           wookay.noh at gmail.com

#import "../unittest/UnitTest.h"
#import "src/chipmunk.h"

@interface UnitTest (Chipmunk)

- (void) cpVect:(cpVect)expected cpVect:(cpVect)got ;
- (void) a:(id)expected cpVect:(cpVect)got ;
- (void) a:(id)expected joints:(cpArray*)got ;
- (void) a:(id)expected bodies:(cpArray*)got ;
- (void) a:(id)expected arbiters:(cpArray*)got ;
- (void) a:(id)expected shapes:(cpSpaceHash*)got ;
- (void) a:(id)expected contactSet:(cpHashSet*)got ;
- (void) a:(id)expected collFuncSet:(cpHashSet*)got ;
- (void) a:(id)expected cpHashSet:(cpHashSet*)got ;

@end
