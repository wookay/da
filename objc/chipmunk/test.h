// test.h
//                           wookay.noh at gmail.com

#import "src/chipmunk.h"
#import "../unittest/UnitTest.h"

@interface BodyTest : UnitTestable {} @end
@interface SpaceTest : UnitTestable {} @end
@interface ShapeTest : UnitTestable {} @end
@interface JointTest : UnitTestable {} @end

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
