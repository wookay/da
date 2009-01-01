// test.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import "../unittest/UnitTest.h"
#import "JSON/JSON.h"
#import "me2util.h"
#import "me2array.h"
#import "me2dictionary.h"
#import "me2day.h"
#import "config.h"

id fixture(id file) ;

@interface TestPost : UnitTestable {} @end
@interface TestPosts : UnitTestable {} @end
@interface TestPerson : UnitTestable {} @end
@interface TestMetoos : UnitTestable {} @end
@interface TestFriends : UnitTestable {} @end

@interface TestNoop : UnitTestable {} @end
@interface TestComment : UnitTestable {} @end
@interface TestSetting : UnitTestable {} @end
