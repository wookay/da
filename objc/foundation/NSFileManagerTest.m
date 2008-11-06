// NSFileManagerTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSFileManagerTest

- (void) unittest {

  NSFileManager* fileManager = [NSFileManager defaultManager];
  NSString* path = @".";
  NSString* displayName = [fileManager displayNameAtPath:path];
  NSString* pathExtension = [displayName pathExtension];
  [assert_equal a:@"foundation" b:displayName];
  [assert_equal a:@"" b:pathExtension];

}

@end
