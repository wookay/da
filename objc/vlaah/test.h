// test.h
//                           wookay.noh at gmail.com

#import "base.h"
#import "topic.h"
#import "person.h"
#define __AIFF__
#import "comment.h"
#import "unit.h"
#import "comment_list.h"
#import "commenter_list.h"
#import "../unittest/UnitTest.h"

id fixture(id file) ;

@interface TestBase : UnitTestable {} @end
@interface TestTopic : UnitTestable {} @end
@interface TestPerson : UnitTestable {} @end
@interface TestCommentList : UnitTestable {} @end
