// test.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import "../unittest/UnitTest.h"

@interface NSObjectTest : NSObject {}
- (void) unittest:(id)assert_equal ;
@end

@interface NSNumberTest : NSObjectTest {} @end
@interface NSStringTest : NSObjectTest {} @end
@interface NSArrayTest : NSObjectTest {} @end
@interface NSMutableArrayTest : NSObjectTest {} @end
@interface NSMutableSetTest : NSObjectTest {} @end
@interface NSMutableDictionaryTest : NSObjectTest {} @end
