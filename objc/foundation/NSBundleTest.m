// NSBundleTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSBundle)

- (void) test_NSBundle {

  NSBundle* bundle = [NSBundle bundleWithPath:@"/etc/hosts"];
  NSString* path = [bundle bundlePath];
  NSData* data = [NSData dataWithContentsOfFile:path];

  NSString* contents = [[NSString alloc] initWithData:data
                                         encoding:NSUTF8StringEncoding];
  NSString* contentsOfFile = [NSString stringWithContentsOfFile:path
                                       encoding:NSUTF8StringEncoding error:nil];
  assert_equal([contents length], [contentsOfFile length]);

}

@end
