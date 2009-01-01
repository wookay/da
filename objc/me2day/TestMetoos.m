// TestMetoos.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestMetoos

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id metoos;

  metoos = [me2day get_metoos:@"p1"];
  if (LOCAL_TEST) {
    metoos = fixture(@"metoos_p1.json");
  }
  [assert_equal a:@"p1" b:[metoos post_id]];
  [assert_equal int:11 int:[[metoos metoos] count]];

  [me2day release];

}

@end
