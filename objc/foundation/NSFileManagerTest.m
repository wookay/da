// NSFileManagerTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation TestSuite (NSFileManager)

- (void) test_NSFileManager {

  NSFileManager* fileManager = [NSFileManager defaultManager];
  NSString* path = @".";
  NSString* displayName = [fileManager displayNameAtPath:path];
  NSString* pathExtension = [displayName pathExtension];
  assert_equal(@"foundation", displayName);
  assert_equal(@"", pathExtension);

}

@end
