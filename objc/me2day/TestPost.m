// TestPost.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestPost

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id post;

  post = [me2day get_post:@"http://me2day.net/codian/2007/02/24#20:13:59"];
  if (LOCAL_TEST) {
    post = [fixture(@"p3.json") first];
  }
  [assert_equal a:@"지금 시각은 여전히 토요일 오후 8시 13분입니다."
                b:[post body]];

  post = [me2day get_post:@"p6myw"];
  if (LOCAL_TEST) {
    post = [fixture(@"p6myw.json") first];
  }
  [assert_equal a:@"me2photo" b:[post contentType]];

  [me2day release];

}

@end
