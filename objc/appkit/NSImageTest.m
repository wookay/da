// NSImageTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSImageTest

- (void) unittest:(id)assert_equal {

  NSImage* image = [[NSImage alloc] initWithContentsOfFile:@"Brad.png"];
  [assert_equal a:@"{336.077, 466.106}" NSSize:[image size]];
  [assert_equal a:@"NSCalibratedWhiteColorSpace 0 0" b:[image backgroundColor]];

  NSImageRep* rep = [NSImageRep imageRepWithContentsOfFile:@"Brad.png"];
  [assert_equal a:@"{336.077, 466.106}" NSSize:[rep size]];
  [assert_equal int:336 int:[rep pixelsWide]];
  [assert_equal int:466 int:[rep pixelsHigh]];

}

@end
