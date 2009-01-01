// TestPosts.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestPosts

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id posts;

  posts = [me2day get_posts:@"codian" count:10 from:@"2007-02-24"];
  if (LOCAL_TEST) {
    posts = fixture(@"codian_count_10_from_2007-02-24.json");
  }
  [assert_equal a:@"안녕하셈" b:[[posts first] body]];

  [me2day release];
}

@end
