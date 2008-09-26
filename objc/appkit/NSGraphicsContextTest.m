// NSGraphicsContextTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSGraphicsContextTest

- (void) unittest {

  NSImage* image = [[NSImage alloc] initWithSize:NSMakeSize(100, 100)];
  NSBitmapImageRep* bitmap =
    [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
  NSGraphicsContext* context = [NSGraphicsContext graphicsContextWithBitmapImageRep:bitmap];
  [assert_equal a:nil b:context];
}

@end
