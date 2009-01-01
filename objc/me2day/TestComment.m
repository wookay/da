// TestComment.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestComment

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id response = [me2day get_comments:@"p3"];
  if (LOCAL_TEST) {
    response = fixture(@"comments.json");
  }
  [assert_equal int:5 int:[[response comments] count]];

  response = [me2day track_comments:@"kkung"];
  if (LOCAL_TEST) {
    response = fixture(@"track_comments.json");
  }
  [assert_equal int:1 int:[[response comment_to_mes] count]];
  [assert_equal int:1 int:[[response comment_by_mes] count]];

  //me2day = [[Me2day alloc] username:USERNAME userkey:USERKEY];
  //response = [me2day delete_comment:@"c_9xkg"];
  //response = [me2day create_comment:@"http://me2day.net/wookay/2008/03/12#13:33:34" body:@"\"테스트입니다\":http://me2day.net/wookay/2008/03/12#13:33:34  "];
  //id code = (id) [response code];
  //if (code) {
  //  if (1004 == [code intValue]) {
  //    [assert_equal a:@"파라미터가 올바르지 않습니다." b:[response message]];
  //  } else {
  //    [assert_equal a:@"성공했습니다." b:[response message]];
  //  }
  //}

  [me2day release];
}

@end
