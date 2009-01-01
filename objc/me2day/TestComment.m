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
  NSLog(@"r %@", response);
  [assert_equal a:@"파라미터가 올바르지 않습니다." b:[response valueForKey:@"comments"]];
  //[assert_equal a:@"파라미터가 올바르지 않습니다." b:[response comments]];


  //me2day = [[Me2day alloc] username:USERNAME userkey:USERKEY];
  //response = [me2day delete_comment:@"c_9xkg"];
  //response = [me2day create_comment:@"http://me2day.net/wookay/2008/03/12#13:33:34" body:@"\"테스트입니다\":http://me2day.net/luis/2008/03/12#13:33:34  "];
  //if (response) {
  //  NSLog(@"%@", response);
  //  id code = (id) [response code];
  //  if (code) {
  //    if (1004 == [code intValue]) {
  //      [assert_equal a:@"파라미터가 올바르지 않습니다." b:[response message]];
  //    } else {
  //      [assert_equal a:@"성공했습니다." b:[response message]];
  //    }
  //  }
  //}


//  id response = [me2day track_comments:username];
////  [assert_equal a:@"0" b:[response valueForKey:@"comment_by_mes"]];
//  [assert_equal a:@"0" b:[response valueForKey:@"comment_to_mes"]];


  [me2day release];
}

@end
