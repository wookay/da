// TestCommentList.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestCommentList

- (void) unittest {

  Topic* topic = [Topic find:@"Objective-C"];
  CommentList* comments = topic.comments;
  if (LOCAL_TEST) {
    comments.raw_data = fixture(@"comments.xml");
  }
  [assert_equal int:5 int:comments.length];

  [assert_equal a:nil b:comments.first.body];
  [assert_equal a:@"객체지향 프로그래밍을 하는 것이나, 기민한 부분에 있어서는 Smalltalk를 따르지 못하고, 퍼포먼스에서는 C++을 따르지 못한다. Cocoa는 제발 Objective-C를 버렸으면 좋겠다."
                b:comments.last.body];
  //for(id comment in comments) {
  //  NSLog(@"%@", comment);
  //}

}

@end
