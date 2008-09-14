// NSImageTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSImageTest

- (void) unittest {

  NSImage* image = [[NSImage alloc] initWithContentsOfFile:@"../touch/images/Icon.png"];
  [assert_equal a:@"NSCalibratedWhiteColorSpace 0 0" b:[image backgroundColor]];

  NSBitmapImageRep* bitmap =
    [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];

  //NSDictionary* properties =
  //  [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:1.0f]
  //                forKey:NSImageCompressionFactor];
  NSData* data = [bitmap representationUsingType:NSPNGFileType
                         properties:nil];
  [data writeToFile:@"Icon.png" atomically:NO];

  NSFileManager* manager = [NSFileManager defaultManager];
  [manager removeItemAtPath:@"Icon.png" error:NULL];

}

@end
