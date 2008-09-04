// NSBoxTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSBoxTest

- (void) unittest:(id)assert_equal {

  NSBox* box = [[NSBox alloc] init];
  [assert_equal a:@"Title" b:[box title]];
  [box setTitle:@"title test"];
  [assert_equal a:@"title test" b:[box title]];
  [assert_equal _false:[box isInFullScreenMode]];

}

@end
