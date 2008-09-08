// NSImageTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSImageTest

- (void) unittest:(id)assert_equal {

  NSImage* image = [[NSImage alloc] initWithContentsOfFile:@"Brad.png"];
  [assert_equal a:@"{336.077, 466.106}" NSSize:[image size]];
  [assert_equal a:@"NSCalibratedWhiteColorSpace 0 0" b:[image backgroundColor]];

  NSBitmapImageRep* bitmap =
    [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
  NSDictionary* properties =
    [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:0.9f]
                  forKey:NSImageCompressionFactor];
  NSData* data = [bitmap representationUsingType:NSJPEGFileType
                         properties:properties];
  [data writeToFile:@"Brad.jpg" atomically:NO];

  image = [[NSImage alloc] initWithContentsOfFile:@"Brad.jpg"];
  [assert_equal a:@"{336, 466}" NSSize:[image size]];

  NSFileManager* manager = [NSFileManager defaultManager];
  [manager removeItemAtPath:@"Brad.jpg" error:NULL];

}

@end
