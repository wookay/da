// TestTopic.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestTopic

- (void) unittest {

  Topic* topic = [Topic find:@"Objective-C"];
  if (LOCAL_TEST) {
    topic.raw_data = fixture(@"topic.xml");
  }
  [assert_equal a:@"Objective-C" b:topic.name];
  [assert_equal a:@"objective-c" b:topic.normalized_name];
  [assert_equal a:@"Objective-C" b:topic.usual_name];

  [assert_equal int:-10 int:topic.degree.total];
  [assert_equal int:20 int:topic.degree.plus];
  [assert_equal int:30 int:topic.degree.minus];
  [assert_equal int:5 int:topic.people.total];
  [assert_equal int:2 int:topic.people.plus];
  [assert_equal int:3 int:topic.people.minus];
  [assert_equal int:40 int:topic.percent.total];
  [assert_equal int:40 int:topic.percent.plus];
  [assert_equal int:60 int:topic.percent.minus];

  CommenterList* commenters = topic.commenters;
  if (LOCAL_TEST) {
    commenters.raw_data = fixture(@"commenters.xml"); 
  }
  [assert_equal int:2 int:commenters.plus.count];

  CommentList* comments = topic.comments;
  if (LOCAL_TEST) {
    comments.raw_data = fixture(@"comments.xml");
  }
  [assert_equal int:5 int:comments.all.count];

}

@end
