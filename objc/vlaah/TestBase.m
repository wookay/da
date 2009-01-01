// TestBase.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestBase

- (void) unittest {

  Base* base = [[Base alloc] init];
  id raw_data = [base raw_data:@"Objective-C"];

  if (LOCAL_TEST) {
    raw_data = fixture(@"topic.xml");
  }

  [assert_equal a:@"NSCFString" b:[raw_data class]];

}

@end
