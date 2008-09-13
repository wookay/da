// test.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import "../unittest/UnitTest.h"

@interface NSObjectTest : UnitTestable {
  NSString* name;
  int age;
} 
@end

@interface NSNumberTest : UnitTestable {} @end
@interface NSStringTest : UnitTestable {} @end
@interface NSArrayTest : UnitTestable {} @end
@interface NSMutableArrayTest : UnitTestable {} @end
@interface NSMutableSetTest : UnitTestable {} @end
@interface NSMutableDictionaryTest : UnitTestable {} @end
@interface NSDataTest : UnitTestable {} @end
@interface NSDateTest : UnitTestable {} @end
@interface NSExceptionTest : UnitTestable {} @end
@interface NSErrorTest : UnitTestable {} @end
@interface NSProcessInfoTest : UnitTestable {} @end
@interface NSNotificationTest : UnitTestable {} @end
@interface NSBundleTest : UnitTestable {} @end
@interface DataTypesTest : UnitTestable {} @end
