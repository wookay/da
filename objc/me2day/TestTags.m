// TestTags.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestTags

- (void) unittest {

  id me2day = [[Me2day alloc] init];
  id tags;

  tags = [me2day get_tags:@"dahlia"];
  if (LOCAL_TEST) {
    tags = fixture(@"tags.json");
  }
  [assert_equal a:@"dahlia" b:[tags tagsOf]];
  [assert_equal int:100 int:[[tags tags] count]];

  [me2day release];

}

@end
